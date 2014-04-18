var express = require('express');
var methodOverride = require('method-override');
var bodyParser = require('body-parser');
var errorHandler = require('errorhandler');

var app = express();

app.use(methodOverride());
app.use(bodyParser());
app.use(express.static(__dirname));
app.use(errorHandler({
    dumpExceptions: true,
    showStack: true
}));

app.get('/', function (req, res) {
    res.redirect('/src/index.html');
});

app.listen(3000); //, '192.168.0.187'