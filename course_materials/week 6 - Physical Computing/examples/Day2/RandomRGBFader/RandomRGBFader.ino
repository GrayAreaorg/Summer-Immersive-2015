
int redPin = 11;
int greenPin = 10;
int bluePin = 9;

int redPulse   = 0;
int greenPulse = 0;
int bluePulse  = 0;

void setup(){
  randomSeed(analogRead(0));
}

void loop() {
  redPulse = random(0,256); // Randomly generate 1 to 255
  greenPulse = random(0,256); // Randomly generate 1 to 255
  bluePulse = random(0,256); // Randomly generate 1 to 255
  analogWrite(redPin,redPulse);
  analogWrite(greenPin,greenPulse);
  analogWrite(bluePin,bluePulse);

  for(redPulse = 0; redPulse < 255; redPulse += 1){
    analogWrite(redPin,redPulse);
    analogWrite(greenPin,greenPulse);
    analogWrite(bluePin,bluePulse);
    delay(10);
  }
  for(redPulse = 255; redPulse > 0; redPulse -= 1){
    analogWrite(redPin,redPulse);
    analogWrite(greenPin,greenPulse);
    analogWrite(bluePin,bluePulse);
    delay(10);
  }
  for(greenPulse = 0; greenPulse < 255; greenPulse += 1){
    analogWrite(redPin,redPulse);
    analogWrite(greenPin,greenPulse);
    analogWrite(bluePin,bluePulse);
    delay(10);
  }
  for(greenPulse = 255; greenPulse > 0; greenPulse -= 1){
    analogWrite(redPin,redPulse);
    analogWrite(greenPin,greenPulse);
    analogWrite(bluePin,bluePulse);
    delay(10);
  }
  for(bluePulse = 0; bluePulse < 255; bluePulse += 1){
    analogWrite(redPin,redPulse);
    analogWrite(greenPin,greenPulse);
    analogWrite(bluePin,bluePulse);
    delay(10);
  }
  for(bluePulse = 255; bluePulse > 0; bluePulse -= 1){
    analogWrite(redPin,redPulse);
    analogWrite(greenPin,greenPulse);
    analogWrite(bluePin,bluePulse);
    delay(10);
  }
}
