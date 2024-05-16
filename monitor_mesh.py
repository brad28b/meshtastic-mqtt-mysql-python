#!/usr/bin/python3

import paho.mqtt.client as mqtt
import pymysql
import json

# MySQL database configuration
servername = "localhost"
username = "meshtastic"
password = "YOUR_PASSWORD"
dbname = "meshtastic"

# MQTT broker configuration
broker_address = "192.168.x.x"
broker_port = 1883
client_id = "mesh-monitor-py"
topic = "Meshtastic/2/json/LongFast/!da5ed0a0" # replace !da5ed0a0 with your own Node ID

# You should not need to modify anything beyong here

# Connect to MySQL database
conn = pymysql.connect(host=servername, user=username, password=password, database=dbname)

def process_JSON(data, type):
    global conn

    sql_columns = ""
    sql_values = ""
    params = []

    # Build the SQL column names and values
    for field, value in data.items():
        if field != 'payload':
            sql_columns += f"`{field}`,"
            sql_values += "%s,"
            params.append(value)

    payload_value = data.get('payload')
    if isinstance(payload_value, dict):
        for field, value in payload_value.items():
            if isinstance(value, list):
                if field == 'neighbors':
                    # Extract neighbor information and join into a single string
                    field_str = '|'.join([f"node_id:{item['node_id']}:snr:{item['snr']}" for item in value])
                else:
                    field_str = '|'.join(value)  # Concatenate array elements into a string
                sql_columns += f"`payload_{field}`,"
                sql_values += "%s,"
                params.append(field_str)
            else:
                sql_columns += f"`payload_{field}`,"
                sql_values += "%s,"
                params.append(value)
    else:
        # Handle the case where payload is not a dictionary with iterable values
        sql_columns += "`payload_route`,"
        sql_values += "%s,"
        params.append(payload_value)

    # Remove trailing commas
    sql_columns = sql_columns.rstrip(",")
    sql_values = sql_values.rstrip(",")

    # Prepare the SQL statement
    sql = f"INSERT INTO `{type}` ({sql_columns}) VALUES ({sql_values})"
    cursor = conn.cursor()
    cursor.execute(sql, params)
    conn.commit()

    print("New record created successfully")
    print("")

    cursor.close()

def on_connect(client, userdata, flags, rc):
    client.subscribe(topic)

def on_message(client, userdata, msg):
    print(msg.payload.decode())
    print("")
    data = json.loads(msg.payload)
    known_types = ['traceroute', 'telemetry', 'text', 'neighborinfo', 'nodeinfo', 'position']
    if data['type'] in known_types:
        process_JSON(data, data['type'])

mqtt_client = mqtt.Client(client_id=client_id)
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message

try:
    mqtt_client.connect(broker_address, broker_port, 60)
    mqtt_client.loop_forever()
except KeyboardInterrupt:
    print("\nExiting...")
    mqtt_client.disconnect()
    conn.close()
