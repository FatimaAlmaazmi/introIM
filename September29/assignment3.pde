class SadHappy {

  void drawHappy() { //this function draws happy

    fill(254, 255, 3);
    ellipse(width/2, height/2, 400, 400);  //draw face

    fill(0);
    ellipse(320, 180, 50, 150);  //draw eyes
    ellipse(180, 180, 50, 150);

    fill(0, 0, 0, 0);
    arc(width/2, 200, 350, 350, 0, radians(180)); //draw smile
  }

  void drawSad() {  //this function draws sad
    fill(254, 255, 3);
    ellipse(width/2, height/2, 400, 400);  //draw face

    fill(0);
    ellipse(320, 180, 50, 150);  //draw eyes
    ellipse(180, 180, 50, 150);

    fill(0, 0, 0, 0);
    arc(width/2, 390, 200, 200, radians(180), radians(360)); //draw frown
  }
}

void setup() {
  size(500, 500);
  frameRate(10);
}

SadHappy one = new SadHappy(); //initializing an object called one

void draw() {
  background(random(0, 255), random(0, 255), random(0, 255));

  one.drawHappy();

  if (mousePressed == true) {

    one.drawSad();
  }
}
