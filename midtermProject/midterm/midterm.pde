
PImage duck;
PImage angryDuck;
PImage loveDuck;
PImage aClick;
PImage home;
PImage spritesheet;
PImage[][] sprites;

int direction = 1;
int step = 0;
int x = 70;
int y = 520;
int speed = 3;

Duck play;

void setup() {
  size(600, 600);
  background(255);
  imageMode(CENTER);
  
  
  play = new Duck();

  duck = loadImage("duck.png");
  angryDuck = loadImage("angryduck.png");
  loveDuck = loadImage("loveduck.png");
  aClick = loadImage("aclick.png");
  home = loadImage("home.png");
  

   
   //play.displayStart();
   
   
}

void draw() {
  play.displayStart();

  if(mousePressed == true && mouseX <=430 && mouseX >= 150 && mouseY <= 503 && mouseY >= 397){
      
      displayGame();
     
         moveDuck();
    }
 
}


 void displayDuck(int direction, int step, int x, int y) {
    
     step = 0;
     
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

   
    image(sprites[direction][step], x, y);
  }


  void moveDuck() {
     
     speed = 3;
     
     
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
      if (frameCount%speed==0) { //mkes suer it happens at every third frame
        step = (step+1) % 2;
      }
    }

    displayDuck(direction, step, x, y);
    
    
  }
  
  
    void displayGame() {
   
    background(212, 238, 250);

    home.resize(200, 200);
    image(home, 480, 100);

    pushMatrix();
    translate(400, 400);
    rotate(radians(-70));
    aClick.resize(200, 200);
    image(aClick, 0, 0);
    popMatrix();

    pushMatrix();
    translate(90, 320);
    rotate(radians(-40));
    aClick.resize(160, 160);
    image(aClick, 0, 0);
    popMatrix();

    pushMatrix();
    translate(100, 80);
    aClick.resize(140, 140);
    image(aClick, 0, 0);
    popMatrix();

    pushMatrix();
    translate(520, 250);
    aClick.resize(120, 120);
    image(aClick, 0, 0);
    popMatrix();

    pushMatrix();
    translate(200, 500);
    aClick.resize(120, 120);
    image(aClick, 0, 0);
    popMatrix();

    pushMatrix();
    translate(300, 240);
    aClick.resize(100, 100);
    image(aClick, 0, 0);
    popMatrix();

   noLoop();  /// this makes the game screen stay still, but doesnt make the duck move :(

   //moveDuck();
    
  }
  

 
