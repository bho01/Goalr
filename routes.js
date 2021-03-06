var passport = require('passport');
var User = require('./models/user');

module.exports = function(app){
	console.log('in routes');
	app.get("/", function (req,res){
		if(!req.user){
			console.log('needs login');
			res.redirect('/login');
			/*User.findOneAndUpdate({username : 'ichauster'}, 
				{$set:{username:'iChauster'}},
				function (err, numberAffected, raw){
					res.render('index',{user : req.user});
				}); */
		}else{
			console.log('user in');
			User.find({username : req.user.username}).lean().exec(function (err, docs){
				if (err){
					console.log(err);
				}
				var js = JSON.stringify(docs);
				console.log(js);
				console.log('User-Agent: ' + req.headers['user-agent']);
				var userAgent = req.headers['user-agent'];
				if(userAgent.indexOf('Goalr') > -1 || userAgent.indexOf('iPhone') > -1){
					res.send(js);
				}else{
					res.render('index',{user : req.user, docs : js});
				}

			});
	  	}
	});
	app.get('/register', function(req, res){
		res.render('register',{});
	})
	app.post('/register', function(req, res) {
      User.register(new User({ username : req.body.username, firstName : req.body.firstName, lastName : req.body.lastName, email : req.body.email, goalName : [{goal : "coder", subgoals : [{goal : ['code once a day', false], date : Date()}], dateDue:Date()}]}), req.body.password, function(err, account) {
          if (err) {
          	console.log(err);
            return res.render("register", {info: "Sorry. That username already exists. Try again."});
          }
          passport.authenticate('local')(req, res, function () {
            res.redirect('/');
          });
      });

 	});
 	app.get('/login', function(req, res) {
      res.render('login', { user : req.user });
  	});
	app.post('/login', passport.authenticate('local'), function(req, res) {
		res.redirect('/')
 	});
 	app.get('/logout', function(req, res) {
      req.logout();  
      res.redirect('/');
  	});
  	app.get('/info', function(req,res){
  		res.render('info');
  	});
  	app.get('/managr', function(req,res){
  		res.render('managr');
  	});

}
