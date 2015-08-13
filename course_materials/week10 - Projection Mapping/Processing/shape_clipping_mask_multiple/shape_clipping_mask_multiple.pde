import quickhull3d.*;
import ComputationalGeometry.*;
import processing.video.*;

/***~***/
/***~***/


ClippingMask clip;
boolean calibrate = true;

int currShape = 0;
int numShapes = 3;

void setup(){
  size(800,600,P3D);
  clip = new ClippingMask(this, "clip.mp4", "clip1.json", numShapes);
  smooth();
  
  textSize(18);
}

void movieEvent(Movie m) {
  m.read();
}

void draw(){
  background(0);
  clip.drawClippingMask();
  
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
    ClippingMask currentClip = clip; //if you want to interact with another shape, change it here!
    
    boolean addNewPoint = true;
    for(int i=0;i<currentClip.controlPoints[currShape].size();i++){
      if(currentClip.controlPoints[currShape].get(i).mouseInside){
        addNewPoint = false;
        break;
      }
    }
    if(addNewPoint){
      currentClip.addPointToShape(currShape, mouseX, mouseY, random(0,1));
    }
  }
}

void mouseDragged(){
  if(calibrate){
    ClippingMask currentClip = clip; //if you want to interact with another shape, change it here!
    
    for(int i=0;i<currentClip.controlPoints[currShape].size();i++){
      if(currentClip.controlPoints[currShape].get(i).mouseInside){
        currentClip.controlPoints[currShape].get(i).updatePoint(currentClip, mouseX, mouseY, currShape);
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
  clip.saveData();
  //if you have more clips, add them here
  //ex:    clip2.saveData();
}

void loadCalibration(){
  clip.loadData();
  //if you have more clips, add them here
  //ex:    clip2.loadData();
}
