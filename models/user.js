var mongoose = require('mongoose'),
	Schema = mongoose.Schema,
	passportLocalMongoose = require('passport-local-mongoose');

var Goal = require('./goal');
var User = new Schema({
	username : String,
	firstName : String,
	lastName : String,
	password: String,
	email : String,
	goalName : [Goal]
});


User.plugin(passportLocalMongoose);

module.exports = mongoose.model('User', User);
