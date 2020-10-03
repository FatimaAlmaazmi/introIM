//String data[];  i'll see how i might deal with this

void setup() {
  size(400, 400); 
  background(225, 241, 250);

  drawNYC();
  drawDog();

  String dogs[] = loadStrings("dogNames3.csv");

  println(dogs.length);

printArray(dogs);
  
  //printArray(data);
}



void drawDog(){
  
  noStroke();
  
  fill(209, 189, 164);
  ellipse(width/2, 70, 50, 50); //change xpos and ypos later in if statement or something so that it places them randomly
  
  fill(116, 93, 66, 90);
  ellipse(190, 65, 20, 25);
  
  fill(0);
  ellipse(190, 65, 5, 10);
  ellipse(210, 65, 5, 10);
  ellipse(width/2, 70, 10, 5);
  
  fill(216, 129, 135);
  arc(width/2, 75, 5, 20, radians(0), radians(180));
  
  fill(116, 93, 66);
  pushMatrix();
  translate(173, 63);
  rotate(radians(35));
  ellipse(0, 0, 10, 30);
  popMatrix();
  
  pushMatrix();
  
}











void drawNYC() { //this function draws NYC

  fill(0);
  rect(0, 300, width, 100); //bottom buildings

  rect(0, 180, 40, 200); // building furthest left

  rect(45, 120, 40, 250);
  rect(50, 90, 30, 40);
  rect(60, 75, 10, 40);
  rect(62.5, 65, 5, 40);

  rect(100, 130, 45, 200);
  rect(110, 100, 10, 40);

  rect(150, 250, 30, 50);
  rect(185, 265, 20, 50);

  rect(width/2, height/2, 70, 200); //building in the middle

  rect(150, 250, 30, 50);
  rect(185, 265, 20, 50);

  rect(280, 250, 50, 150);
  rect(285, 200, 40, 90);
  rect(290, 170, 30, 90);

  rect(340, 140, 40, 200);
  rect(385, 180, 40, 200); //building in the furthest right
  
  fill(255);
  rect(3, 250, 5, 10); //windows furthest left
  rect(3, 280, 5, 10);
  rect(20, 260, 5, 10);
  
  rect(50, 150, 5, 10);
  rect(60, 200, 5, 10);
  
  rect(110, 160, 5, 10);
  rect(130, 280, 5, 10);
  rect(130, 265, 5, 10);
  rect(120, 270, 5, 10);
  
  rect(155, 280, 5, 10);
  rect(160, 290, 5, 10);
  rect(170, 260, 5, 10);
  
  rect(210, 240, 5, 10);
  rect(250, 250, 5, 10);
  rect(230, 280, 5, 10);
  
  rect(290, 210, 5, 10);
  rect(300, 270, 5, 10);
  
  rect(350, 200, 5, 10);
  rect(365, 260, 5, 10);
  
  rect(390, 230, 5, 10); //window furthest right
  
}
