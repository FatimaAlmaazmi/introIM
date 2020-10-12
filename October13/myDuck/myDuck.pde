/*
Fatima Almaazmi. 13th October 2020.

myDuck is a program that manipulates an image of a duck in different emotions depending
on where you click on it.

Click on the duck's face and it will get angry and "Quack!" at you. Click on its tummy
and it will feel loved. Leave the duck alone and it will sit quietly.

Enjoy!
*/


// my global variables
PImage duck;
PImage angryDuck;
PImage loveDuck;
color d;


void setup() {

  size(500, 500);
  background(255);
 
  imageMode(CENTER); 


  duck = loadImage("myduck.jpeg");
  angryDuck = loadImage("angryduck.jpeg");
  loveDuck = loadImage("loveduck.jpeg");
  
  
}






void draw() {

  //resizing the images so that they fit the canvas
  duck.resize(width, height); 
  angryDuck.resize(width, height);
  loveDuck.resize(width, height);


 // this draws the normal duck image in tiny circles
  if (mousePressed == false) { 
    for (int i=0; i< 500; i++) {

      float x = random(width);
      float y = random(height);
      d = duck.get(int(x), int(y));
      drawCircles(x, y);
      
    }
  }


 // this draws the angry duck image in tiny circles when you click on its face
  if ((mouseX >= 50 && mouseX <= 400) && (mouseY >= 50 && mouseY <= 200)) {
    if (mousePressed == true) {

      for (int i=0; i< 500; i++) {

        float x = random(width);
        float y = random(height);
        d = angryDuck.get(int(x), int(y));
        drawCircles(x, y);

        text();
        
      }
    }
  }


 // this draws the loved duck image in tiny circles when you click on its tummy
  if ((mouseX >= 100 && mouseX <= 400 ) && (mouseY >= height/2 && mouseY <= 450)) {
    if (mousePressed == true) {

      for (int i=0; i< 500; i++) {

        float x = random(width);
        float y = random(height);
        d = loveDuck.get(int(x), int(y));
        drawCircles(x, y);
        
      }
    }
  }
  
}



//My functions

void drawCircles(float x, float y) { //this is a function that draws the circles

  noStroke();
  fill(d);
  ellipse(x, y, 5, 5);
  
}

void text() { //this is a function for the text that comes up with the angry duck

  PFont angry = createFont ("BradleyHandITCTT-Bold", 32);
  textFont(angry, 32);

  pushMatrix();
  fill(0);
  translate(60, 100);
  rotate(radians(-30));
  text("QUACK!", 0, 0);
  popMatrix();
  
}
