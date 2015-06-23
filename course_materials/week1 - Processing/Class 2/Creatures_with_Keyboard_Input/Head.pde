class Head { 
  float x, y, w;
  float xspeed, yspeed;

  Head() {    // Constructor
    x = int(random(width));
    y = int(random(height));

    // added for movement
    xspeed = int(random(1, 5));
    yspeed = int(random(1, 5));
    w = random(20, 100);
  }

  void display() {
    image(img, x, y, w, w);
  }

  void jiggle() {
    x = x + random(-1, 1);
    y = y + random(-1, 1);
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  void move() { // From Learning Processing example 8-1.
    x = x + xspeed;
    if (x > width) {
      x = -img.width;
    }
  }

  void bounce() { // From Learning Processing example 10-2.
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }

  void bunnyHop() {       
    x = x + xspeed;  
    y = y + yspeed;   
    yspeed = yspeed + gravity;  
    if (y > height) {  
      yspeed = yspeed * -0.99;
    }
    if (x > width) {
      xspeed = xspeed * -1;
    }
    if (x < 0) {
      xspeed = xspeed * -1;
    }
  }
}

