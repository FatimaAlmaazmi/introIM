PImage duck;
PImage angryDuck;
color d;

void setup() {
  
  size(500, 500);
  background(255);
  imageMode(CENTER);
  
  
  duck = loadImage("myduck.jpeg");
  angryDuck = loadImage("angryduck.jpeg");

//duck.resize(width, height);
//  image(duck, width/2, height/2);

}




void draw() {

  duck.resize(width, height);
  angryDuck.resize(width, height);

  //image(duck, width/2, height/2);
  for (int i=0; i< 500; i++) {

    float x = random(width);
    float y = random(height);
    d = duck.get(int(x), int(y));
    drawCircles(x, y);
  }


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



void drawCircles(float x, float y) {

  noStroke();
  fill(d);
  ellipse(x, y, 5, 5);
}

void text(){
  
 PFont angry = createFont ("BradleyHandITCTT-Bold", 32);
 textFont(angry, 32);

 pushMatrix();
 fill(0);
 translate(60, 100);
 rotate(radians(-30));
 text("QUACK!", 0, 0);
 popMatrix();
 
}
