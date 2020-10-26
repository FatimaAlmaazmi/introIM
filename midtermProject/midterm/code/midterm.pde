/*
 Fatima Almaazmi. 27th October 2020.
 
 This program is a game based on my previous assignment with the duck. In this game the
 player will take on the mission of helping the little duck back home to its pond, while 
 avoiding any annoying clicks on the way.
 
 Click on start, and move the duck with the arrow keys. 
 
 Enjoy!
 */



import processing.sound.*;


// My global variables
SoundFile file;

PImage duck;
PImage angryDuck;
PImage loveDuck;
PImage aClick;
PImage home;
PImage spritesheet;
PImage[][] sprites;

int state = 0;
int direction;
int step = 0;
int x = 70;
int y = 520;
int speed = 5;


void setup() {

  size(600, 600);
  background(255);
  imageMode(CENTER);


  // loading images and sounds

  file = new SoundFile(this, "quack.wav");

  duck = loadImage("duck.png");
  angryDuck = loadImage("angryduck.png");
  loveDuck = loadImage("loveduck.png");
  aClick = loadImage("aclick.png");
  home = loadImage("home.png");


  // loading the sprite for the duck 
  spritesheet = loadImage("spriteduck.png");
  spritesheet.resize(200, 200);
  sprites = new PImage[2][2];

  int w = spritesheet.width/2;
  int h = spritesheet.height/2;

  for (int i=0; i < 2; i++) {
    for (int j=0; j< 2; j++) {
      sprites[i][j] = spritesheet.get(i*w, j*h, w, h);
    }
  }
  
}




void draw() {

  //the states of the game and what it displays on screen

  if (state == 0) { // state = 0 is the start screen


    displayStart();
  } else if (state == 1) { // state = 1 is the game screen

    displayGame();
  } else if (state == 2) { // state = 2 is the losing screen

    displayLose();
  } else if (state == 3) { // state = 3 is the winning screen

    displayWin();
  }


  //set of if statements that mark the losing areas:

  //first click
  if (x >= 320 && x <= 400 && y >= 350 && y <=400 ) {

    state = 2;
  }

  //second click
  if ( x >= 20 && x <= 130 && y >= 300 && y <= 400) {
    state = 2;
  }

  //third click
  if ( x >= 50 && x <= 150 && y >= 50 && y <= 100) {
    state = 2;
  }

  //fourth click
  if ( x >= 500 && x <= 520 && y >= 200 && y <= 250) {
    state = 2;
  }

  //fifth click
  if ( x >= 150 && x <= 200 && y >= 450 && y <= 600) {
    state = 2;
  }

  //sixth click
  if ( x >= 230 && x <= 320 && y >= 150 && y <= 290) {
    state = 2;
  }



  //if statement that marks the winning area
  if (x >= 420 && x <= 500 && y >= 80 && y <= 140) {

    state = 3;
  }
  
}




void mouseClicked() {

  // starts the game
  if (state == 0 && mouseX <=430 && mouseX >= 150 && mouseY <= 503 && mouseY >= 397) {

    state = 1;
    moveDuck();
  }

  // restarts the game at the losing screen
  if (state == 2) {

    loop(); // to cancel out the noLoop(); in the displayLose();

    restart();
  }

  // restarts the game at the winning screen
  if (state == 3) {

    restart();
  }
  
}



// My functions:



void displayStart() { // This function displays the start screen

  rectMode(CENTER); //rect point of origin at center
  noStroke();

  fill(183, 225, 245); //added a colored rect with the size of the canvas so that the text appears better
  rect(width/2, height/2, 700, 700);

  fill(0); 
  rect(290, 450, 280, 105, 30, 30, 30, 30);

  fill(170, 216, 164);
  rect(width/2, 450, 250, 100, 30, 30, 30, 30);

  fill(190, 245, 183);
  rect(280, 450, 250, 100, 30, 30, 30, 30);

  duck.resize(250, 250);
  image(duck, 290, 250); //displays the image of the duck


  aClick.resize(80, 80);
  image(aClick, 165, height/2); //displays the 1st click

  pushMatrix(); //displays the 2nd clicks
  translate(400, 200);
  rotate(radians(-60));
  image(aClick, 0, 0);
  popMatrix();

  pushMatrix(); //displays the 3rd click
  translate(350, 350);
  rotate(radians(-60));
  image(aClick, 0, 0, 65, 65);
  popMatrix();


  //texts displayed
  PFont start = createFont ("Kefa-Regular", 32);
  textFont(start, 32); 
  fill(0);
  text("Can you help me get back home?", 60, 60);

  PFont start1 = createFont ("Kefa-Regular", 15);
  textFont(start1, 15); 
  fill(0);
  text("(Make sure to avoid any annoying clicks on the way)", 120, 120);

  PFont start2 = createFont ("Kefa-Bold", 50);
  textFont(start2, 50); 
  fill(0);
  text("Start", 225, 460);

  PFont start3 = createFont ("Kefa-Regular", 15);
  textFont(start3, 15); 
  fill(0);
  text("hint: use arrow keys to move duck", 350, 580);
  
}




