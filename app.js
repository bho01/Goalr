var assert = require('assert');
var express = require("express");
var path = require("path");
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
app.use(express.static('public'));
var mongoose = require('mongoose');
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.set('view options', { layout: false });
app.use(require('morgan')('combined'));
app.use(require('cookie-parser')());
app.use(require('body-parser').urlencoded({ extended: true }));
app.use(require('express-session')({ secret: 'keyboard cat', resave: true, saveUninitialized: true }));
app.use(passport.initialize());
app.use(passport.session());
var User = require('./models/user');
var Goal = require('./models/goal')
passport.use(new LocalStrategy(User.authenticate()));
passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());

mongoose.connect('mongodb://icu:madeonearth@ds057944.mongolab.com:57944/goalr');
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function (callback) {
	console.log('connection success');
});

require('./routes')(app);
io.on('connection', function(socket){
  console.log('a user connected');
  socket.on('goal saved', function(gl,usame){
  	console.log(gl);
  	User.findOneAndUpdate({username : usame}, 
				{$push:{goalName:{goal:gl}}},
				function (err, numberAffected, raw){
					if(err){
						console.log(err);
					}
					console.log(numberAffected);
				});
  });
});
/*var Goal = new Schema({
	goal : {goalr : String,
			subGoals : {goals : String, 
						complete : Boolean}},
	due : Date
});*/

http.listen(process.env.PORT || 3000, function(){
	var host = http.address().address;
 	var port = http.address().port;

  	console.log('Example app listening at http://%s:%s', host, port);
});
