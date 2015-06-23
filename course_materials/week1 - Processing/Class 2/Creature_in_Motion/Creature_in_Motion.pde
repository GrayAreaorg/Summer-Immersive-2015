PImage img; // A variable for the image file
float x, y;   // Variables for image location
float rot;   // A variable for image rotation

void setup() {
  size(600, 600);
  img = loadImage("creature.png");

  x = 0.0;
  y = width/2.0;
  rot = 0.0;
}

void draw() {
  background(255);
  noCursor();
  imageMode(CENTER);
  //  image(img, mouseX, mouseY);
  // Translate and rotate
  translate(x, y);
  rotate(rot);

  // Images can be animated just like regular shapes using variables, translate(), rotate(), and so on.
  image(img, 0, 0); 

  // Adjust variables for animation
  x += 1.0;
  rot += 0.02;
  if (x > width+img.width) {
    x = -img.width;
  }
}


