/* 
 Fatima Almaazmi. 24th November 2020.
 
 This is the Processing program for the Daisy Game. 
 
 In this game, you will control the position of the daisy with a potentiometer,
 photoresistor and button. The end goal is to place the daisy on the stem.
 Once you do a 'wow' sound will play to tell you that you have won!
 
 Enjoy!
 */




// Import stuff here, and declare their varibales:

import processing.sound.*;
SoundFile file;

import processing.serial.*;
Serial myPort;

/*** My Global Variables ***/

PImage stem;
PImage daisy;

float xpos;
float ypos;


void setup() {

  // code part for serial:
  println(Serial.list());

  myPort = new Serial(this, Serial.list()[3], 9600);

  myPort.bufferUntil('\n');

  // import sound file:
  file = new SoundFile(this, "wow.mp3");

  // import images:
  stem = loadImage("stem.png");
  daisy = loadImage("daisy.png");

  // setup the canvas:

  size(500, 500);

  imageMode(CENTER);
}



void draw() {

  drawBackground();

  image(daisy, xpos, ypos, 300, 300);
}


// contact with arduino:

void serialEvent(Serial myPort) {

  String myString = myPort.readStringUntil('\n');
  myString = trim(myString);

  int sensors[] = int(split(myString, ','));

  for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
    print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
  }

  println();


  if (sensors.length > 1 && sensors[2] == 255) {
    xpos = map(sensors[0], 0, 1023, 0, width);
    ypos = map(sensors[1], 0, 1023, 0, height);
  }

  myPort.write("A"); 


  if (xpos <= 270 && xpos >= 230 && ypos <= 190 && ypos >= 100 && !file.isPlaying()) {

    myPort.write("H");
    file.play();
    noLoop();
  }
}



void drawBackground() {
  background(228, 189, 252);
  image(stem, 230, 300);
}
