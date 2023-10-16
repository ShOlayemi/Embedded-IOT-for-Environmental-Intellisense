/*
  modified on Sep 8, 2020
  Modified by MohammedDamirchi from Arduino Examples
  Home
*/
#include "mycoef.h"
#define PERIOD 357
#define NBSAMPL 1000
#define ANALOG_PIN 25 // read the input on analog pin 25:
#define ORDER 200


float Sound[NBSAMPL];
float Fsound[NBSAMPL];

/*void record(float ,int,int);
float computePower(float,int);
void filter (float, float*, float,int,int);*/
float power; 
float power1;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  
}



// the loop routine runs over and over again forever:
void loop() {
  
 
  
record(Sound,NBSAMPL,PERIOD);

power = computePower(Sound,500);

Serial.print("POWER1 = "); Serial.println(power);



filter (Sound, Fsound, Coef,NBSAMPL,ORDER);
power1 = computePower(Fsound,500);

Serial.print("FILTERED POWER = "); Serial.println(power1);

delay(2000);


}
