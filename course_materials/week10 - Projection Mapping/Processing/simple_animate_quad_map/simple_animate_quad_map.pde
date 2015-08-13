import deadpixel.keystone.*;

float displayAnimationValue = 0; //this is what you use as your variable
float desiredAnimationValue; //set this value to animato TO

PGraphics texture;

Keystone ks;
CornerPinSurface quadMap;

void setup(){
  size(600,480, P3D); //set up a size for your window
  desiredAnimationValue = height; //set a default value for your animation end state
  
  rectMode(CORNERS);
  
  texture = createGraphics(400, 400, P2D);
  
  ks = new Keystone(this);
  
  quadMap = ks.createCornerPinSurface(400, 400, 20);
}

void draw(){
  background(0);
  
  //the smoothValue function will return a new "smoothed" value, so store it in your display value to draw the animation
  displayAnimationValue = smoothValue(displayAnimationValue, desiredAnimationValue, 20);
  
  //draw a rectangle where the height will animate based on the above line of code
  texture.beginDraw();
  texture.background(0);
  texture.fill(255,0,255);
  texture.rect(0, 0, width, displayAnimationValue);
  texture.endDraw();
  
  //image(texture, 0,0);
  quadMap.render(texture);
  
  //if the height of the rectangle reaches the full height of the sketch, set your desired animation value to 0 to loop
  if(displayAnimationValue >= height - 1){
    desiredAnimationValue = 0;  
  }
  //likewise, if the rectangle height reaches 0, then set the desired animation value to the height of your window to continue looping
  else if(displayAnimationValue <= 1){
    desiredAnimationValue = height;  
  }
  
  println("desired: " + desiredAnimationValue);
  println("displayed:" + displayAnimationValue);
}

//Abstract function for animating a value to another value
float smoothValue(float original, float desired, float interval){
  float diff = abs(original - desired) / interval;
  return original >= desired ? original - diff : original + diff;
}

void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load("mapping.xml");
    break;

  case 's':
    // saves the layout
    ks.save("mapping.xml");
    break;
  }
}
