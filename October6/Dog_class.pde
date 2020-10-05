class Dog {

  float cols;
  float rows;
  float spacing;
  

  void drawDog(float x, float y) {

    noStroke();
    
    translate(x, y);
    fill(209, 189, 164);
    ellipse(0, 0, 50, 50); 

    fill(116, 93, 66, 90); //draws spot around eye
    ellipse(-10, -5, 20, 25);

    fill(0); //draws eyes and nose
    ellipse(-10, -5, 5, 10);
    ellipse(10, -5, 5, 10);
    ellipse(0, 0, 10, 5);

    fill(216, 129, 135); //draws tongue
    arc(0, 5, 5, 20, radians(0), radians(180));
    
    fill(116, 93, 66);

    pushMatrix(); // draws left ear
    translate(-27, -7);
    rotate(radians(35));
    ellipse(0, 0, 10, 30);
    popMatrix();

    pushMatrix(); //draws right ear
    translate(27, -7);
    rotate(radians(-35));
    ellipse(0, 0, 10, 30);
    popMatrix();
  }

void dogPattern(){
  
      pushMatrix();
      rando.drawDog(random(0, width), random(0, 250));
      popMatrix();

}


void showText(String name){
  
  PFont f = createFont ("Charter-Bold", 32);
  textFont(f, 32);
  
  fill(255);
  textAlign(CENTER);
  text(name, 200, 350);
 
}
}
