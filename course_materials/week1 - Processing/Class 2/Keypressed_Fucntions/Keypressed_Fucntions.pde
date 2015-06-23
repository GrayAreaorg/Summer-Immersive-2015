int currentScreen;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
}

void draw() {
  if (keyPressed) {

    println(key);

    if (key == 'r' || key == 'R') {
      drawScreenZero();
    } else if (key == 'g' || key == 'G') {
      drawScreenOne();
    } else if (key == 'b' || key == 'B') {
      drawScreenTwo();
    } else {
      background(100, 100, 100);
    }
  }
}

void drawScreenZero() {
  background(255, 0, 0);
  fill(255);
  ellipse(100, 100, 400, 400);
}

void drawScreenOne() {
  background(0, 255, 0);
  fill(0);
  rect(250, 40, 250, 400);
}

void drawScreenTwo() {
  background(0, 0, 255);
  fill(255, 255, 0);
  triangle(150, 100, 150, 400, 450, 250);
}

