var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	res.render('index', { title: "Chirp"});
	//res.send('hellox1')
	
});

module.exports = router;