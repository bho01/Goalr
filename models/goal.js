var mongoose = require('mongoose'),
	Schema = mongoose.Schema;

var Goal = new Schema({
	goal : {goalr : String,
			subGoals : {goals : String, 
						complete : Boolean}},
	due : Date
});

module.exports = mongoose.model('Goal', Goal);
