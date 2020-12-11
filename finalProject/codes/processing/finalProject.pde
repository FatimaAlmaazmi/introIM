/*
  Fatima Almaazmi. 10th December 2020.
 
 This is the Processing program for my Disco Dog game.
 
 In this game, you have to take the dog to the disco by following the
 correct path. If you step on a wrong platform, you will start from
 the beginning. If you win, the dog will dance at the disco to his
 favorite song.
 
 Enjoy!
 */


/*** import extra files ***/

import processing.sound.*;
SoundFile file;

import processing.serial.*;
Serial myPort;

/*** My Global Variables ***/

//images:
PImage dog;
PImage happyDog;
PImage sadDog;
PImage [] dogSprite;
PImage disco;
PImage sprite;
PImage[] notes;
PImage title;

//correct platforms:
Platforms correct1;
Platforms correct2;
Platforms correct3;
Platforms correct4;
Platforms correct5;

//wrong platforms:
Platforms wrong1;
Platforms wrong2;
Platforms wrong3;
Platforms wrong4;
Platforms wrong5;
Platforms wrong6;
Platforms wrong7;
Platforms wrong8;
Platforms wrong9;

//variables for dog to move:
int direction;
int step = 0;
int dogX= 90;
int dogY= 620;
int speed = 5;

//extra variable:
int state = 0;


void setup() {

  println(Serial.list());

  myPort = new Serial(this, Serial.list()[3], 9600);

  myPort.bufferUntil('\n');

  //setup the canvas
  size(700, 700);
  background(255);

  //upload sound files:
  file = new SoundFile(this, "sadDogSound.wav");



  correct1 = new Platforms();
  correct2 = new Platforms();
  correct3 = new Platforms();
  correct4 = new Platforms();
  correct5 = new Platforms();


  wrong1 = new Platforms();
  wrong2 = new Platforms();
  wrong3 = new Platforms();
  wrong4 = new Platforms();
  wrong5 = new Platforms();
  wrong6 = new Platforms();
  wrong7 = new Platforms();
  wrong8 = new Platforms();
  wrong9 = new Platforms();


  //set image mode to center:
  imageMode(CENTER);

  //upload images:
  dog = loadImage("dogStart.png");
  happyDog = loadImage("dogHappy.png");
  sadDog = loadImage("dogSad.png");
  disco = loadImage("discoball.png");
  title = loadImage("title.png");

  notes = new PImage [3];

  for (int i=0; i<=2; i++) {
    notes [i] = loadImage("note"+i+".png");
  }


  sprite = loadImage("sprite.png");
  sprite.resize(300, 300);
  dogSprite = new PImage [2];

  for (int i=0; i<2; i++) {
    dogSprite[i] = loadImage("dog"+i+".png");
  }
}


void draw() {


  if (state == 0) { //displays start screen

    displayStart();
  } else if (state == 1) { //displays game screen

    displayGame();
  } else if (state == 2) { //displays losing screen

    displayLose();
  } else if (state == 3) { //displays winning screen

    displayWin();
  }

  // checks the wrong platforms and ends the game
  wrong1.checkWrongPlatform();
  wrong2.checkWrongPlatform();
  wrong3.checkWrongPlatform();
  wrong4.checkWrongPlatform();
  wrong5.checkWrongPlatform();
  wrong6.checkWrongPlatform();
  wrong7.checkWrongPlatform();
  wrong8.checkWrongPlatform();
  wrong9.checkWrongPlatform();



  if (dogX >= 595 && dogX <= 700 && dogY <= 100 && dogY >= 0) {

    state = 3;
    displayWin();
  }


  // tells arduino that the player is in the winning location 
  if (dogX >= 595 && dogX <= 700 && dogY <= 100 && dogY >= 0 ) {

    myPort.write("W");
  }
}



void  mouseClicked() {

  if (state ==0 && mouseX >= 200 && mouseX <= 510 && mouseY >= 510 && mouseY <= 610) {

    state = 1;
    moveDog();
  }

  if (state == 2) {

    loop();
    restart();
  }

  if (state == 3) {

    restart();
  }
}




// does not work for some reason. Keeping it just in case.
void serialEvent(Serial myPort) {
}


/*** My Functions ***/

