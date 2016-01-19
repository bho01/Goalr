# Goalr

  Our main goal is to help people pursue their dreams and complete their short and long term goals. To do that we must reach out to every single device, and on any other screen size. That includes computers, phones, tablets, smartwatches and other wearables. We believe this app will help people to move forward and achieve their goal, whether it's to get an A on a test or to make it in the olympics.
  You can check it out on http://goalr.herokuapp.com/
  and you can learn more at http://goalr.herokuapp.com/info/

## Contributors 
* [Brendon Ho](https://github.com/brendonho01) - Creator/Mobile Section

* [Ivan Chau](https://github.com/ichauster) - Developer/Web Section

## To do list
* Finish Web and info page
* Redesign UI for web
* Finish iOS app
* Compile to Android
* Make the watch connection
* Make android wear edition as well

### Code Docs
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

### Watch App (Goalr Watch) by Brendon. 
We believe that watches and other wearables will be the future of technology. Goalr Watch will connect to your phone and it should send push notifications to your wrist.

Auth will be done on the phone. The watch will recognize that the person unlocked Goalr via phone and will automatically unlock.

The interface would be challenging since the screen size is extremely small. At the same time we want to incorporate at least most of the features that are in web and mobile. To solve that problem, we changed the UI completely to a page view controller. Each page will contain a circular progress bar of your goal. To get to another goal, you simply slide the screen left or right. To edit the goal, you simply tap on the goal. We also take advantage of the Force Touch capabilities of the Apple Watch. To delete, add, or rename the goal, you simply press harder. It wil then give two options, delete goal,add goal, and rename goal.

Brendon is currently developing this on Xcode. Bezel is used to simulate the Apple Watch. This project is aimed to finish at around late February. We hope to finish this ASAP. The test is on the Watch Test Folder. This this folder, we experiment and tinker around. In the actual app, we will put the final details and designs.

![alt tag](https://github.com/ClevererMango27/Goalr/blob/master/goalrpic.png)

### Android App (Goalr Android) by Brendon
Essentially, we will compile the iOS source code from Goalr-iOS into Java using Silver, a Swift to Java Compiler. Parse push notifications and MongoDB servers and auth will remain the same. However, the design will be set to the Android Marshmellow standard Material Design. Material provides a beautiful interface with a clean design and excellent mechanics. Once the iOS app is finished, we will compile and redesign and release. 

Also, we hope to release this on the Android Wear and the Samsung Gear watches as well.

### Managr by Goalr (Managr) by Brendon
This is an app that will be made for iOS and Android. It is targeted towards those who have trouble managing their time. You can read more about it at: http://goalr.herokuapp.com/managr/
![alt tag](https://github.com/ClevererMango27/Goalr/blob/master/MANAGR.jpg)

