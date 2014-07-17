var http = require('http');
//var php = require("node-php"); 
var path = require("path"); 
var port = 8080;; 

/*var server = http.createServer();
server.listen(port);*/
 

var server = http.createServer();
 server.listen(port);
console.log("server listening!");
