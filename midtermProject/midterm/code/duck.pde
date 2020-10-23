class Duck {

  
  
  
  void moveDuck() {


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
    
    if(!file.isPlaying()){
      file.play();
      noLoop();
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

}
