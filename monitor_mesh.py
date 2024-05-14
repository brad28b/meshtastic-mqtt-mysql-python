#!/usr/bin/python3

import paho.mqtt.client as mqtt
import pymysql
import json

# MySQL database configuration
servername = "localhost"
username = "meshtastic"
password = "YOUR_PASSWORD_HERE"
dbname = "meshtastic"

# MQTT broker configuration
broker_address = "192.168.X.X"
broker_port = 1883
client_id = "mesh-monitor-py"

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

    for field, value in data['payload'].items():
        if isinstance(value, list):
            field_str = '|'.join([f"node_id:{item['node_id']}:snr:{item['snr']}" for item in value])
            sql_columns += f"`payload_{field}`,"
            sql_values += "%s,"
            params.append(field_str)
        else:
            sql_columns += f"`payload_{field}`,"
            sql_values += "%s,"
            params.append(value)

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
#    print("Connected to MQTT broker with result code "+str(rc))
    client.subscribe("Meshtastic/2/json/LongFast/!da5ed0a0")

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

# print("MySQL connection successful")

try:
    mqtt_client.connect(broker_address, broker_port, 60)
    mqtt_client.loop_forever()
except KeyboardInterrupt:
    print("\nExiting...")
    mqtt_client.disconnect()
    conn.close()
