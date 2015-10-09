/*
* Weather and Air Quality Sensor
*
* Severin Schols <airquality@tiefpunkt.com>
*/


/* BMP085 */
#include "Barometer.h"
#include <Wire.h>
float temperature;
float pressure;
float atm;
float altitude;
Barometer myBarometer;

/* DHT22*/
#include "DHT.h"
#define DHTPIN 2
#define DHTTYPE DHT22   // DHT 22  (AM2302)
DHT dht(DHTPIN, DHTTYPE);
float dht_temperature;
float dht_humidity;

// UV Sensor
#define UV_PIN A2
int sensorValue;
long  sum;
float calc;

// SimpleTimer
#include "SimpleTimer.h"
SimpleTimer timer;


void setup(){
  Serial.begin(9600);
  initGPS();
  initDustSensor();
  
  myBarometer.init();
  dht.begin();
  
  // Warmup Period of 120s, before sending data
  timer.setInterval(120000, finishInitialization);
}

void finishInitialization() {
  timer.setInterval(60000, sendData);
}

float getTemperature() {
  temperature = myBarometer.bmp085GetTemperature(myBarometer.bmp085ReadUT()); //Get the temperature, bmp085ReadUT MUST be called first
  dht_temperature = dht.readTemperature();
  return temperature;
}

float getPressure() {
  pressure = myBarometer.bmp085GetPressure(myBarometer.bmp085ReadUP());//Get the temperature
  altitude = myBarometer.calcAltitude(pressure); //Uncompensated caculation - in Meters
  atm = pressure / 101325;

  return pressure;
}


float getHumidity() {
     dht_humidity = dht.readHumidity();
     return dht_humidity;
}

void measureUV() {
  sum = 0;
  for(int i=0;i<256;i++) {
    sensorValue=analogRead(UV_PIN);
    sum=sensorValue+sum;
    delay(2);
  }
  sum = sum >> 8;
}

float getUVIntensity() {
  return sum*307.0*4.98/1023.0;
}

float getUVIndex() {
  return sum*307.0/200.0*4.98/1023.0;
}

void sendData() {
  Serial.print("{ ");
  Serial.print("\"temperature\": ");
  Serial.print(getTemperature(), 2); // °C
  Serial.print(", ");

  Serial.print("\"pressure\": ");
  Serial.print(getPressure(), 0); // Pa
  Serial.print(", ");

  Serial.print("\"humidity\": ");
  Serial.print(getHumidity()); // %
  Serial.print(", ");

  Serial.print("\"pm25\": ");
  Serial.print(getDustValue()); // hppcf
  Serial.print(", ");

  measureUV();
  Serial.print("\"uv_intensity\": ");
  Serial.print(getUVIntensity()); // mW/m^2
  Serial.print(", ");
  Serial.print("\"uv_index\": ");
  Serial.print(getUVIndex());

  Serial.println("}");
}

void loop() {
  timer.run();
  readDustSensor();
}
