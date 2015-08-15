import quickhull3d.*;
import ComputationalGeometry.*;
import processing.video.*;

/***~***/
/***~***/

int currMedia = 0;
int[] numShapes = { 3, 4 }; //the number of shapes PER media file
String[] medaiFiles = { "clip.mp4", "transit.mov" }; //the media file names
int numMedia = numShapes.length;


ClippingMask[] clip = new ClippingMask[numMedia];
boolean calibrate = true;

void setup(){
  size(800,600,P3D);
  for(int i=0; i<numMedia; i++){
    clip[i] = new ClippingMask(this, medaiFiles[i], "clip"+i+".json", i, numShapes[i]);
  }
  smooth();
  
  textSize(18);
}

void movieEvent(Movie m) {
  m.read();
}

void draw(){
  background(0);
  for(int i=0;i<clip.length;i++){
    clip[i].drawClippingMask();
  }
  
  if(calibrate){
    fill(255);
    text("currentMedia = " + currMedia + ", currentShape = " + clip[currMedia].currShape, 20, 30);
  }
  else{
    noFill();  
  }
}

void mousePressed(){
  if(calibrate){
    ClippingMask currentClip = clip[currMedia]; //if you want to interact with another shape, change it here!
    
    boolean addNewPoint = true;
    for(int i=0;i<currentClip.controlPoints[currentClip.currShape].size();i++){
      if(currentClip.controlPoints[currentClip.currShape].get(i).mouseInside){
        addNewPoint = false;
        break;
      }
    }
    if(addNewPoint){
      currentClip.addPointToShape(-1, mouseX, mouseY, random(0,1));
    }
  }
}

void mouseDragged(){
  if(calibrate){
    ClippingMask currentClip = clip[currMedia]; //if you want to interact with another shape, change it here!
    
    for(int i=0;i<currentClip.controlPoints[currentClip.currShape].size();i++){
      if(currentClip.controlPoints[currentClip.currShape].get(i).mouseInside){
        currentClip.controlPoints[currentClip.currShape].get(i).updatePoint(currentClip, mouseX, mouseY);
      }
    }
  }
}

void keyPressed(){
  if(key == 'c'){
    calibrate = !calibrate;  
  }
  else if(key == 's'){
    saveCalibration();
  }
  else if(key == 'l'){
    loadCalibration();
  }
  else if(keyCode == UP){
    currMedia++;
  
    if(currMedia >= numMedia){
      currMedia--;
    }
    else if(currMedia < 0){
      currMedia = 0;  
    }
  }
  else if(keyCode == DOWN){
    currMedia--;
    
    if(currMedia >= numMedia){
      currMedia--;
    }
    else if(currMedia < 0){
      currMedia = 0;  
    } 
  }
  else if(keyCode == LEFT){
    clip[currMedia].updateCurrShape(-1);
  }
  else if(keyCode == RIGHT){
    clip[currMedia].updateCurrShape(1);
  }
}

void saveCalibration(){
  for(int i=0;i<clip.length;i++){
    clip[i].saveData();
  }
}

void loadCalibration(){
  for(int i=0;i<clip.length;i++){
    clip[i].loadData();
  }
}
