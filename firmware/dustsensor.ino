/**********************************************/
/* Variable Definitions for PPD24NS
/**********************************************/
// P1 for PM10 & P2 for PM25
unsigned long sampletime_ms = 30000;
unsigned long lowpulseoccupancyP1 = 0;
unsigned long lowpulseoccupancyP2 = 0;
unsigned long lowpulseoccupancyP1_old = 0;
unsigned long lowpulseoccupancyP2_old = 0;
unsigned long sampletime_ms_actual = 0;

float ratioP1 = 0;
float concentrationP1 = 0;
float ratioP2 = 0;
float concentrationP2 = 0;
boolean valP1 = HIGH;
boolean valP2 = HIGH;

unsigned long starttime;
unsigned long durationP1;
unsigned long durationP2;

boolean trigP1 = false;
boolean trigP2 = false;
unsigned long trigOnP1;
unsigned long trigOnP2;

// Slowly moving average
#define  numberOfPeaksRecording              5
uint32_t    previousPeaksP1[numberOfPeaksRecording];
uint32_t    previousPeaksP2[numberOfPeaksRecording];
uint32_t    slowMovingAverageP1       = 0;
uint32_t    slowMovingAverageP2       = 0;
uint32_t    sumOfPreviousPeaks     = 0;
uint32_t    instantGoal             = 0;
int32_t     delta                   = 0;

void initDustsensor() {
  pinMode(12,INPUT); // Listen at the designated PIN
  pinMode(14,INPUT); //Listen at the designated PIN
  starttime = millis(); // store the start time
}

boolean readDustsensor() {
  // Read pins connected to ppd42ns
  valP1 = digitalRead(12);
  valP2 = digitalRead(14);

  if(valP1 == LOW && trigP1 == false){
    trigP1 = true;
    trigOnP1 = micros();
  }
  
  if (valP1 == HIGH && trigP1 == true){
    durationP1 = micros() - trigOnP1;
    lowpulseoccupancyP1 = lowpulseoccupancyP1 + durationP1;
    trigP1 = false;
  }
  
  if(valP2 == LOW && trigP2 == false){
    trigP2 = true;
    trigOnP2 = micros();
  }
  
  if (valP2 == HIGH && trigP2 == true){
    durationP2 = micros() - trigOnP2;
    lowpulseoccupancyP2 = lowpulseoccupancyP2 + durationP2;
    trigP2 = false;
  }

  // Checking if it is time to sample
  if ((millis()-starttime) > sampletime_ms) {
    sampletime_ms_actual = millis()-starttime;
    ratioP1 = lowpulseoccupancyP1/(sampletime_ms_actual*10.0);                 // int percentage 0 to 100
    concentrationP1 = 1.1*pow(ratioP1,3)-3.8*pow(ratioP1,2)+520*ratioP1+0.62; // spec sheet curve

    // Begin printing
    Serial.print("LPO P10     : ");
    Serial.println(lowpulseoccupancyP1);
    Serial.print("Ratio PM10  : ");
    Serial.print(ratioP1);
    Serial.println(" %");
    Serial.print("PM10 Count  : ");
    Serial.println(concentrationP1);
    
    ratioP2 = lowpulseoccupancyP2/(sampletime_ms_actual*10.0);
    concentrationP2 = 1.1*pow(ratioP2,3)-3.8*pow(ratioP2,2)+520*ratioP2+0.62;
    // Begin printing
    Serial.print("LPO PM25    : ");
    Serial.println(lowpulseoccupancyP2);
    Serial.print("Ratio PM25  : ");
    Serial.print(ratioP2);
    Serial.println(" %");
    Serial.print("PM25 Count  : ");
    Serial.println(concentrationP2);

    // shift counters over, code adapted from template provided by Mike Taylor and Joshua Schapiro from Carnegie Mellon University's CREATE Lab
    for (uint8_t i = 0; i < (numberOfPeaksRecording-1); i++) {
        previousPeaksP1[i] = previousPeaksP1[i+1];
        previousPeaksP2[i] = previousPeaksP2[i+1];
    }
    previousPeaksP1[numberOfPeaksRecording - 1] = concentrationP1;
    previousPeaksP2[numberOfPeaksRecording - 1] = concentrationP2;

    slowMovingAverageP1 = recalcSlowMovingAverage(previousPeaksP1, slowMovingAverageP1);
    slowMovingAverageP2 = recalcSlowMovingAverage(previousPeaksP2, slowMovingAverageP2);

    Serial.print("PM10 Average  : ");
    Serial.println(slowMovingAverageP1);
    Serial.print("PM25 Average  : ");
    Serial.println(slowMovingAverageP2);

    // Resetting for next sampling
    lowpulseoccupancyP1_old = lowpulseoccupancyP1;
    lowpulseoccupancyP2_old = lowpulseoccupancyP2;
    lowpulseoccupancyP1 = 0;
    lowpulseoccupancyP2 = 0;
    trigP1 = false;
    trigP2 = false;
    starttime = millis(); // store the start time
    
    return true;
  }
  return false;
}

uint32_t recalcSlowMovingAverage(uint32_t previousPeaks[], uint32_t slowMovingAverage) {
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

  return slowMovingAverage;
}

String getDustData() {
  String data;
  data = "{\"P1\":{";
    //data += "\"lowpulseoccupancy\":\"";
    //data += long(lowpulseoccupancyP1_old);
    //data += "\",";
    //data += "\"ratio\":\"";
    //data += Float2String(ratioP1);
    //data += "\",";
    data += "\"concentration\":\"";
    data += Float2String(concentrationP1);
    data += "\",";
    data += "\"concentration_avg\":\"";
    data += Float2String(slowMovingAverageP1);
    data += "\"},\"P2\":{";
    //data += "\"lowpulseoccupancy\":\"";
    //data += long(lowpulseoccupancyP2_old);
    //data += "\",";
    //data += "\"ratio\":\"";
    //data += Float2String(ratioP2);
    //data += "\",";
    data += "\"concentration\":\"";
    data += Float2String(concentrationP2);
    data += "\",";
    data += "\"concentration_avg\":\"";
    data += Float2String(slowMovingAverageP2);
    data += "\"},\"sampletime\":\"";
    data += long(sampletime_ms_actual);
    data += "\"}";
    return data;
}

