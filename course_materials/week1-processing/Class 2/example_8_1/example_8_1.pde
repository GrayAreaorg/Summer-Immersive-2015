// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 8-1: A Car class and a Car object

Car myCar; // Declare car object as a globle variable.

void setup() {
  size(200,200);
  // Initialize Car object
  myCar = new Car(); // Initialize car object in setup() by calling constructor.
}

void draw() {
  background(255);
  // Operate Car object.
  myCar.move(); // Operate the car object in draw( ) by calling object methods using the dots syntax.
  myCar.display();
}


