var mongoose = require('mongoose'),
	Schema = mongoose.Schema;

console.log('inside goal')
var Goal = new Schema({
	goal : String,
	subGoals : {goals : String, 
				complete : Boolean},
	due : Date
});

module.exports = mongoose.model('Goal', Goal);
