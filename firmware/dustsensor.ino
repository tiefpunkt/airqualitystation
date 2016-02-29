#define MAX_ULONG 4294967295UL
#define SAMPLE_TIME 10000

#define DUST_PIN 16

unsigned long sample_starttime;

unsigned long lowpulseoccupancy = 0;

volatile unsigned long lowpulsestart = 0;

// Dust sensor
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

void initDustSensor() {
  pinMode(DUST_PIN,INPUT_PULLUP);
  Serial.println("Init Dust Sensor");
  sample_starttime = millis();
  timer.setInterval(10, readDustSensor);
}

void readDustSensor() {
  
  if (digitalRead(DUST_PIN) == LOW) {
    lowpulseoccupancy++;
  }
  
  if ((millis()-sample_starttime) > SAMPLE_TIME) {

    //Changes are made here based on Chris Nafis's code: http://www.howmuchsnow.com/arduino/airquality/grovedust/
    ratio = lowpulseoccupancy/SAMPLE_TIME * 100.0;
    //Convert to percentage, the shinyei reads 10milliseconds to 90milliseconds duration for particles. Basing on 10milliseconds,  smallest particle assumingly from specification sheet.
    //FlexiTimer2, reads 10,000 readings per second, which would be 1 reading per 100 microseconds. 100 readings would be 10 milliseconds. Since Shinyei runs at minimal 10 millisecond range. I divided 10,000 readings by 100 to get 100.
    //Good example would be rawPArticalCount is 5000 half of the 10,000 readings were active. 5000/100 would be 50 which translate to 50% low pulse occupancy.
    
    lowpulseoccupancy = 0;
    sample_starttime = millis();
    
    totalParticles = (1.1*pow(ratio,3)-3.8*pow(ratio,2)+520*ratio+0.62);

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
  }
}

double getDustValue() {
  return particleCountToDisplay;
}
