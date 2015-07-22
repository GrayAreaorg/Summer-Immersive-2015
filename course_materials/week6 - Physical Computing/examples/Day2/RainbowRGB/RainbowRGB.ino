
// Select which PWM-capable pins are to be used.
int redPin = 9;
int greenPin = 10;
int bluePin = 11;

// A function to fade UP an active-low or common-anode output.
// Optionally, specify a short delay value to slow the loop.
// (This would fade down an LED that was active high.)
//
void fadeUp(int pin, int d = 10)
{
  int i;
  for (i = 255; i >= 0; i--)
  {
    analogWrite(pin, i);
    delay(d);
  }
}

// A function to fade DOWN an active-low or common-anode output.
// Optionally, specify a short delay value to slow the loop.
// (This would fade up an LED that was active high.)
//
void fadeDown(int pin, int d = 20)
{
  int i;
  for (i = 0; i <= 255; i++)
  {
    analogWrite(pin, i);
    delay(d);
  }
}

// Set up our outputs, and give full high values so the
// LEDs start off.  Then fade in the blue LED.
//
void setup()
{
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);

  analogWrite(redPin, 255);
  analogWrite(greenPin, 255);
  analogWrite(bluePin, 255);

  fadeUp(bluePin);
}

// The cycle of ramps will go through all of the primary
// and secondary hues in the RGB rainbow, and repeat.
//
void loop()
{
  fadeUp(greenPin);
  fadeDown(bluePin);
  fadeUp(redPin);
  fadeDown(greenPin);
  fadeUp(bluePin);
  fadeDown(redPin);
}
 
