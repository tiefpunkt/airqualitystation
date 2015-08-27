# Weather & Air Quality Station

Some information and code on a weather and air quality sensor station I started to build at CCCamp15. In its current version, it's based on an Arduino, with a number of Grove sensors (from the Grove [Starter Kit for LinkIt ONE](http://www.seeedstudio.com/depot/Grove-Starter-Kit-for-LinkIt-ONE-p-2028.html?ref=staffPicked)). The Arduino sends out data over USB to a computer running a python script, which uploads it to opensensemap.org.

## Hardware
* Arduino Uno
* Grove Base Shield

### Sensors
* BMP085 for temperature and pressure([Grove Wiki](http://www.seeedstudio.com/wiki/Grove_-_Barometer_Sensor))
* DHT22 for humidity ([Grove Wiki](http://www.seeedstudio.com/wiki/Grove_-_Temperature_and_Humidity_Sensor_Pro))
* Shinyei PPD42NS for PM2.5 ([Grove Wiki](http://www.seeedstudio.com/wiki/Grove_-_Dust_Sensor))
* GUVA-S12D for UV ([Grove Wiki](http://www.seeedstudio.com/wiki/Grove_-_UV_Sensor))

## Setup
* Plug it all together
  * TODO: Which sensor to which port
* Flash the firmware to the Arduino
* Put it all in a weatherproof box, that let's air in.
  * The UV sensor needs to be mounted so UV light can get to it. So probably somehow outside the box
* Plug the Arduino into your computer
* Setup the environment for the python script. I use virtualenv, like so:
```
cd weatherstation
virtualenv env
. env/bin/activate
pip install -r requirements.txt
```
* Create a suitable sensor on opensensemap.org
* Copy config.py.sample to config.py and fill in opensensemap ids as well as the proper serial port.
* python send2opensensemap.py