void displayGame() { // This function displays the game screen

  background(212, 238, 250);


  // displaying home
  image(home, 480, 100, 200, 200);


  // displaying the annoying clicks
  pushMatrix();
  translate(400, 400);
  rotate(radians(-70));
  image(aClick, 0, 0, 200, 200);
  popMatrix();

  pushMatrix();
  translate(90, 320);
  rotate(radians(-40));
  image(aClick, 0, 0, 160, 160);
  popMatrix();

  pushMatrix();
  translate(100, 80);
  image(aClick, 0, 0, 140, 140);
  popMatrix();


  pushMatrix();
  translate(520, 250);
  image(aClick, 0, 0, 120, 120);
  popMatrix();

  pushMatrix();
  translate(200, 500);
  image(aClick, 0, 0, 120, 120);
  popMatrix();

  pushMatrix();
  translate(300, 240);
  image(aClick, 0, 0, 100, 100);
  popMatrix();

  // calling a function to display the duck and move it
  moveDuck();
  
}




void displayLose() { // This function displays the losing screen

  if (!file.isPlaying()) {

    noLoop(); // to play the sound once
    file.play();
    
  }


  fill(183, 225, 245); //added a colored rect with the size of the canvas so that the text appears better
  rect(width/2, height/2, 700, 700);


  angryDuck.resize(290, 290);
  image(angryDuck, 290, 250);

  aClick.resize(80, 80);
  image(aClick, 165, height/2); //displays the 1st click

  pushMatrix(); //displays the 2nd clicks
  translate(400, 200);
  rotate(radians(-60));
  image(aClick, 0, 0);
  popMatrix();

  pushMatrix(); //displays the 3rd click
  translate(350, 350);
  rotate(radians(-60));
  image(aClick, 0, 0, 65, 65);
  popMatrix();


  // display the texts
  PFont lose = createFont ("Kefa-Regular", 32);
  textFont(lose, 32); 
  fill(0);
  text("Quack! You Lost!", 170, 80);

  PFont lose1 = createFont ("Kefa-Regular", 28);
  textFont(lose1, 28); 
  fill(0);
  text("click anywhere to start again.", 100, 460);
  
}



void displayWin() { // This function displays the winning screen

  fill(183, 225, 245); //added a colored rect with the size of the canvas so that the text appears better
  rect(width/2, height/2, 700, 700);


  
  image(home, 290, 260, 300, 300);

  loveDuck.resize(150, 150);
  image(loveDuck, 290, 259);


  //display the text
  PFont win = createFont ("Kefa-Regular", 32);
  textFont(win, 32); 
  fill(0);
  text("Yay! You Did It!", 180, 80);

  PFont win1 = createFont ("Kefa-Regular", 28);
  textFont(win1, 28); 
  fill(0);
  text("click anywhere to start again.", 100, 460);
  
}




void moveDuck() { // This function moves the duck

  if (keyPressed) {
    if (keyCode == DOWN) {
      direction = 1;
      y+=speed;
    }
    if (keyCode == LEFT) {
      direction = 1;
      x-=speed;
    }
    if (keyCode == RIGHT) {
      direction = 0;
      x+=speed;
    }
    if (keyCode == UP) {
      direction = 0;
      y-=speed;
    }
    if (frameCount%speed==0) { 
      step = (step+1) % 2;
    }
  }

  image(sprites[direction][step], x, y);
  
}




void restart() { // This function restarts the game

  state = 0;
  x = 70;
  y = 520;
  
}
