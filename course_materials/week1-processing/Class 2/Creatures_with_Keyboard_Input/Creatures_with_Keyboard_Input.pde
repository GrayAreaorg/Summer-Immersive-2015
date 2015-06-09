Head heads [] = new Head[50];
PImage img;
float gravity = 0.05;

void setup() {
  size(400, 400); 
  img = loadImage("creature.png");
  for (int i=0; i<heads.length; i++) {
    heads[i] = new Head();
  }
}

void draw() {
  background(255); 
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      drawScreenZero();
    } else if (key == 'g' || key == 'G') {
      drawScreenOne();
    } else if (key == 'b' || key == 'B') {
      drawScreenTwo();
    } else {
      // empty
    }
  }
}
void drawScreenZero() {
  for (int i=0; i<heads.length; i++) {
    heads[i].display(); 
    heads[i].move();
  }
}

void drawScreenOne() {
  for (int i=0; i<heads.length; i++) {
    heads[i].display(); 
    heads[i].jiggle();
  }
}

void drawScreenTwo() {
  for (int i=0; i<heads.length; i++) {
    heads[i].display(); 
    heads[i].bunnyHop();
  }
}

