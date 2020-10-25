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

 
  
  
  
}
