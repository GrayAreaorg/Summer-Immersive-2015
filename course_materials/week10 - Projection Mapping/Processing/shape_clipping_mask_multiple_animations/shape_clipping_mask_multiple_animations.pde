import quickhull3d.*;
import ComputationalGeometry.*;
import processing.video.*;

/***~***/
/***~***/

int currShape = 0;
int numShapes = 2;

ClippingMask[] clip = new ClippingMask[numShapes];
boolean calibrate = true;

void setup(){
  size(800,600,P3D);
  clip[0] = new ClippingMask(this, "clip.mp4", "clip0.json", 0);
  clip[1] = new ClippingMask(this, "transit.mov", "clip1.json", 1);
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
    text("currentShape = " + currShape, 20, 30);
  }
  else{
    noFill();  
  }
}

void mousePressed(){
  if(calibrate){
    ClippingMask currentClip = clip[currShape]; //if you want to interact with another shape, change it here!
    
    boolean addNewPoint = true;
    for(int i=0;i<currentClip.controlPoints.size();i++){
      if(currentClip.controlPoints.get(i).mouseInside){
        addNewPoint = false;
        break;
      }
    }
    if(addNewPoint){
      currentClip.addPointToShape(mouseX, mouseY, random(0,1));
    }
  }
}

void mouseDragged(){
  if(calibrate){
    ClippingMask currentClip = clip[currShape]; //if you want to interact with another shape, change it here!
    
    for(int i=0;i<currentClip.controlPoints.size();i++){
      if(currentClip.controlPoints.get(i).mouseInside){
        currentClip.controlPoints.get(i).updatePoint(currentClip, mouseX, mouseY);
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
    currShape++;
  
    if(currShape >= numShapes){
      currShape--;
    }
    else if(currShape < 0){
      currShape = 0;  
    }
  }
  else if(keyCode == DOWN){
    currShape--;
    
    if(currShape >= numShapes){
      currShape--;
    }
    else if(currShape < 0){
      currShape = 0;  
    } 
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
