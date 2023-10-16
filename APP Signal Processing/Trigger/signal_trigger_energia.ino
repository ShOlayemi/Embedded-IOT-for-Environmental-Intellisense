/*
  modified on Sep 8, 2020
  Modified by MohammedDamirchi from Arduino Examples
  Home
*/
#define PERIOD 250
#define NBSAMPL 1000
#define ANALOG_PIN 25 // read the input on analog pin 25:


// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  
}
float Sound[NBSAMPL];

// the loop routine runs over and over again forever:
void loop() {
  
  
  
for (int i=0;i<NBSAMPL;i++)
 { 
    Sound[i] = (float)analogRead(ANALOG_PIN);
     delayMicroseconds (PERIOD);
 }

  float avg =0;
for (int i=0;i<NBSAMPL;i++)
 { 
    avg = Sound[i] + avg;
     
 }
  avg = avg/NBSAMPL;
  
for (int i=0;i<NBSAMPL;i++)
 { 
    Sound[i] = (Sound[i] -avg)/2048;
 }
float power = 0;
for (int i=0;i<NBSAMPL;i++)
 {
   power = power + (Sound[i] * Sound[i]);
 }
 //Serial.println(power);

float threshold = 0.4231;

if (power > threshold)
  Serial.println("1 on");  
else
 Serial.println("0 off");
 }
