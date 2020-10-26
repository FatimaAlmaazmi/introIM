## My Midterm Project


My game is based on my previous assignment with the duck. This duck gets mad when you click on its face, and so in this game the player has to take the duck back home while avoiding any annoying clicks on the way.

The game starts with this screen, and the player has to click on the start button to start playing:


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-19%20at%207.01.04%20PM.png)


After that, the game starts and the player has to move the duck with the arrow keys across the screen and to its home:


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-26%20at%204.19.33%20PM.png)


If the player walks over one of the clicks, the game is lost and this screen appears which prompts the player to play again by clicking anywhere on the screen. Not to mention, the duck quacks angrily when the game is lost:


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-25%20at%2010.46.06%20PM.png)


If the player takes the duck home safely, the game is won and this screen appears which also prompts the player to play again by clicking anywhere on the screen:


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-25%20at%2010.46.30%20PM.png)


----

The process of making this game was both fun and challenging. I really liked playing with the concept of this game and making the duck move across the screen (even though its not moving the way I first intended it to move). The major problems or issues that I faced while making this game were only major in my eyes unfortunately. The solutions to these 'major problems' were really simple and I'm ashamed of myself for not figuring them out sooner.


My first problem, was restarting the game. This was solved by creating a simple function that assigns the state of the game to that of the beginning. What I did before was just assign the state of the game in an if statement in no function.


My second problem, was getting blurry images. This happened because I was constantly resizing the same image and after every resize it loses its quality. What I should have done in the beginning is instead of calling the resize(); function on every image is just resizing it with the display function image();.


So, after I got these sorted out, my game worked perfectly. And, although I wanted to add more to it like an easter egg and extra levels, I'm happy with what I have accomplished. I hope that I will get to add these in the near future inshallah.


Thank you! :)
