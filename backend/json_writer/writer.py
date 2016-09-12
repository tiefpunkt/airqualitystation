from config import *
from datetime import datetime
from influxdb import InfluxDBClient
import json, os

DIR = os.path.dirname(os.path.realpath(__file__))

with open('%s/nodedb.json' % DIR) as data_file:    
    nodedb = json.load(data_file)

client = InfluxDBClient(host, port, user, password, db_name)

query = 'show tag values from "sensor_values_002" with key = "MAC";'
rs = client.query(query)

nodes = map(lambda x: x['value'], rs.get_points())

query = 'select * from sensor_values_002 GROUP BY MAC ORDER BY time DESC LIMIT 1'
rs = client.query(query)

query = 'select * from sensor_values_002 GROUP BY MAC ORDER BY time ASC LIMIT 1'
rs2 = client.query(query)

nodedata = {}

for node in nodes:
       	result = list(rs.get_points(tags = {"MAC": node}))[0]
       	result2 = list(rs2.get_points(tags = {"MAC": node}))[0]
       	dbdata = nodedb[node]
       	time_since_last_update = datetime.utcnow() - datetime.strptime(result['time'],"%Y-%m-%dT%H:%M:%SZ")
       	online = (time_since_last_update.days * 86400 + time_since_last_update.seconds) < 60 * 5
       	nodedata[node] = {
       		"lastseen": result['time'],
       		"firstseen": result2['time'],
       		"flags": {
       			"online": online,
       			"indoor": dbdata["indoor"]
       			},
       		"statistics": {
       			"pm10": result['pm10'],
       			"pm25": result['pm25'],
       			"pm10_avg": result['pm10_avg'],
       			"pm25_avg": result['pm25_avg'],
       			"temperature": result['temperature'],
       			"humidity": result['humidity'],
       			"uptime": result['uptime'] / 1000
       			},
       		"nodeinfo": {
       			"node_id": node,
       			"software": {
       				"firmware": {
       					"base": "PMsense-ESP",
       					"release": result['firmware']
       					}

       				},
       			"hostname": dbdata['hostname']
       			}
       		}

       	if "owner" in dbdata:
       		nodedata[node]["nodeinfo"]["owner"] = dbdata["owner"]
       	if "location" in dbdata:
       		nodedata[node]["nodeinfo"]["location"] = dbdata["location"]

data = { "version":1, "nodes": nodedata, "timestamp": datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%S")}

with open('%s/nodes.json' % DIR, 'w') as fp:
       	json.dump(data, fp)
