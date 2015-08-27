#!/bin/python
import serial
import json
import requests

import config

ser = serial.Serial(config.SERIAL, 9600, timeout=10)

def sendMeasurement(id, value):
	# http://opensensemap.org:8000/boxes/boxId/sensorId
	url = "http://opensensemap.org:8000/boxes/%s/%s" % (config.SENSEBOX_ID, id)
	data = { "value" : value }
	headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
	# print url
	try:
		r = requests.post(url, data=json.dumps(data), headers=headers, timeout = 2)
	except:
		print "error making request"
		return
	#print r.status_code
	print r.content
	#print

while True:
	line = ser.readline()
	try:
		data = json.loads(line)
	except ValueError:
		continue

	for key, value in data.iteritems():
		if key == "temperature":
			sendMeasurement(config.TEMPERATURESENSOR_ID, value)
		elif key == "pressure":
			sendMeasurement(config.PRESSURESENSOR_ID, value)
		elif key == "humidity":
			sendMeasurement(config.HUMIDITY_ID, value)
		elif key == "pm25":
			sendMeasurement(config.PM_ID, value)
		elif key == "uv_intensity":
			sendMeasurement(config.UVINTENSITY_ID, value)
		elif key == "uv_index":
			sendMeasurement(config.UVINDEX_ID, value)
