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

// Dust sensor
#include <FlexiTimer2.h>
#define DUST_PIN 8
volatile double rawParticalCount;
volatile double totalParticles = 0;
volatile double particleCountToDisplay = 0;
volatile double ratio = 0;
volatile uint16_t timeCounter = 0;
#define  numberOfPeaksRecording              5
volatile uint32_t    previousPeaks[numberOfPeaksRecording];
volatile uint32_t    sumOfPreviousPeaks     = 0;
volatile uint32_t    instantGoal             = 0;
volatile int32_t     delta                   = 0;
volatile uint32_t    slowMovingAverage       = 0;
volatile boolean readyToSendData = false;

/*
#define LIGHT_PIN A1
#define SOUND_PIN A0
#define AIRQUALITY_PIN A3
*/

void setup(){
  Serial.begin(9600);

  FlexiTimer2::set(1,1.0/10000, readDustSensor);
  FlexiTimer2::start();

  myBarometer.init();
  dht.begin();

  // Give the sensors 2 minutes to initialize (especially the dust sensor)
  delay(60000);
  delay(60000);
}

void readDustSensor() {
  if (digitalRead(DUST_PIN) == LOW){
    rawParticalCount++;
  }


  timeCounter++;
  if (timeCounter == 10000) {
    timeCounter=0;


    //Changes are made here based on Chris Nafis's code: http://www.howmuchsnow.com/arduino/airquality/grovedust/
    ratio = rawParticalCount/100.0; //Convert to percentage, the shinyei reads 10milliseconds to 90milliseconds duration for particles. Basing on 10milliseconds,  smallest particle assumingly from specification sheet.
    //FlexiTimer2, reads 10,000 readings per second, which would be 1 reading per 100 microseconds. 100 readings would be 10 milliseconds. Since Shinyei runs at minimal 10 millisecond range. I divided 10,000 readings by 100 to get 100.
    //Good example would be rawPArticalCount is 5000 half of the 10,000 readings were active. 5000/100 would be 50 which translate to 50% low pulse occupancy.
    totalParticles = (1.1*pow(ratio,3)-3.8*pow(ratio,2)+520*ratio+0.62);
    rawParticalCount = 0;

    // shift counters over, code adapted from template provided by Mike Taylor and Joshua Schapiro from Carnegie Mellon University's CREATE Lab
    for (uint8_t i = 0; i < (numberOfPeaksRecording-1); i++) {
        previousPeaks[i] = previousPeaks[i+1];
    }
    previousPeaks[numberOfPeaksRecording - 1] = totalParticles;


    sumOfPreviousPeaks = 0;
    for (uint8_t i = 0; i < numberOfPeaksRecording; i++) {
        sumOfPreviousPeaks += previousPeaks[i];
    }
    instantGoal = 2*sumOfPreviousPeaks;

    delta = instantGoal - slowMovingAverage;

    if (delta < -5000){
        slowMovingAverage = slowMovingAverage - 250;
    } else if (delta < -2500){
        slowMovingAverage = slowMovingAverage - 120;
    } else if(delta < -1200){
        slowMovingAverage = slowMovingAverage - 60;
    } else if(delta < -500){
        slowMovingAverage = slowMovingAverage - 25;
    } else if(delta < -5){
        slowMovingAverage = slowMovingAverage - 5;
    } else if(delta < -1){
        slowMovingAverage = slowMovingAverage - 1;
    } else if(delta > 5000) {
        slowMovingAverage = slowMovingAverage + 500;
    } else if(delta > 2500){
        slowMovingAverage = slowMovingAverage + 250;
    } else if(delta > 1200){
        slowMovingAverage = slowMovingAverage + 120;
    } else if(delta > 500){
        slowMovingAverage = slowMovingAverage + 50;
    } else if(delta > 5){
        slowMovingAverage = slowMovingAverage + 5;
    } else if(delta > 1){
        slowMovingAverage = slowMovingAverage + 1;
    }

    particleCountToDisplay = slowMovingAverage;
    readyToSendData = true;
  }
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

void loop()
{

  if (readyToSendData) {
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
    Serial.print(particleCountToDisplay); // hppcf
    Serial.print(", ");

    measureUV();
    Serial.print("\"uv_intensity\": ");
    Serial.print(getUVIntensity()); // mW/m^2
    Serial.print(", ");
    Serial.print("\"uv_index\": ");
    Serial.print(getUVIndex());

    Serial.println("}");
    /*
    sum = 0;
    for(int i=0;i<256;i++) {
      sensorValue=analogRead(SOUND_PIN);
      sum=sensorValue+sum;
      delay(2);
    }
    sum = sum >> 8;
    Serial.print("Sound Sensor Voltage: ");
    Serial.print(sum*4980.0/1023.0);
    Serial.println("mV");

    Serial.println();

    sum = 0;
    for(int i=0;i<256;i++) {
      sensorValue=analogRead(LIGHT_PIN);
      sum=sensorValue+sum;
      delay(2);
    }
    sum = sum >> 8;
    calc = sum*4980.0/1023.0;
    Serial.print("Light Sensor Voltage: ");
    Serial.print(calc);
    Serial.println("mV");
    Serial.print("Light Intensity: ");
    Serial.print(0.3244*pow(2.71828,0.0068*sum));
    Serial.println("Lm");

    sum = 0;
    for(int i=0;i<256;i++) {
      sensorValue=analogRead(AIRQUALITY_PIN);
      sum=sensorValue+sum;
      delay(2);
    }
    sum = sum >> 8;
    Serial.print("Air Quality Sensor Voltage: ");
    Serial.print(sum*4980.0/1023.0);
    Serial.println("mV");

    Serial.println();

    Serial.println("-------");
    */
    readyToSendData = false;
  }

  // Run every 60 seconds
  delay(60000);
}
