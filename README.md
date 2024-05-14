# meshtastic-mqtt-mysql-python
meshtastic-mqtt-mysql-python is a Python port of https://github.com/brad28b/meshtastic-mqtt-mysql

This Python script, which is run as a shell script daemon, runs permanently in the background, subscribes to the Meshtastic JSON topic on your MQTT server, captures messages delivered from the mesh via MQTT, and imports them into MySQL tables.

Assumed infrastructure layout is: Your Meshtastic Node => Your local MQTT server => Python MQTT subscriber => MySQL server

This script will capture JSON mesh messages of the following types:

nodeinfo

neighborinfo

text

telemetry

position

traceroute

# Requirements:
This Python script is designed to be run as a shell script in a LMPM configuration (Linux, MQTT, Python, MySQL).

Dependencies are as follows:

A meshtastic ESP32V3 based node, for example, a Heltec V3 (nRF nodes don't support MQTT => JSON currently).

Python 3.9+

pymysql (pip install pymysql)

paho-mqtt (pip install "paho-mqtt<2.0.0")

Your own local MQTT server (I use Mosquitto), configured to allow anonymous access

Your own local mysql-server - the database schema is provided in meshtastic.sql

# Instructions:
1) Setup your MQTT server, and configure it to allow anonymous access
2) Configure your Meshtastic node to publish MQTT messages to the IP address of your MQTT server, using the topic "Meshtastic". Make sure that the JSON option is enabled.
3) Make sure that your main (Longfast) channel (usually 0) is set to send MQTT messages from the mesh to your MQTT server (in your smart phone Meshtastic app, ensure "Uplink enabled" is checked for channel 0 / Longfast)
4) Create your MySQL database. Call the database 'meshtastic'. You can use the database schema found in file meshtastic.sql
5) Create a user on your MySQL server, and grant it the necessary permissions to read and write to the database.
6) Edit monitor_mesh.py, and add in the credential values for your MQTT and MYSQL servers, and your Meshtastic node ID.
7) Give monitor_mesh.py execute permissions, using "chmod +x monitor_mesh.py"
8) To run monitor_mesh.py:

If you want to run in background mode, detached from your shell: "nohup ./monitor_mesh.py &> /dev/null &disown"

If you want to run it and view what's happening, just run it like this: "./monitor_mesh.py"

# Caveats
Meshtastic JSON messages contain some fields/elements that are reserved keywords in MySQL (for example, 'from', 'timestamp', and 'to')

To get around any issues you have with interacting with these columns in MySQL, escape them with back ticks, like this:

"SELECT payload_text, \`from\` FROM text WHERE payload_text IS NOT NULL"

Fields of type 'timestamp' are stored in the format they are receieved (Unix Epoch). Select these in a friendly format like this:

"SELECT FROM_UNIXTIME(timestamp) FROM nodeinfo"
