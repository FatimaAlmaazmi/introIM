class Duck {

 



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


  //void displayLose() {

  //  if (mousePressed == true) {

  //    displayGame();
  //  }
  //}



  void displayWin() {

    if (mousePressed == true) {

      play.displayStart();
    }
  }
}
