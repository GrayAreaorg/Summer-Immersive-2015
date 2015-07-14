

int LEDGreen=9;
int LEDBlue=10;
int LEDRed=11;


int sensorPin=0;
int val;

void setup(){
  Serial.begin(9600);

}

void loop(){
  
  val=map(analogRead(sensorPin),0,1024,0,900);
  Serial.println(val);
  if (val<150) {
    analogWrite(LEDRed,0);
    analogWrite(LEDBlue,255); 
    analogWrite(LEDGreen,255);    
  } else if (val<300) {
    analogWrite(LEDRed,map(val,150,300,0,255));
    analogWrite(LEDBlue,map(val,150,300,255,0)); 
    analogWrite(LEDGreen,255);
  } else if (val<450) {
    analogWrite(LEDRed,255);
    analogWrite(LEDBlue,0); 
    analogWrite(LEDGreen,255);  
  } else if (val<600) {
    analogWrite(LEDRed,255);
    analogWrite(LEDBlue,map(val,450,600,0,255)); 
    analogWrite(LEDGreen,map(val,450,600,255,0));
  } else if (val<750) {
    analogWrite(LEDRed,255);
    analogWrite(LEDBlue,255); 
    analogWrite(LEDGreen,0);  
  } else if (val<900) {
    analogWrite(LEDRed,map(val,750,900,255,0));
    analogWrite(LEDBlue,255); 
    analogWrite(LEDGreen,map(val,750,900,0,255));
  }
  delay(10);
}
