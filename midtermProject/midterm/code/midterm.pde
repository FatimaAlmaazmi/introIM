
import processing.sound.*;

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

Duck play;

void setup() {
  size(600, 600);
  background(255);
  imageMode(CENTER);


  play = new Duck();


  file = new SoundFile(this, "quack.wav");

  duck = loadImage("duck.png");
  angryDuck = loadImage("angryduck.png");
  loveDuck = loadImage("loveduck.png");
  aClick = loadImage("aclick.png");
  home = loadImage("home.png");

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
  if (state == 0) {


    displayStart();
  } else if (state == 1) {

    displayGame();
  } else if (state == 2) {

    displayLose();
  } else if (state == 3) {

    displayWin();
  }


  //set of if statements that mark the losing areas

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
  if ( x >= 230 && x <= 320 && y >= 150 && y <= 240) {
    state = 2;
  }



  //if statement that marks the winning area
  if (x >= 420 && x <= 480 && y <= 100 && y >= 80) {

    state = 3;
  }
  
}




void mouseClicked() {

  if (state == 0 && mouseX <=430 && mouseX >= 150 && mouseY <= 503 && mouseY >= 397) {

    state = 1;
    play.moveDuck();
  }

  if (state == 2) {

    loop();

    restart();
  }

  if (state == 3) {

    restart();
  }
}




void displayGame() {

  background(212, 238, 250);

  home.resize(200, 200);
  image(home, 480, 100);


  pushMatrix();
  translate(400, 400);
  rotate(radians(-70));
  aClick.resize(200, 200);
  click(0, 0);
  popMatrix();

  pushMatrix();
  translate(90, 320);
  rotate(radians(-40));
  aClick.resize(160, 160);
  click(0, 0);
  popMatrix();

  pushMatrix();
  translate(100, 80);
  aClick.resize(140, 140);
  click(0, 0);
  popMatrix();

  pushMatrix();
  translate(520, 250);
  aClick.resize(120, 120);
  click(0, 0);
  popMatrix();

  pushMatrix();
  translate(200, 500);
  aClick.resize(120, 120);
  click(0, 0);
  popMatrix();

  pushMatrix();
  translate(300, 240);
  aClick.resize(100, 100);
  click(0, 0);
  popMatrix();

  play.moveDuck();
}




void displayStart() { //displays the start screen

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



void displayLose() {

  if (!file.isPlaying()) {

    noLoop();
    file.play();
  }

  fill(183, 225, 245); //added a colored rect with the size of the canvas so that the text appears better
  rect(width/2, height/2, 700, 700);

  angryDuck.resize(290, 290);
  image(angryDuck, 290, 250);

  PFont lose = createFont ("Kefa-Regular", 32);
  textFont(lose, 32); 
  fill(0);
  text("Quack!", 230, 80);

  PFont lose1 = createFont ("Kefa-Regular", 30);
  textFont(lose1, 30); 
  fill(0);
  text("You lost. Click anywhere to start again", 40, 460);
}



void displayWin() {

  fill(183, 225, 245); //added a colored rect with the size of the canvas so that the text appears better
  rect(width/2, height/2, 700, 700);

  loveDuck.resize(290, 290);
  image(loveDuck, 290, 250);

  PFont win = createFont ("Kefa-Regular", 32);
  textFont(win, 32); 
  fill(0);
  text("Yay! Thank you!", 180, 60);

  PFont win1 = createFont ("Kefa-Regular", 30);
  textFont(win1, 30); 
  fill(0);
  text("You won. Click anywhere to start again.", 40, 460);
}


void restart() {
  state = 0;
  x = 70;
  y = 520;
}

void click(int x, int y){
  
  image(aClick, x, y);
}
