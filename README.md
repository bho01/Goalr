#Goalr

##Contributors 
* [Brendon Ho](https://github.com/brendonho01) - Creator/Mobile Section

* [Ivan Chau](https://github.com/ichauster) - Developer/Web Section

##To do list
* Finish Web and info page
* Redesign UI for web
* Finish iOS app
* Compile to Android
* Make the watch connection
* Make android wear edition as well

###Code Docs
Goalr is a web (and eventually mobile?) platform. It will soon come to iOS and Android.

NodeJS, Express and Socket.io power our backend.

Parse Push is used for dynamic notifications on mobile devices (iOS is our first deployment target).

Jade, CSS, jQuery, Bootstrap, and Material are used in our frontend to dynamically create pages for the user.

### iOS App (Goalr - iOS) by the web guy
So it's a pretty simple app. I'm making pushes to our heroku server, where we authenticate users and pull JSON data from the Mongo database. This is returned to the iOS app. 

I'm currently working on Push Notifications, which is powered by Parse. Each device is affiliated with an Installation Object ID Parse-side. We can connect this ID to Mongo, and using ParseNode, we can push notifications server-side to multiple devices (hopefully iOS and Android devices both). 

In addition, the iOS application is outfitted with SocketIO, which allows us to build a real-time connection with the server and stream information in split-second timing. We are using this so the server can adjust the Mongo database on an event-driven basis (adding, deleting, or editing goals).

Although the iOS authentication is very primitive (username/password), I've simplified the login process by securely saving the pair in the iOS keychain [this will take effect after the first successful sign in]. I am also looking forward to adding another layer of fingerprint protection if the user needs extra security. 

Other than this, I've kept the app to a similar format to the web application. I am working on completing the functionality (Adding subgoals/goals) and smoothing out some rough edges with the design.

### Watch App () by Brendon. 
We believe that watches and other wearables will be the future of technology. Goalr Watch will connect to your phone and it should send push notifications to your wrist.

Auth will be done on the phone. The watch will recognize that the person unlocked Goalr via phone and will automatically unlock.

The interface would be challenging since the screen size is extremely small. At the same time we want to incorporate at least most of the features that are in web and mobile. To solve that problem, we changed the UI completely to a page view controller. Each page will contain a circular progress bar of your goal. To get to another goal, you simply slide the screen left or right. To edit the goal, you simply tap on the goal. We also take advantage of the Force Touch capabilities of the Apple Watch. To delete or rename the goal, you simply press harder. It wil then give two options, delete goal and rename goal.

Brendon is currently developing this on XCode. This project is aimed to finish at around late February.

