
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

    play.displayStart();
    
  } else if(state == 1){
    
    play.displayGame();
    
  } else if (state == 2){
    
    play.displayLose();
    
  } else if (state == 3){
    
    play.displayWin();
    
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
  if ( x >= 150 && x <= 200 && y >= 450 && y <= 500) {
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
   state = 0;
   
  }
  
  if (state == 3) {
   
    state = 0;
    
  }
  
 
}
