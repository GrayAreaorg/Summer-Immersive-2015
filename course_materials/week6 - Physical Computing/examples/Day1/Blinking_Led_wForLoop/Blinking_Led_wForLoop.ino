// Example 01 : Blinking LED
//

int LED = 13;   // LED connected to
                // digital pin 13
                
void setup()
{
  pinMode(LED, OUTPUT);    // sets the digital                           // pin as output
}

void loop()
{
  for(int i = 1;i <=100; i++){
  digitalWrite(LED, HIGH);   // turns the LED on
  delay(i);               // waits for a second
  digitalWrite(LED, LOW);    // turns the LED off
  delay(i);               // waits for a second
  }
}
