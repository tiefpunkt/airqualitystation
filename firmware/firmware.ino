/************************************************************/
/* OK LAB Particulate Matter Sensor                         */
/*      - nodemcu-LoLin board                               */
/*      - Shinyei PPD42NS                                   */
/*      http://www.sca-shinyei.com/pdf/PPD42NS.pdf          */
/*                                                          */       
/* Wiring Instruction:                                      */
/*      Pin 2 of dust sensor PM2.5 -> Digital 6 (PWM)       */
/*      Pin 3 of dust sensor       -> +5V                   */
/*      Pin 4 of dust sensor PM1   -> Digital 3 (PMW)       */ 
/*                                                          */
/*      - PPD42NS Pin 1 (grey or green)  => GND             */
/*      - PPD42NS Pin 2 (green or white)) => Pin D5 /GPIO14 */
/*        counts particles PM25                             */
/*      - PPD42NS Pin 3 (black or yellow) => Vin            */
/*      - PPD42NS Pin 4 (white or black) => Pin D6 / GPIO12 */
/*        counts particles PM10                             */
/*      - PPD42NS Pin 5 (red)   => unused                   */
/*                                                          */
/************************************************************/

// increment on change
#define SOFTWARE_VERSION "20160226_01"

#include "config.h"

/**********************************************/
/* DHT declaration 
/**********************************************/
#include <DHT.h>
#define DHTPIN 4
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);
String dht_data;

/**********************************************/
/* WiFi declarations
/**********************************************/
#include <ESP8266WiFi.h>

long start_of_operation = 0;
/**********************************************/
/* The Setup
/**********************************************/
void setup() {
  Serial.begin(9600); //Output to Serial at 9600 baud
  delay(10);

  // Mac address
  WiFi.macAddress(mac);
  byteToHexString(strMac, mac, 6, ":");
  byteToHexString(strDeviceId, mac, 6, "");

  Serial.println("## Particulate Matter Sensor ##");
  Serial.print("Software version: ");
  Serial.println(SOFTWARE_VERSION);
  DEBUG_PRINTLN("Device Identifier (MAC): ");
  DEBUG_PRINTLN(strMac);
  
  connectWifi(); // Start ConnecWifi 

  dht.begin(); // Start DHT
  initDustsensor();
  
  start_of_operation = millis();
}

/**********************************************/
/* And action
/**********************************************/
void loop() {  
  if (readDustsensor()) {  
    // FIXME: option to send PIN
    sensorDHT();  // getting temperature and humidity (optional)

    if (millis()-start_of_operation > WARMUP_PERIOD) {
      sendData();
    } else {
      Serial.println("Warmup period, not sending data yet");
    }
    //sensorBarometer();
    Serial.println("------------------------------");
  }
}
// DHT22 Sensor
void sensorDHT(){
 float h = dht.readHumidity(); //Read Humidity
 float t = dht.readTemperature(); //Read Temperature
 // Check if valid number if non NaN (not a number) will be send.
 if (isnan(t) || isnan(h)) {
   Serial.println("DHT22 couldn’t be read");
 } else {
   Serial.print("Humidity    : ");
   Serial.print(h);
   Serial.print(" %\n");
   Serial.print("Temperature : ");
   Serial.print(t);
   Serial.println(" C");
   dht_data= "{\"temperature\":\"";
   dht_data += Float2String(t);
   dht_data += "\", \"humidity\":\"";
   dht_data += Float2String(h);
   dht_data += "\"}";
 }
}

String getDHTData() {
  return dht_data;
}
/*
void sensorBarometer() {
  String data;
  temperature = myBarometer.bmp085GetTemperature(myBarometer.bmp085ReadUT()); //Get the temperature, bmp085ReadUT MUST be called first
  pressure = myBarometer.bmp085GetPressure(myBarometer.bmp085ReadUP());//Get the temperature
  altitude = myBarometer.calcAltitude(pressure); //Uncompensated caculation - in Meters

  Serial.print("Temperature: ");
  Serial.print(temperature, 2); //display 2 decimal places
  Serial.println("deg C");

  Serial.print("Pressure: ");
  Serial.print(pressure, 0); //whole number only.
  Serial.println(" Pa");

  Serial.print("Altitude: ");
  Serial.print(altitude, 2); //display 2 decimal places
  Serial.println(" m");

   data= "{\"temperature\":\"";
   data += Float2String(temperature);
   data += "\", \"pressure\":\"";
   data += Float2String(pressure);
   data += "\", \"altitude\":\"";
   data += Float2String(altitude);
   data += "\"}";
   publishMQTTMessage(strTopicPrefixID + "bmp",data);  
  
}

*/
/**********************************************/
/* WiFi connecting script
/**********************************************/
void connectWifi() {
  WiFi.begin(ssid, password); // Start WiFI
  
  Serial.print("Connecting ");
  while (WiFi.status() != WL_CONNECTED) 
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void byteToHexString(String &dataString, byte *uidBuffer, byte bufferSize, String strSeperator) {
  dataString = "";
  for (byte i = 0; i < bufferSize; i++) {
    if (i>0) {
      dataString += strSeperator;
      if (uidBuffer[i] < 0x10)
        dataString += String("0");
    }
    dataString += String(uidBuffer[i], HEX);
  }
  dataString.toUpperCase();
}

String Float2String(float value)
{
  // Convert a float to String with two decimals.
  char temp[15];
  String s;

  dtostrf(value,13, 2, temp);
  s = String(temp);
  s.trim();
  return s;
}
