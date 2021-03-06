/*
  Fatima Almaazmi. 10th November 2020.

  This is a code that programs both analog and digital components. 
  Two sets of LED, one set controlled by a button, and the other is
  controlled by a potentiometer. Simply slide the switch to switch
  between both LED sets and analog and digital sensors :)
 
 Enjoy!
 
*/


/*** My global Variables ***/

// button pin
const int buttonPin = 2;

// LEDs placed on the left and their pins
const int leftLEDPin1 = 11;
const int leftLEDPin2 = 10;
const int leftLEDPin3 = 9;

// LEDs places on the right and their pins
const int rightLEDPin1 = 6;
const int rightLEDPin2 = 5;
const int rightLEDPin3 = 3;

// slide switch and potentiometer's pins
const int potenPin = A0;
const int switchPin = A5;

// extra variables
int potenValue;
int brightness;



void setup() {

  Serial.begin(9600);


  // setting button, slide switch, and potentiometer as inputs
  pinMode(buttonPin, INPUT);
  pinMode(potenPin, INPUT);
  pinMode(switchPin, INPUT);

  // setting both right and left LEDs as outputs
  pinMode(leftLEDPin1, OUTPUT);
  pinMode(leftLEDPin2, OUTPUT);
  pinMode(leftLEDPin3, OUTPUT);

  pinMode(rightLEDPin1, OUTPUT);
  pinMode(rightLEDPin2, OUTPUT);
  pinMode(rightLEDPin3, OUTPUT);


}



void loop() {


  // variable to read button state
  int button = digitalRead(buttonPin);

  // variable to read switch state
  int blinkMode = analogRead(switchPin);

  // variable to read potentiometer state
  int potenValue = analogRead(potenPin);
  // dividing the values by 4 to have the range from 0-255
  int brightness = potenValue / 4;

  // to check the states and values of inputs
  Serial.println(button);


  /*** My Conditions ***/


  if (button == HIGH && blinkMode == 1023) { // condition for button

    digitalWrite(leftLEDPin1, LOW);
    digitalWrite(leftLEDPin2, LOW);
    digitalWrite(leftLEDPin3, LOW);

  } else if (blinkMode == 1023) { // condition for slide switch to turn on LEDs on the left that are controlled by button

    digitalWrite(leftLEDPin1, HIGH);
    delay(50);
    digitalWrite(leftLEDPin1, LOW);
    delay(50);

    digitalWrite(leftLEDPin2, HIGH);
    delay(50);
    digitalWrite(leftLEDPin2, LOW);
    delay(50);

    digitalWrite(leftLEDPin3, HIGH);
    delay(50);
    digitalWrite(leftLEDPin3, LOW);
    delay(50);

  } else if (blinkMode == 0) { // condition for slide switch to turn on the LED on the right that are being controlled by potentiometer

    digitalWrite(rightLEDPin1, brightness);
    delay(50);
    digitalWrite(rightLEDPin1, 0);
    delay(50);

    analogWrite(rightLEDPin2, brightness);
    delay(50);
    analogWrite(rightLEDPin2, 0);
    delay(50);


    analogWrite(rightLEDPin3, brightness);
    delay(50);
    analogWrite(rightLEDPin3, 0);
    delay(50);
  }



}
