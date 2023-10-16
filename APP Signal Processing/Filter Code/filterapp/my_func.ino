// This function record the sound 

void record(float s[],int nb,int period)
{
  int i;
float avg =0;
  
  for (i=0;i<nb;i++)
 { 
    s[i] = (float)analogRead(ANALOG_PIN);
     delayMicroseconds (period);
 }

avg = 0;
for (i=0;i<nb;i++)
 { 
    avg = s[i] + avg; 
 }
  avg = avg/nb;
  
for (int i=0;i<nb;i++)
 { 
    s[i] = (s[i] -avg)/2048;
 }

}

// This function co;pute the power 
float computePower(float x[],int nb)
{
 
int i; 
float power = 0;

for (int i=0;i<nb;i++)
 {
   power = power + (x[i] * x[i]);
 }
return (power);
 
}



// filter function will apply the filter to the sound

void filter (float s[],float f[], float c[],int nb,int order)
{

float Value;
int i,j;

Value = 0;

for (int j=0; j<nb-order; j++)
 {
  for (int i=0; i<order; i++){
    Value = c[i] * s[i + j] + Value ;
  }
   f[j] = Value;
 }
}

 
 
