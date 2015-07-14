

int redPin = 11;
int greenPin = 10;
int bluePin = 9;

void setup()
{
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
}

void loop()
{
  setColor(255, 0, 0);  // red
  delay(100);
  setColor(0, 255, 0);  // green
  delay(100);
  setColor(0, 0, 255);  // blue
  delay(100);
  setColor(255, 255, 0);  // yellow
  delay(100);
  setColor(80, 0, 80);  // purple
  delay(100);
  setColor(0, 255, 255);  // aqua
  delay(100);
}

void setColor(int red, int green, int blue)
{
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);
}
