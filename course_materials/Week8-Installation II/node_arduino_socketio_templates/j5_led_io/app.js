
var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

var five = require("johnny-five"),
  board, potentiometer;

board = new five.Board();

app.get('/', function(req, res) {
    res.sendFile(__dirname + '/index.html');
});



board.on("ready", function() {

  var led = new five.Led(9);
  // Create a new `potentiometer` hardware instance.
  potentiometer = new five.Sensor({
    pin: "A0",
    freq: 25
  });

  // Inject the `sensor` hardware into
  // the Repl instance's context;
  // allows direct command line access
  board.repl.inject({
    pot: potentiometer
  });

  // "data" get the current reading from the potentiometer
  potentiometer.on("data", function() {
    console.log(this.value);
    led.pulse(this.value/9);
    io.sockets.emit('data', {val: this.value});
  });
});

http.listen(3000, function() {
    console.log('listening on *:3000');
});
 