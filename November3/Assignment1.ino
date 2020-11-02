/*
  Fatima Almaazmi. 3rd November 2020.

  Rainbow puzzle! Find a way to turn on the blinking LED lights, by pressing the right buttons in order of the colors of the rainbow.
  Red, yellow, green, blue.

  Enjoy!

*/



/******* My Global Variables ********/

//color button and their pins
int redButtonPin = 6;
int yellowButtonPin = 5;
int greenButtonPin = 4;
int blueButtonPin = 3;

//LED colors and their pins
int redLEDPin = 8;
int yellowLEDPin = 9;
int greenLEDPin = 10;
int blueLEDPin = 11;



void setup() {

  Serial.begin(9600);

  //setting buttons as input
  pinMode(redButtonPin, INPUT);
  pinMode(yellowButtonPin, INPUT);
  pinMode(greenButtonPin, INPUT);
  pinMode(blueButtonPin, INPUT);

  //setting LED as output
  pinMode(redLEDPin, OUTPUT);
  pinMode(yellowLEDPin, OUTPUT);
  pinMode(greenLEDPin, OUTPUT);
  pinMode(blueLEDPin, OUTPUT);


}




void loop() {


  //variables for each button to check state

  int redButton = digitalRead(redButtonPin);
  int yellowButton = digitalRead(yellowButtonPin);
  int greenButton = digitalRead(greenButtonPin);
  int blueButton = digitalRead(blueButtonPin);


  // to check button states
  Serial.println(redButton);


  //variables for each LED to check state

  int redLED = digitalRead(redLEDPin);
  int yellowLED = digitalRead(yellowLEDPin);
  int greenLED = digitalRead(greenLEDPin);
  int blueLED = digitalRead(blueLEDPin);



  //conditions for puzzle

  // for the player to familiarize themselves with the buttons and what button controls what LED



  if (redButton == HIGH) { //redButton controls blueLED

    digitalWrite(blueLEDPin, HIGH);

  } else if (greenLED == LOW) {

    digitalWrite(blueLEDPin, LOW);

  }




  if (yellowButton == HIGH) { //yellowButton controls greenLED

    digitalWrite(greenLEDPin, HIGH);

  } else if (yellowLED == LOW) {

    digitalWrite(greenLEDPin, LOW);
  }





  if (greenButton == HIGH) { //greenButton controls yellowLED

    digitalWrite(yellowLEDPin, HIGH);

  } else if (redLED == LOW) {

    digitalWrite(yellowLEDPin, LOW);
  }



  if (blueButton == HIGH) { //blueButton controls redLED

    digitalWrite(redLEDPin, HIGH);

  }




  if ( redLED == HIGH && yellowLED == HIGH && greenLED == HIGH && blueLED == HIGH ) { // if all the LEDs are turned on the blinking starts

    rainbowBlink();

  }


}





/******* My Functions **********/

void rainbowBlink() {

  //repeats the blink 20 times
  for (int i = 0; i < 20; i++) {

    digitalWrite(redLEDPin, HIGH);
    delay(50);
    digitalWrite(redLEDPin, LOW);
    delay(50);


    digitalWrite(yellowLEDPin, HIGH);
    delay(50);
    digitalWrite(yellowLEDPin, LOW);
    delay(50);

    digitalWrite(greenLEDPin, HIGH);
    delay(50);
    digitalWrite(greenLEDPin, LOW);
    delay(50);


    digitalWrite(blueLEDPin, HIGH);
    delay(50);
    digitalWrite(blueLEDPin, LOW);
    delay(50);
  }


}
