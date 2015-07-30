var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var five = require("johnny-five");
var boardOne = new five.Board();

app.get('/', function(req, res) {
    res.sendFile(__dirname + '/index.html');
});

boardOne.on("ready", function() {
    var led = new five.Led(9);
    var servo = new five.Servo(6);

    io.on('connection', function(socket) {
        socket.on('message', function(msg) {
            io.emit('message', msg);
            console.log(msg + " recieved");
            if (msg == '10') {
                led.blink(msg);
            } else if (msg == '100') {
                console.log(msg + " recieved");
                led.blink(msg);
            } else if (msg == '500') {
                console.log(msg + " recieved");
                led.blink(msg);
            }

        });

    });
});

http.listen(3000, function() {
    console.log('listening on *:3000');
});
