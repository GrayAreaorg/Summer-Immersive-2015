//const int transistorPin = 9;    // connected to the base of the transistor
void setup() {
   // open the serial port at 9600 bits per second:
   Serial.begin(9600);

}

void loop() {
   // read the potentiometer, reduce the range to 0 - 255 by dividing by 4:
   int analogValue = analogRead(0) / 4;
   int outputValue = map(analogValue, 0, 255, 0, 150);
   // use that to control the transistor:
   if (analogValue > 128) {
  } 
  else {
  }//analogWrite(transistorPin, outputValue);
       
   // send the value out the serial port:
   Serial.write(analogValue);
   // delay 10 milliseconds so the analog to digital converter settles:
   delay(10);
}
