# Air Quality Station

Small outdoor particulate matter sensor. Measures PM1.0 and PM2.5, as well as temperature and humidity. Connects to an online service to show the measurements not only of one sensor, but all sensors in the area.

## Hardware
* ESP8266
* [Custom PCB](hardware/) (or your own whatever thingie)
* A bunch of small parts (TODO: Add BOM)
* DHT22 for temperature and humidity ([Grove Wiki](http://www.seeedstudio.com/wiki/Grove_-_Temperature_and_Humidity_Sensor_Pro))
* Shinyei PPD42NS for PM2.5 and PM1.0 ([Grove Wiki](http://www.seeedstudio.com/wiki/Grove_-_Dust_Sensor))

## Setup
* Solder up the PCB (PCBs might be for sale in the future, in the meantime look at the files [here](hardware/))
* Crimp the sensors to the connectors
* Put your WiFi credentials in the firmware
* Flash the firmware via the FTDI connector on the board (make sure it's set to 3.3V)
* Connect the sensors
* Put it all in a weatherproof box, that let's air in.
* Place it outside
* Power it up
