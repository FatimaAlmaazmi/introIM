class Platforms {

  float platformX;
  float platformY;
  int platformWidth = 150;
  int platformHeight = 150;


  void display(float x, float y, int r, int g, int b ) {

    platformX = x;
    platformY = y;

    noStroke();
    fill(r, g, b);
    rect(platformX, platformY, platformWidth, platformHeight);
  }

  void checkWrongPlatform() {

    float distance = dist(platformX, platformY, dogX, dogY);

    if (distance < platformWidth/3 && distance < platformHeight) {

      displayLose();
      state = 2;
    }
  }


  //void checkCorrectPlatform () {

  //  float distance = dist(platformX, platformY, dogX, dogY);
    
  //      if (distance < platformWidth/3 && distance < platformHeight) {

  //    myPort.write("A");
  //  }
    
  //}
}
