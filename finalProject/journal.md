## My Final Project

This is my final project journal :)

----

## Day 1 (25/NOV/2020)


For my final project, I want to make a game out of my dancing dog project.

The goal of the game is to get the dog to the disco, so that he can dance. 


**Processing:**

The background will resemble a disco floor. The start position will be at the bottom left, and the end at the top right. The player has to move the dog, while using keypads, to the right path. If the player chooses a wrong path, the game is lost, and they have to start over. 

Every right platform plays a single note from the dog's favorite song. 


**Arduino:**

Servo Motor will move the dog as it did previously. 

The buzzer will start playing the song, when the game is won. 

The buzzer will also play the single notes from the song when player moves on correct platform.

Green LED will light up when player moves on correct platform.

Red LED will light up when player moves on wrong platform.



Here are pictures of how it might look like:

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/CamScanner%2011-25-2020%2017.50_1.jpg)


My plan for next time: is to draw the dog so that I can use it on processing, and start with drawing the layout of different phases in the game on my processing code.


I hope it works :)

____

## Day 2 (30/NOV/2020)


I spent the day working on the images I will be using in my code. I also tried to test the moveDog(); function, which basically moves the dog with the keypads. However, its not going well. The problem is that I have only a two image sprite, and I do not know how to incorprate it into the code correctly. I found one way to do so, but once the dog moves it leaves a trail of itself behind. I'm not sure what I'm doing wrong, but I will figure it out inshallah.

Here are the images that I worked on today and will be using:

**The dog:**
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_0306.jpeg)
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_0307.jpeg)
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_0308.jpeg)
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_0309.jpeg)
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_0310.jpeg)

**The disco:**
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_0303.jpeg)

**The weird trail:**
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-11-30%20at%2011.34.31%20PM.png)


For tomorrow I am planning to work on the different states of the game. The start screen, game screen, winning screen, and losing screen. And hopefully when I get everything to work and look great, I will start incorperating the Arduino :)

_____

## Day 3 (1-2/DEC/2020)

Okay, I had a lot of stuff done and I feel very happy about it even though I stayed up till 5AM for it to work.

I worked on the different stages in the game and I am slightly proud with how they turned out. Also, the issue with the dog moving is fixed now! I'm not sure how but it works! 

As of now, I have everything ready. I just need to put in the if(); statements that will make the game work, and hopefully everything will run smoothly. I'm slightly concerned about the arduino part of the whole game. I really hope it works.

Here are the stages of the game:

**Start Screen:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-12-02%20at%203.28.34%20AM.png)


**Game Screen:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-12-02%20at%204.14.18%20AM.png)


**Winning Screen:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-12-02%20at%205.28.23%20AM.png)



**Losing Screen:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-12-02%20at%205.27.52%20AM.png)



I hope that by tomorrow I will have the game working smoothly on processing, and the only thing I would have to work on then would be the Arduino program :)

----

## Day 4 (3/DEC/2020)


I got the game to work! Everything runs smoothly. However, I did notice a logical error in my game, where the player could skip a few platforms and get to the disco faster. So I had to make it a bit harder. 


I rerouted the whole pathway to the disco, so that at every platform there would be 2 wrong platforms and only 1 right. That way, they wont get to easily get to the finish line. (thats so mean of me but I had to do it)

**Picture of new plan:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/CamScanner%2012-06-2020%2023.30_1.jpg)


After that, I worked on getting the arduino linked with processing. It was easier than I expected, although I ran into some difficulties. 


My myPort.write(); did not work in the void SerialEvent() for some reason. It only worked when I put them in void draw(). But, I guess as long as it works, I won't complain.

The only issue I am facing as of now, is trying to make the buzzer play a note only once, when the player is at a certain platform. The buzzer plays the sound continuously. Even if I change the duration of the note on arduino. I'm not sure how I'll get that to work. I might have to ask the professor for help :)


I have also planned how to make the physical aspect of this project more fun. I want to make an actual mini disco where the dog can dance. 


**Disco:**


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/CamScanner%2012-06-2020%2023.28_1.jpg)




So, for next time I really hope I have time to work on my project. With so many essays due on the same day I feel that I won't have as much time. But, I'll hope for the best :)


---

## Day 5 (7-8/DEC/2020)


I worked a lot today! I finally had time to work on this before class, I was really worried I wouldnt. Anyways, I have the whole project working fine, but I had to let go of a few details.

I still had the issue with the buzzer playing the notes continously, and I forgot to ask the professor about it. And, while running the program and the game, I came to realize how insignificant it is, and how annoying it is. I personally do not like games with sounds, especially if they are excessive. Which is why, I let go of that idea.

However, if I get the chance, I will ask the professor about this.

I also spent the weekend looking for a mini disco ball. I was so scared I wouldnt find one, but to my luck I did! And its all thanks to Christmas! If it werent Christmas, I wouldnt have gotten this christmas decoration that looks exactly like a disco ball lol.


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_8241.jpg)


On another positive note though, I have the disco ready! It looks okay I guess lol. I just need to set the atmosphere when filming the video of the whole thing working, and inshallah it will look amazing.

Here are photos of how I made the disco and how it looks like:


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_8235.jpg)

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_8236.jpg)

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_8237.jpg)

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_8238.jpg)

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_8242.jpg)

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_8249.jpg)



I hope everything goes well when I finally film this :)

---

## Day 6 (10/DEC/2020)


I finally filmed my project working!

I am so happy, it looks decent. 

Here is the [link](https://drive.google.com/drive/folders/1th1EklFEgM1-sBnKOVEVQhBKCu3vlsMP?usp=sharing) to the google drive with two vidoes (losing and winning the game).


Thank you :)



