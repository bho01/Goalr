var passport = require('passport');
var User = require('./models/user');

module.exports = function(app){
	console.log('in routes');
	app.get("/", function (req,res){
		console.log(req);
		if(!req.user){
			console.log('needs login');
			res.redirect('/login');
		}else{
			console.log('user in');
			res.render('index',{user : req.user});
	  	}
	});
	app.get('/register', function(req, res){
		res.render('register',{});
	})
	app.post('/register', function(req, res) {
      User.register(new User({ username : req.body.username, firstName : req.body.firstName, lastName : req.body.lastName, email : req.body.email }), req.body.password, function(err, account) {
          if (err) {
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
		console.log(req.user + 'good');
		res.redirect('/')
 	});
 	app.get('/logout', function(req, res) {
      req.logout();
      res.redirect('/');
  	});

}