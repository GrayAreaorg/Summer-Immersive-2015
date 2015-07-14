var http = require('http');
var express = require('express');
var app = express();
// var SerialPort = require("serialport").SerialPort;
var serialport = require("serialport"),	// include the serialport library
SerialPort  = serialport.SerialPort;	// make a local instance of it
var server = http.createServer(app).listen(3000);
var io = require('socket.io').listen(server);

app.use(express.static(__dirname + '/public'));

var serialport = new SerialPort("/dev/tty.usbmodem1411", {
	baudRate: 9600,
	// look for return and newline at the end of each data packet:
	parser: serialport.parsers.readline("\r\n")
});


serialport.on('open', function(){
	// Now server is connected to Arduino
	console.log('Serial Port Opend');

	var lastValue;
	io.sockets.on('connection', function (socket) {
		//Connecting to client
		console.log('Socket connected');
		socket.emit('connected');
		var lastValue;

		serialport.on('data', function(data){
			var angle = data[0] * 10;
			if(lastValue !== angle){
				socket.emit('data', angle);
			}
			lastValue = angle;
		});
	});
});