void displayStart() {

  rectMode(CENTER);
  noStroke();

  //add a rectangle as background so text appear better
  fill(66, 45, 75);
  rect(width/2, height/2, width, height);

  //start button box and the colored platforms:
  fill(0);
  rect(355, 560, 310, 100);

  fill(245, 25, 54, 200);
  rect(230, 535, 40, 40);

  fill(25, 245, 59, 200);
  rect(230, 585, 40, 40);

  fill(222, 25, 245, 200);
  rect(280, 585, 40, 40);

  fill(25, 245, 243, 200);
  rect(280, 535, 40, 40);

  fill(245, 255, 49, 200);
  rect(330, 535, 40, 40);

  fill(245, 25, 54, 200);
  rect(330, 585, 40, 40);

  fill(25, 245, 243, 200);
  rect(380, 535, 40, 40);

  fill(245, 255, 49, 200);
  rect(380, 585, 40, 40);

  fill(222, 25, 245, 200);
  rect(430, 535, 40, 40);

  fill(25, 245, 59, 200);
  rect(430, 585, 40, 40);

  fill(245, 25, 54, 200);
  rect(480, 535, 40, 40);

  fill(25, 245, 243, 200);
  rect(480, 585, 40, 40);

  //add images:

  image(disco, 350, 100, 400, 400);
  image(title, 350, 120, 190, 190);

  image(notes[0], 540, 250, 100, 100);
  image(notes[1], 120, 190, 100, 100);
  image(notes[2], 160, 300, 100, 100);
  image(notes[2], 580, 130, 100, 100);

  image(dog, 350, 350, 450, 450);


  //add text or instructions:
  PFont start = createFont ("AvenirNext-HeavyItalic", 32);
  textFont(start, 52); 
  fill(0);
  text("START", 275, 575);

  PFont start1 = createFont ("AvenirNext-HeavyItalic", 32);
  textFont(start1, 50); 
  fill(255);
  text("START", 273, 575);


  PFont start2 = createFont ("AvenirNext-DemiBold", 15);
  textFont(start2, 15); 
  fill(250, 250, 139);
  text("   BUT MAKE SURE TO"+ '\n'+ "FOLLOW THE CORRECT "+'\n'+"  PATH TO THE DISCO!", 500, 420);

  PFont start3 = createFont ("AvenirNext-DemiBold", 15);
  textFont(start3, 15); 
  fill(250, 250, 139);
  text("   HELP THE DISCO DOG"+ '\n' +" GET TO THE DISCO AND"+ '\n' +"DANCE THE NIGHT AWAY!", 40, 430);

  PFont start4 = createFont ("AvenirNext-DemiBold", 15);
  textFont(start4, 15); 
  fill(255);
  text("hint: use arrow keys to move dog!", 450, 680);
}



void displayGame() {

  rectMode(CENTER);

  //add a rectangle as background because it is convenient
  fill(0);
  rect(width/2, height/2, height, width);


  noStroke();

  // platforms on row 1:

  wrong1.display(87.5, 87.5, 245, 255, 49);

  wrong2.display(87.5, 262.5, 245, 25, 54);

  // platform 1 to correct path

  correct1.display(87.5, 437.5, 245, 168, 91);



  // platforms on row 2:

  wrong3.display(262.5, 87.5, 245, 168, 91);

  //platform 3 to correct path
  correct3.display(262.5, 262.5, 25, 245, 243);

  //platfrom 2 to correct path
  correct2.display(262.5, 437.5, 245, 25, 54);

  wrong4.display(262.5, 612.5, 25, 245, 59);


  // platforms on row 3:

  //platform 3 to correct path
  correct5.display(437.5, 87.5, 222, 25, 245);

  //platform 4 to correct path
  correct4.display(437.5, 262.5, 25, 245, 59);

  wrong5.display(437.5, 437.5, 222, 25, 245);


  wrong6.display(437.5, 612.5, 245, 255, 49);


  //platforms + image on row 4:

  image(disco, 612.5, 87.5, 170, 170);

  //platform 9 to correct path
  wrong7.display(612.5, 262.5, 255, 0, 0);


  //platform 8 to correct path
  wrong8.display(612.5, 437.5, 25, 245, 59);


  //platform 7 to correct path
  wrong9.display(612.5, 612.5, 222, 25, 245);



  // calling a function to display dog and move it
  moveDog();
}


void displayLose() {

  if (!file.isPlaying()) {

    noLoop(); // to play the sound once
    file.play();
  }


  rectMode(CENTER);
  noStroke();

  //add a rectangle as background so text appear better
  fill(66, 45, 75);
  rect(width/2, height/2, width, height);

  // display images:

  image(sadDog, 350, 300, 500, 500);

  //display text:
  PFont win = createFont ("AvenirNext-DemiBold", 20);
  textFont(win, 20); 
  fill(255);
  text("Click Anywhere To Play Again!", 210, 590);


  PFont win1 = createFont ("AvenirNext-DemiBold", 35);
  textFont(win1, 35); 
  fill(250, 250, 139);
  text("OOPS! WRONG WAY!", 170, 550);
}



void displayWin() {

  rectMode(CENTER);
  noStroke();

  //add a rectangle as background so text appear better
  fill(66, 45, 75);
  rect(width/2, height/2, width, height);

  // display images:
  image(disco, 350, 100, 400, 400);

  image(notes[0], 540, 250, 100, 100);
  image(notes[1], 120, 190, 100, 100);
  image(notes[2], 160, 300, 100, 100);
  image(notes[2], 580, 130, 100, 100);

  image(happyDog, 350, 350, 450, 450);

  //display text:
  PFont win = createFont ("AvenirNext-DemiBold", 20);
  textFont(win, 20); 
  fill(255);
  text("Click Anywhere To Play Again!", 210, 590);


  PFont win1 = createFont ("AvenirNext-DemiBold", 35);
  textFont(win1, 35); 
  fill(250, 250, 139);
  text("YOU DID IT!", 250, 550);
}


void moveDog() {


  if (keyPressed) {
    if (keyCode == DOWN) {
      direction = 1;
      dogY+=speed;
    }
    if (keyCode == LEFT) {
      direction = 1;
      dogX-=speed;
    }
    if (keyCode == RIGHT) {
      direction = 0;
      dogX+=speed;
    }
    if (keyCode == UP) {
      direction = 0;
      dogY-=speed;
    }
  }

  image(dogSprite[direction], dogX, dogY, 200, 200);
}



void restart() { //restarts game

  state = 0;
  dogX = 70;
  dogY = 620;
}
