/*
  Fatima Almaazmi. 24th November 2020.

  This is the Arduino program for the Daisy Game.

  In this game, you will control the position of the daisy with a potentiometer,
  photoresistor and button. The end goal is to place the daisy on the stem.
  Once you do a 'wow' sound will play to tell you that you have won!

  Enjoy!
*/


/**** My Global Variables ***/


// pins for each component

const int buttonPin = 2;
const int potenPin = A0;
const int photoPin = A1;
const int greenLEDPin = 4;

//variables used in this code

int poten = 0;    // first analog sensor
int photoResistor = 0;   // second analog sensor
int button = 0;    // digital sensor
int inByte = 0;         // incoming serial byte



void setup() {

  Serial.begin(9600);


  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  //setting the inputs
  pinMode(buttonPin, INPUT);

  //setting the outputs
  pinMode(greenLEDPin, OUTPUT);



  establishContact();  // send a byte to establish contact until receiver responds

}





void loop() {

  if (Serial.available() > 0) {

    inByte = Serial.read();


    if (inByte == 'A') { // if processing sends ASCII 'A' do this:


      poten = analogRead(potenPin);

      photoResistor = analogRead(photoPin);

      button = map(digitalRead(buttonPin), 0, 1, 0, 255);


      Serial.print(poten);
      Serial.print(",");
      Serial.print(photoResistor);
      Serial.print(",");
      Serial.println(button);



    }

    if (inByte == 'H') { // if Processing sends ASCII 'H'

      digitalWrite(greenLEDPin, HIGH);

    }

  }

}


void establishContact() {

  while (Serial.available() <= 0) {

    Serial.println("0,0,0");   // send an initial string
    delay(300);

  }

}
