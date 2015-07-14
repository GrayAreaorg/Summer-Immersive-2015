// Example 01 : Blinking LED
//

int LED = 13;   // LED connected to// digital pin 13

int i; // Variable to hold our random value
                
void setup()
{
  pinMode(LED, OUTPUT);    // sets the digital pin as output
}

void loop()
{
  i = random(1, 1000);       // generate a random value every loop cycle
  digitalWrite(LED, HIGH);   // turns the LED on 
  delay(i);                 // pause for the duration of i
  digitalWrite(LED, LOW);    // turns the LED off
  delay(i);                  // waits for a second the duration of i

}
