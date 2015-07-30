var five = require("johnny-five"),
  board, potentiometer;

board = new five.Board();
strobe = 0;


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
    led.pulse(this.value/5);
  });
  
});