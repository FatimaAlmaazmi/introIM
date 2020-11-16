/*

Fatima Almaazmi. 17th November 2020.


A mini dog disco! 

This is a program where the song Take On Me by A-ha is either played by the user while using buttons + a photoresistor,
or automatically played as a whole. Switcing between both states is done through a switch. The way the dog dances is 
controlled with the servo.

Enjoy!
  
 */



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



/*** Global Variables for the servo motor ***/


//declaring the servo
Servo servo;


//the delay or interval
int interval = 200;


int increment = 40;


//the last position of the servo
unsigned long lastPos;


//the current position of the servo
int currentServoPos;



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


//size of the array
int notes = sizeof(melody) / sizeof(melody[0]) / 2;


//these three variables are used to determine the note duration for each seperate note
int wholeNote = (60000 * 4) / tempo;
int divider = 0;
int noteDuration;


unsigned long currentNoteStartedAt = 0;


int millisToNextNote;


int currentNote = 0;




void setup() {

  Serial.begin(9600);


  // setting buttons as inputs
  pinMode(redButtonPin, INPUT);
  pinMode(yellowButtonPin, INPUT);
  pinMode(greenButtonPin, INPUT);
  pinMode(blueButtonPin, INPUT);


  // setting the pin for the servo
  servo.attach(10);


  //setting switch as input
  pinMode(switchPin, INPUT);


  //setting photoresistor as input
  pinMode(photorePin, INPUT);


  //setting the buzzer as an output just in case
  pinMode(buzzerPin, OUTPUT);


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


  //to check the current time in ms
  unsigned long currentMillis = millis();



  /*** My Conditions ***/



  // if the switch is on one side, it plays the original tune, and the dog dances happily

  if ((switchState == 1023) && (currentMillis - currentNoteStartedAt >= millisToNextNote) && (currentMillis - lastPos > interval)) {

    /** conditions for buzzer **/


    // this is where the note duration is specified for each note
    divider = melody[currentNote + 1];

    if (divider > 0) {

      noteDuration = (wholeNote) / divider;

    } else if (divider < 0) {

      noteDuration = (wholeNote) / abs(divider);
      noteDuration *= 1.5;
    }

    //plays the tune
    tone(buzzerPin, melody[currentNote], noteDuration * 0.9);

    //calculate show long to wait before next note
    millisToNextNote = noteDuration * 0.9;

    //update the time
    currentNoteStartedAt = currentMillis;

    //the array is twice the number of the number of notes so that is why we increment 2
    currentNote += 2;

    //when we reach the final note, repeat the melody
    if ( currentNote > notes * 2) {
      currentNote = 0;
    }

    /** conditions for servo **/

    //update the servo's last position to the current time
    lastPos = currentMillis;

    //increment the servo's position
    currentServoPos += increment;
    // move the servo
    servo.write(currentServoPos);

    //if we reach the final position, do it again
    if ((currentServoPos >= 100) || (currentServoPos <= 50)) {

      increment = -increment;
    }


  }




  // if the switch is on the other side, this is what works:

  if (switchState == 0) {

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

      for (int i = 100; i >= 20; i--) {

        servo.write(i);
      }

    } else if ( redButton == LOW && yellowButton == LOW && greenButton == LOW && blueButton == LOW && photoState > 300) {

      noTone(buzzerPin);

    }
  }
}
