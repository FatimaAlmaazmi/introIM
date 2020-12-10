/*
  Fatima Almaazmi. 10th December 2020.

  This is the Arduino program for my Disco Dog game.

  In this game, you have to take the dog to the disco by following the
  correct path. If you step on a wrong platform, you will start from
  the beginning. If you win, the dog will dance at the disco to his
  favorite song.

  Enjoy!
*/


/*** include extra files ***/
#include <Servo.h>
#include "pitches.h"


/*** My Global Variables ***/


//to read ASCII
int inByte = 0;


//buzzer's pin
const int buzzerPin = 11;



/*** Global Variables for the servo motor ***/


//declaring the servo
Servo servo;


//the delay or interval
int interval = 200;


int increment = 50;


//the last position of the servo
unsigned long lastPos;


//the current position of the servo
int currentServoPos = 10;



/*** Global Variables for the tune (Take On Me by A-ha) ***/


// how fast the tune is played
int tempo = 160;


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

  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  //attach servo pin
  servo.attach(10);

  // set buzzer as OUTPUT
  pinMode(buzzerPin, OUTPUT);


  establishContact();


}

void loop() {

  unsigned long currentMillis = millis();


  if (Serial.available() > 0) {

    inByte = Serial.read();

    // servo and buzzer work, when the player is at winning location:
    if (inByte == 'W') {

      if ((currentMillis - currentNoteStartedAt >= millisToNextNote) && (currentMillis - lastPos > interval)) {


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
        if ((currentServoPos >= -10) || (currentServoPos <= -180)) {

          increment = -increment;
        }

      }

    }

  }

}



void establishContact() {

  while (Serial.available() <= 0) {
    delay(300);

  }

}
