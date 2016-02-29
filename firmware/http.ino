#include <ESP8266WiFi.h>
#include "config.h"
#include <ESP8266HTTPClient.h>

HTTPClient http;

void sendData() {
  if((WiFi.status() != WL_CONNECTED)) {
    return;
  }
  
  http.begin(HTTP_SERVER, 80, HTTP_URL); //HTTP
  IPAddress local = WiFi.localIP();
  strIPAddr = String(local[0]) + "." + String(local[1]) + "." + String(local[2]) + "." + String(local[3]);
  
  String data = "{\"software_version\":\"";
  data += SOFTWARE_VERSION;
  data += "\",";
  data += "\"MAC\":\"" + strMac + "\",";
  data += "\"IP\":\"" + strIPAddr + "\",";
  data += "\"uptime\":\"" + String(millis()) + "\",";
  data += "\"sensors\":{\"dht22\":";
  data += getDHTData();
  data += ",\"ppd42ns\":";
  data += getDustData();
  data += "}}";

  int httpCode = http.POST(data);
  if(httpCode) {
    // HTTP header has been send and Server response header has been handled
    Serial.printf("[HTTP] POST... code: %d\n", httpCode);
  } else {
    Serial.print("[HTTP] POST... failed, no connection or no HTTP server\n");
  }
  http.end();
}
