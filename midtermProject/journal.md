## My midterm Project

This is my midterm project journal :)

---

### DAY1 (17/Oct/2020)


For my midterm project I am planning on making a game based on the duck from my previous assignment. The game would be about the duck and its journey home to the pond. You will control the duck and take it home, while avoiding annoying clicks along the way.


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/IMG_0281.PNG)


For today, I am planning to draw some of the images that I will be using for my game.


**1) my own small array of images of the duck walking left and right:**



**right:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/right%200.png)
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/right%201.png)



**left:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/left%200.png)
![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/left%201.png)



**2) annoying clicks:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/aclick.png)


**3) home or pond:**

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/home.png)



I convereted all of the images to png with no backgrounds, so that it would be easier to work with them.

----


### DAY2 (18/Oct/2020)


What I'm planning to do:

- Start with the program.
- At least make the duck move around the screen.
- Figure out how to put an opening screen and an ending screen.

Although I planned to work on it, I didnt get to because of other assignments :'(


----

### DAY3 (19/Oct/2020)


Today I started with the program. 

I figured out a way to have an opening screen, by making a function that displays it. It took me a while to place everything in its place, but I got there eventually (however, I'm still unstatisfied with how it looks I might make a few changes here and there after).

Here is what it looks like:


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-19%20at%207.01.04%20PM.png)


I also started experimenting with displaying the game itself. And here is where I encountered a minor problem. 
I have planned to have the annoying clicks to be placed randomly everytime you restart the game or lose. However, the random fucntion is not giving me the type of randomness that I want. I tried using perlin noise, (I havent used it before) but I gave up on it halfway cause it took a lot of my time.


So, after thinking it through. I might have the annoying clicks be in set places rather than random. Because it is too much of a hassle to deal with now, and I feel like this might help me later because I want to essentially map their locations so that when the duck touches them the lose screen will show. (I'm still not sure how I'm going to achieve that but inshallah I'll figure it out).

Here is a screenshot of the game and the clicks:


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-19%20at%207.01.13%20PM.png)



I also tried to expiremnet with moving the duck. It turned out to be a little tricky. I tried to follow Professor Aaron's stripe program to figure out where to start. However, I dont know how to make the duck appear in a specific location. And, I dont know how to tell processing to go through my small array of images repeatedly when pressing a key. So the duck does not appear on screen and then when I press a key it shows one image moving. 

So, hopefully I will get to figure this out soon :)


-----

## DAY4 (20/Oct/2020)

I decided to allocate the click in specific locations, so today I did that only.
Massive headache made it harder for me to work more :(

-----

## DAY5 (21/Oct/2020)

Headache continues for some reason, and the screen is not making it better.

However, I used Professor Aaron's method for sprites to move my duck. I ran into some issues, where I had first loaded the images in a 2 seperate 1d arrays. This did not work, so I had to put the images together like actual sprite sheets.

Here is the spritesheet that I made:

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-22%20at%203.06.23%20PM.png)

Then, it still didnt work for some reason, and I had to play around a lot with the code to get it right. Still not there yet.
Also, the annoying clicks keep getting blurred for some reason I dont know whats going on. 

![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-23%20at%207.31.39%20PM.png)

I tried using a noLoop(); function to stop them from doing so, but that stopped the duck from moving as well which is problamatic, and I dont know how to fix this.


----

## DAY6 (22/Oct/2020)

no more headaches! yay!


I finally decided to ask the Professor for help with this.

I fixed my global variables so that I can have access to the duck's location on screen and to check it afterwards if it made contact with the winning area or the losing areas. 

I still did not find a solution for the blurred clicks.

A lot has changed in my code, moving functions back and forth between the class and the code itself.

Today, I messed a lot with my code and it looks like a disaster.

-----

## DAY7 (23/Oct/2020)

I'm desperate to complete this code, so that I can at least work on my other assignments :'(

The Professor suggested that I make a global variable called "state" that tracks the winning and losing stages of the game. This made my whole life easier. I fixed the code, with the state variable, and everything works smoothly except....

My clicks are still blurry.

And, I can't restart the game for some reason. I'm still looking into it.

However, I did get to finally make the winning and losing screen. They are fairly simple, but now I'm focusing more on making this game work than the way it looks :(

I also added a quack sound that plays when the game is lost :)


Here are the winning and losing screens:


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-23%20at%207.44.34%20PM.png)


![](https://github.com/FatimaAlmaazmi/introIM/blob/master/pics/Screen%20Shot%202020-10-23%20at%207.43.50%20PM.png)

-----
## DAY8 (24/Oct/2020)


Okay, so there are many things that I am unhappy with about this game, but I really hope it works and people enjoy playing it.

The way the duck moves grew on me somehow, and it looks really cute with its weird way of walking. So, I decided to keep it as it is. (I hope I won't regret this later).

Upon talking with the Professor, I realized that my code is in shambles. So, I spent the day trying to fix some of the mistakes the Professor told me about.

I was so mad at my code, I decided to leave it be for the time being and work on it tomorrow :(

---

## DAY9 (25/Oct/2020)


Finally things are turning around. After spending some time away from my code, and trying to think of ways to fix it. I thought "We haven't been asking google for help, lets try asking more", and I came across a Processing forum that solved the same probelm I am facing with my code, which is trying to restarting it.

My game FINALLY restarts!

But... the clicks are still blurry so I need to work on that. Its baffling me since, almost any image I use instead of the clicks work fine, but once I use the clicks they get blurred.
I tried converting the image to jpg. Re-uploading the image to my computer. Deleting and re-uploading. Its no use. I don't know what else to do. :(

So, my plan for today is to try to figure this out. If I can't then I'll work on fixing the aesthetics of the game, i'll make the losing and winning screen better inshallah.

TBC.


