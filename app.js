var assert = require('assert');
var express = require("express");
var path = require("path");
var app = express();
app.use(express.static('public'));
var url = 'mongodb://localhost:27017/test';
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/test');
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function (callback) {
	console.log('connection success');
});
app.get("/", function (req,res){
  res.sendFile("index.html");
});

var server = app.listen( process.env.PORT||3000, function() {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
