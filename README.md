# App-A-Day
Basically, my plan is to understand a new concept of mobile app development every day or refine my current
skills. I was inspired by https://jenniferdewalt.com/ who made a website a day for 180 days, I will attempt to make some sort of mobile app a day for 180 days

# Day One -- ScrollViews (iOS) [11th Jan. 2017]
So this was a relatively rough app, for sure need to manage my time better with these projects. The app consists of three hardcoded images that the user can horizontally scroll through. I've also added two smaller images on the bottom left and bottom right of the screen and attached TapGestureRecognizers to them so they programmatically scroll the images. 

In all, it wasn't too bad. The code could be cleaner and more modular, but there's plenty of internal documentation should a newbie happen across this project. 

# Day Two -- Sales of Cars (iOS) [12th Jan. 2017]
This time around the app was much more refined. I added a proper logo, dividers, buttons, etc. -- the whole nine yards. The app was still black and white though. As far as I'm concerned, having nice colours and animations is last in terms of priority. The controller and view layers of the app were pretty straight forward. The view layer was similar to what I had done in my [MiraclePill project](https://github.com/MinuraIddamalgoda/MiraclePill) but this time passed valued to the controller layer. The model layer was handled by Realm -- which is what this project is based on. Using Realm was pretty seamless, and only took me about 5 minutes to have it integrated into the project. 

The Sales of Cars project's time managment was better but not ideal. The code itself is cleaner and relatively modular with good documentation (humblebrag) but there's always room for improvement. For sure need to brush up on my skills with backend Swift work, it took way too long to create that Car class and properly instantiate in a way that works with Realm. 

NB: If you want to download this project, be sure to implement Realm's framework files locally, I will not be uploading them to my own GitHub hence they won't be in the project files you download. 

# Day Three -- Contacts (Android) [13th Jan. 2017]
Well, that didn't go as planned. My original idea was to create a contacts app that featured its own custom RecyclerView layout, with a mutable backend, fragment layouts, and a separate "add contact" section. My idea didn't account for the fact that the RecyclerView and Fragment portion of the app would take me _much_ longer than a day to work out. In the end, all I could accomplish in a day was a RecyclerView with a custom list layout + the contacts which are stored as a singleton. Learning how to implement my own RecyclerView was more difficult than I imagined, partially because I've spent so much time following tutorials. I didn't anticipate what I could actually accomplish in a day I already had prior commitments in. 

On a more positive note, I learned to implement my own thumbnails into app and how to properly store, access, and present those image assets so it's not all a loss. Plus I am now much more comfortable implementing my own RecyclerView. 10/10 would make same mistake again. 

# Day Four -- Calculator (iOS) [14th Jan. 2017] 
This app was much more about learning StackViews than anything. I intended to properly learn how to use a StackView in Day 2's Sales of Cars app but time forced me to ditch that idea in favour of constraints. As a result, the app isn't as polished on all device resolutions. However, this time around, I've implemented an entire hierarchy of StackViews in order to get the buttons to not only line up as I want, but to also maintain their dimensions and spacing. 

Also, almost forgot: _insert message about poor time management here_ 

# Day Five -- Jason The Recycler (Android) [15th Jan. 2017]
Continuing on from Day 3's RecyclerView binge, I present to you an app that downloads a JSON string and displays it in a RecyclerView: Jason The Recycler! 

###### Yes, I really am that clever

The app itself, as well as the code, is pretty basic and straight forward with good encapsulation and internal documentation. I found a site online that hosts sample JSON objects, so a big thank you to https://jsonplaceholder.typicode.com/! This was my first go at creating an app with networking functionality so it was a great learning experience. I opted for Volley as opposed to an AsyncTask due to ease of use amongst other reasons. 

# Day Six -- Jason The Recycler Part II (iOS) [16th Jan. 2017]
This app is more or less a copy of the previous day's app, hence "Round II". I did it mostly to draw parallels between Android and iOS development. The funcitonality is basic much like the first one, however the difference it mainly in the networking. For Android, I use Volley because it's _easier_, however, with iOS, I used SwiftyJSON _becuase I had to_. I found networking in iOS to be much more difficult and simply had to use SwiftyJSON or else I doubt I would have completed the project.

# Day Seven -- Non-Suburban Dictionary (Android) [17th Jan. 2017]
This was a slightly different take on networking and displaying data. Having found the wonders of AsyncTask (which I somehow did Day Five without), I feel much more confident in Android development. This time around, I implemented a single cardview to display the data which was slightly different to the RecyclerView I'm used to. I think my CardView implementation could've been done better and am keen to try again.

# Day Eight -- [18th Jan. 2017]

# Day Nine -- [19th Jan. 2017]

# Day Ten -- [20th Jan. 2017]

# Day Eleven -- [21st Jan. 2017]

# Day Twelve -- [22nd Jan. 2017]

# Day Thirteen -- [23rd Jan. 2017]
Credit for "Infinite Flame" logo goes to: 
<a href="http://www.freepik.com/free-vector/infinite-logo_798107.htm">Designed by Freepik</a>

# Day Fourteen -- [24th Jan. 2017]

# Day Fifteen -- [25th Jan. 2017]
