# App-A-Day
Basically, my plan is to understand a new concept of mobile app development every day or refine my current
skills. I was inspired by https://jenniferdewalt.com/ who made a website a day for 180 days, I will attempt to make some sort of mobile app a day for 180 days

# Day One -- ScrollViews (iOS)
So this was a relatively rough app, for sure need to manage my time better with these projects. The app consists of three hardcoded images that the user can horizontally scroll through. I've also added two smaller images on the bottom left and bottom right of the screen and attached TapGestureRecognizers to them so they programmatically scroll the images. 

In all, it wasn't too bad. The code could be cleaner and more modular, but there's plenty of internal documentation should a newbie happen across this project. 

# Day Two -- Sales of Cars (iOS)
This time around the app was much more refined. I added a proper logo, dividers, buttons, etc. -- the whole nine yards. The app was still black and white though. As far as I'm concerned, having nice colours and animations is last in terms of priority. The controller and view layers of the app were pretty straight forward. The view layer was similar to what I had done in my [MiraclePill project](https://github.com/MinuraIddamalgoda/MiraclePill) but this time passed valued to the controller layer. The model layer was handled by Realm -- which is what this project is based on. Using Realm was pretty seamless, and only took me about 5 minutes to have it integrated into the project. 

This time around though time managment was better but not ideal. The code itself is cleaner and relatively modular with good documentation (humblebrag) but there's always room for improvement. For sure need to brush up on my skills with backend Swift work, it took way too long to create that Car class and properly instantiate in a way that works with Realm. 
