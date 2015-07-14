int incomingByte = 0;   // for incoming serial data
int motorPin = 9;
int motorSpeed = 0;

void setup() {
        Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
        Serial.println("Control the Motor");
        Serial.println("Enter a speed from 1 - 100");
}

void loop() {

        // send data only when you receive data:
        if (Serial.available() > 0) {
                // read the incoming byte:
                incomingByte = Serial.parseInt();
                

                // say what you got:
                Serial.print("I received: ");
                Serial.println(incomingByte);
                
                motorSpeed = map(incomingByte, 1, 100, 0, 255);
                analogWrite(motorPin, motorSpeed);		 
        }
}


