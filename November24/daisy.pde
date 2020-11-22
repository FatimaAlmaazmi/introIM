
import processing.sound.*;
SoundFile file;

import processing.serial.*;
Serial myPort;

PImage stem;
PImage daisy;

float xpos;
float ypos;


void setup() {

  println(Serial.list());

  myPort = new Serial(this, Serial.list()[3], 9600);

  myPort.bufferUntil('\n');

  file = new SoundFile(this, "wow.mp3");

  size(500, 500);

  imageMode(CENTER);

  stem = loadImage("stem.png");
  daisy = loadImage("daisy.png");
  
 
}


void draw() {


  drawBackground();
  image(daisy, xpos, ypos, 300, 300);


  
}


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


  //if(xpos <= 270 && xpos >= 230 && ypos <= 100 && ypos >= 155){

  //  myPort.write("H");
  //  file.play();

  //}
  
  
}



void drawBackground() {
  background(228, 189, 252);
  image(stem, 230, 300);
}
