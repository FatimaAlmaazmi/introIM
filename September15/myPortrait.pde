void setup() {

  // code for canvas

  size (490, 390);
  background(215, 237, 250);


  // code for leaves in the background

  int spacing = 75; // initialize the spacing between each column and row 
  int cols = width/ spacing; // initializing a variable for columns which is the width divided into parts
  int rows = height/ spacing; // initialize a variable for rows which is the height divided into parts

  // nested for loop to have one for both columns and rows

  for (int i=0; i<=cols; i++) {  // this for loop is for columns
    for (int j=0; j<=rows; j++) { // this for loop is for rows

      int x = i * spacing;  // x-coordinate will change by 60 everytime
      int y = j * spacing;  // y-coordinate will change by 60 everytime

      stroke(112, 142, 92); 
      fill(150, 191, 121, 60);
      arc(x, y, 60, 60, radians(90), radians(180), CHORD); // draw the shape with changing x and y coordinates
    }
  }


  //code for hair behind head

  stroke(0, 0, 0, 0);
  fill(28, 19, 20);
  rect(146, 199, 200, 200);


  // code for head and neck

  stroke(0);
  fill(245, 219, 198);
  rect(223, 340, 50, 50);
  ellipse(245, 199, 300, 300);


  // code for hair

  stroke(0, 0, 0, 0);
  fill(28, 19, 20);
  arc(250, 174, 295, 250, radians(270), radians(360));
  arc(240, 174, 295, 250, radians(180), radians(270));
  rect(235, 50, 30, 40);


  stroke(25, 59, 36);
  fill(32, 124, 63);
  rect(240, 35, 10, 40);

  stroke(211, 155, 0);
  fill(242, 181, 10);
  ellipse(245, 30, 20, 20);


  // code for flower
  stroke(175, 111, 160);
  fill(245, 230, 238);

  ellipse(230, 30, 10, 10);
  ellipse(233, 20, 10, 10);  // 3 petals on left side
  ellipse(233, 40, 10, 10);

  ellipse(245, 16, 10, 10);
  // middle top and bottom petals
  ellipse(245, 44, 10, 10);  

  ellipse(260, 30, 10, 10);
  ellipse(257, 40, 10, 10);  // 3 petals on the right side
  ellipse(257, 20, 10, 10);


  // codes for eyes

  stroke(0);
  fill(255, 255, 255);
  ellipse(178, 220, 90, 90); // right eye circle #1
  ellipse(308, 220, 90, 90);// left eye circle #1

  fill(0, 0, 0);
  ellipse(178, 220, 70, 70); // right eye circle #2
  ellipse(308, 220, 70, 70); // left eye circle #2

  fill(0, 0, 0, 0);
  arc(125, 205, 20, 10, 0, radians(180)); // right eye wing
  arc(361, 205, 20, 10, 0, radians(180)); // left eye wing


  //  code for cheeks

  stroke(0, 0, 0, 0);
  fill(240, 177, 185, 50);
  ellipse(308, 300, 40, 40);
  ellipse(178, 300, 40, 40);


  // code for nose

  stroke(0, 0);
  fill(250, 185, 131);
  triangle(245, 250, 230, 290, 260, 290);


  // code for light on nose

  stroke(0, 0);
  fill(255, 255, 255, 90);
  triangle(233, 285, 238, 285, 239, 275);


  //  code for mouth

  stroke(0, 0, 0);
  fill(0, 0, 0, 0);
  arc(245, 310, 30, 9, 0, radians(180));
}
