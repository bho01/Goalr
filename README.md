#Goalr

###Contributors 
* [Brendon Ho](https://github.com/brendonho01) - Creator/Mobile Section

* [Ivan Chau](https://github.com/ichauster) - Developer/Web Section


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



