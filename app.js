var assert = require('assert');
var express = require("express");
var path = require("path");
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy
var app = express();
app.use(express.static('public'));
var url = 'mongodb://localhost:27017/test';
var mongoose = require('mongoose');
app.set('views', __dirname + '/views');
app.use(require('morgan')('combined'));
app.use(require('cookie-parser')());
app.use(require('body-parser').urlencoded({ extended: true }));
app.use(require('express-session')({ secret: 'keyboard cat', resave: true, saveUninitialized: true }));

var User = require('./models/user');
passport.use(new LocalStrategy(User.authenticate()));
passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());

mongoose.connect('mongodb://localhost/test');
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function (callback) {
	console.log('connection success');
});

require('./routes')(app);

var server = app.listen( process.env.PORT||3000, function() {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
