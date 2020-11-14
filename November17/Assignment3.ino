
/*** Including extra tabs + libraries ***/

#include <Servo.h>
#include "pitches.h"



/*** My Global Variables ***/

//buttons and their pins
const int redButtonPin = 5;
const int yellowButtonPin = 6;
const int greenButtonPin = 7;
const int blueButtonPin = 8;

//photoresistor's pin
const int photorePin = A0;

//buzzer's pin
const int buzzerPin = 11;

//switch's pin
const int switchPin = A2;

//deckaring the servo
Servo myservo;


/*** Global Variables for the tune (Take On Me by A-ha) ***/

// how fast the tune is played
int tempo = 140;

//the actual tune
int melody[] = {

  NOTE_FS5, 8, NOTE_FS5, 8, NOTE_D5, 8, NOTE_B4, 8, REST, 8, NOTE_B4, 8, REST, 8, NOTE_E5, 8,
  REST, 8, NOTE_E5, 8, REST, 8, NOTE_E5, 8, NOTE_GS5, 8, NOTE_GS5, 8, NOTE_A5, 8, NOTE_B5, 8,
  NOTE_A5, 8, NOTE_A5, 8, NOTE_A5, 8, NOTE_E5, 8, REST, 8, NOTE_D5, 8, REST, 8, NOTE_FS5, 8,
  REST, 8, NOTE_FS5, 8, REST, 8, NOTE_FS5, 8, NOTE_E5, 8, NOTE_E5, 8, NOTE_FS5, 8, NOTE_E5, 8,
  NOTE_FS5, 8, NOTE_FS5, 8, NOTE_D5, 8, NOTE_B4, 8, REST, 8, NOTE_B4, 8, REST, 8, NOTE_E5, 8,

  REST, 8, NOTE_E5, 8, REST, 8, NOTE_E5, 8, NOTE_GS5, 8, NOTE_GS5, 8, NOTE_A5, 8, NOTE_B5, 8,
  NOTE_A5, 8, NOTE_A5, 8, NOTE_A5, 8, NOTE_E5, 8, REST, 8, NOTE_D5, 8, REST, 8, NOTE_FS5, 8,
  REST, 8, NOTE_FS5, 8, REST, 8, NOTE_FS5, 8, NOTE_E5, 8, NOTE_E5, 8, NOTE_FS5, 8, NOTE_E5, 8,
  NOTE_FS5, 8, NOTE_FS5, 8, NOTE_D5, 8, NOTE_B4, 8, REST, 8, NOTE_B4, 8, REST, 8, NOTE_E5, 8,
  REST, 8, NOTE_E5, 8, REST, 8, NOTE_E5, 8, NOTE_GS5, 8, NOTE_GS5, 8, NOTE_A5, 8, NOTE_B5, 8,

  NOTE_A5, 8, NOTE_A5, 8, NOTE_A5, 8, NOTE_E5, 8, REST, 8, NOTE_D5, 8, REST, 8, NOTE_FS5, 8,
  REST, 8, NOTE_FS5, 8, REST, 8, NOTE_FS5, 8, NOTE_E5, 8, NOTE_E5, 8, NOTE_FS5, 8, NOTE_E5, 8,

};


int notes = sizeof(melody) / sizeof(melody[0]) / 2;


int wholeNote = (60000 * 4) / tempo;

int divider = 0;
int noteDuration = 0;





void setup() {

  Serial.begin(9600);

  // setting buttons as inputs
  pinMode(redButtonPin, INPUT);
  pinMode(yellowButtonPin, INPUT);
  pinMode(greenButtonPin, INPUT);
  pinMode(blueButtonPin, INPUT);

  // setting the pin for the servo
  myservo.attach(10);

  //setting switch as input
  pinMode(switchPin, INPUT);

  //setting photoresistor as input
  pinMode(photorePin, INPUT);


}



void loop() {

  /*** variables used here ***/

  // variables to check buttons state
  int redButton = digitalRead(redButtonPin);
  int yellowButton = digitalRead(yellowButtonPin);
  int greenButton = digitalRead(greenButtonPin);
  int blueButton = digitalRead(blueButtonPin);

  // variable to check photoresistor state
  int photoState = analogRead(photorePin);


  //variable to check switch state
  int switchState = analogRead(switchPin);


  // to check the values:
  Serial.println(photoState);




  /*** My Conditions ***/




  // if the switch is on one side, it plays the original tune, and the dog dances happily
  if (switchState == 1023) {

    for (int thisNote = 0; thisNote < notes * 2; thisNote = thisNote + 2) {


      divider = melody[thisNote + 1];
      if (divider > 0) {

        noteDuration = (wholeNote) / divider;
      } else if (divider < 0) {

        noteDuration = (wholeNote) / abs(divider);
        noteDuration *= 1.5;
      }


      tone(buzzerPin, melody[thisNote], noteDuration * 0.9);


      delay(noteDuration); // i feel that this delay is causing the problem


      noTone(buzzerPin);

    }


    // I also want to make the dog dance here, but it does not work :(
    // The tune plays perfectly, but the servo stays put when I add a for loop that moves it >

    //    for (int i = 0; i <= 100; i++) {
    //
    //      myservo.write(i);
    //    }

  }


  // if the switch is on the other side, this is what works:


  // every button + the photoresistor control one note

  if (redButton == HIGH) {

    tone(buzzerPin, NOTE_FS5);

  } else if (yellowButton == HIGH) {

    tone(buzzerPin, NOTE_D5);

  } else if (greenButton == HIGH) {

    tone(buzzerPin, NOTE_B4);

  } else if (blueButton == HIGH) {

    tone(buzzerPin, NOTE_E5);

  } else if (photoState < 300) { // if the last note is played the dog loses it

    tone(buzzerPin, NOTE_GS5);

    for (int i = 0; i <= 100; i++) {

      myservo.write(i);
    }

  } else if ( redButton == LOW && yellowButton == LOW && greenButton == LOW && blueButton == LOW && photoState > 300) {

    noTone(buzzerPin);

  }
}
