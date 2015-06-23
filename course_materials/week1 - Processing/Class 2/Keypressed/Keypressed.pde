void setup() {
  size(500, 500);
  noStroke();
  smooth();
}

void draw() {
  if (keyPressed) {

    println(key); // to help us debug

    if (key == 'r' || key == 'R') {
      background(255, 0, 0);
    } else if (key == 'g' || key == 'G') {
      background(0, 255, 0);
    } else if (key == 'b' || key == 'B') {
      background(0, 0, 255);
    } else {
      background(100, 100, 100);
    }
  }
}

