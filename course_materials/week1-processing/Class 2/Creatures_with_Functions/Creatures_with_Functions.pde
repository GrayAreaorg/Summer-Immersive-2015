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
  for (int i=0; i<heads.length; i++) {
     heads[i].display(); 
//     heads[i].move(); 
     heads[i].jiggle();
//     heads[i].bounce(); 
//     heads[i].bunnyHop(); 
  }
}

