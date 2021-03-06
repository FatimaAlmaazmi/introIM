/*
Fatima Almaazmi. 6th October 2020.

dogsNYC is a program that generates random dog names and their frequency in NYC. It draws said number
of dogs and displays their name.

Click on the canvas a few times until a name and dogs appear on your screen.
Once you click again, a new name and dogs will appear.

Source of my data: https://www.kaggle.com/new-york-city/nyc-dog-name

Enjoy!
*/


//My universal variables
String dogs[];
String thisRow[]; 
String frequency;
String dogName;
Dog rando;
String name[];
String number;



void setup() {
 
  size(400, 400); 
  background(225, 241, 250); 
  drawNYC();


  rando = new Dog();  


  dogs = loadStrings("dogNames3.csv"); //loads the data into an array
  
}



void draw() {
}



void mouseClicked() {
 
  thisRow = split(dogs[int(random(dogs.length))], ',');       //picks a random row
  dogName = thisRow[0];                          //allocating name of random dog to a variable
  frequency = thisRow[1];                       //allocating frequency of name to a variable 

  rando.showText(dogName);                     //displays name of dog on the canvas

  for (int i=0; i< int(frequency); i++) {     //draws the number of dogs with said name
    rando.dogPattern();
  }
  
}



void mouseReleased() {    //when mouse is released it redraws the background

  background(225, 241, 250);   
  drawNYC();
  
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
