var mongoose = require('mongoose'),
	Schema = mongoose.Schema,
	passportLocalMongoose = require('passport-local-mongoose');

var User = new Schema({
	username : String,
	firstName : String,
	lastName : String,
	password: String,
	email : String
});

User.plugin(passportLocalMongoose);

module.exports = mongoose.model('User', User);
