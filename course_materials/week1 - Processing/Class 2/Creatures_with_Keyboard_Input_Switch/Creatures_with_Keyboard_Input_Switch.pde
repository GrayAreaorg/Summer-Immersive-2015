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

  switch (key) {
  case 'r':
  case 'R':
    drawScreenZero();
    break;
  case 'g':
  case 'G':
    drawScreenOne();
    break; 
  case 'b':
  case 'B':
    drawScreenTwo();
    break;     
  default:
    // None  
    break;
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

