### Assignment 4

## dogsNYC


This has been equally the hardest and most rewarding code I have ever worked with. Although what I was going after was so simple and could be easily written in a day, I spent so much time trying to figure out how I was going to make it work.

My program uses a csv file of dog names in NYC, and how many dogs there are with said name. It displays a random name and its frequency of a dog once you click on the canvas. Names are displayed at texts, while the number of dogs are displayed by a function that draws dogs.

---

I wasn't really sure how the split function works exactly, so the main problem that I faced was trying to understand how to access each individual information and ask processing to choose one randomly.


The simple line of code that does that is this: thisRow = split(dogs[int(random(dogs.length))], ','); 
Which now I understand that it chooses a random index for the array that stores the name and frequency of dogs and splits them into two columns. 
So, thisRow[0] will hold all of the names of dogs. And, thisRow[1] will hold the number of dogs.

After Professor Michael suggested I use this line of code, everything else worked out smoothly. 

---

Another error I guess I am still facing with this code, is that it sometimes skips a few names and generates a blank canvas. I am not sure hwy this happens, but I am guessing that there might be a few spaces in the csv file that are read by processing as information. 
I will look into this and see what happens.


---


I am so happy for completing this code, and watching it finally work was the most relieving and happiest moment I have felt this week. :)


