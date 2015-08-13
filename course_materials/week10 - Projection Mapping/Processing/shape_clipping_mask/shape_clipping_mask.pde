import quickhull3d.*;
import ComputationalGeometry.*;
import processing.video.*;

/***~***/
/***~***/


ClippingMask clip;
boolean calibrate = true;

void setup(){
  size(800,600,P3D);
  clip = new ClippingMask(this, "clip.mp4", "clip1.json");
  smooth();
}

void movieEvent(Movie m) {
  m.read();
}

void draw(){
  background(0);
  clip.drawClippingMask();
}

void mousePressed(){
  if(calibrate){
    ClippingMask currentClip = clip; //if you want to interact with another shape, change it here!
    
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
    ClippingMask currentClip = clip; //if you want to interact with another shape, change it here!
    
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
