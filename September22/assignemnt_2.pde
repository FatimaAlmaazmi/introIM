void drawWing(int xPos, int yPos) {  //function that draws the lines for the wing

  stroke(247, 75, 127);
  line(xPos, yPos, 150, 170);
}

void setup() {

  size(300, 300);
  background(242, 208, 223);

  stroke(0, 0, 0, 0);
  fill(247, 75, 127);
  triangle(70, 140, 110, 130, 100, 120); // triangle for crane's beak
  triangle(100, 120, 120, 170, 155, 171); // triangle for crane's neck
  triangle(150, 170, 240, 120, 170, 170); // triangle for crane's tail?

  fill(229, 148, 67, 100);
  ellipse(20, 20, 20, 20);  // cirlce in the top left corner


  for (int i = 80, d = 155; i<= 190 && d<= 190; i+=5, d+=2) { // for loop to draw wing1

    drawWing(d, i);
  }


  for (int i = 100, d = 100; i<= 200 && d<= 190; i+=5, d+=2) { // for loop to draw wing2

    drawWing(i, d);
  }


  for (int i = 0, d = 0; i<= 200 && d<= 190; i+=4, d+=4) { // for loop to draw basic lines across the right side
    stroke(255, 255, 255, 150);
    line(i, height, width, d);
  }

  for (int i = 300, d = 300; i>= 0 && d>= 50; i-=4, d-=4) { // another for loop to draw basic lines across the right side
    stroke(255, 255, 255, 150);
    line(i, height, width, d);
  }
}
