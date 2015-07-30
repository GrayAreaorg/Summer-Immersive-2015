var five = require("johnny-five");
var board = new five.Board();

board.on("ready", function() {
  // Create an Led on pin 13
  var led = new five.Led(9);
  // Blink every half second
  led.blink(500); 
});