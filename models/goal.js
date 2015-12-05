var mongoose = require('mongoose'),
	Schema = mongoose.Schema;

var Goal = new Schema({
	goal : {goalName : String,
			subGoals : {goalName : String, 
						complete : Boolean}},
	due : Date
});

module.exports = mongoose.model('Goal', Goal);
