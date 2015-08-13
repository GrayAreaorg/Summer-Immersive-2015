class ControlPoint{
  
  PVector point;
  float size = 12;
  boolean mouseInside = false;
  
  ControlPoint(PVector p){
    point = p;
  }
  
  void drawControlPoint(){
    
    mouseInside = checkMouse();
    
    if(calibrate){
      stroke(255,0,0);
      strokeWeight(2);
      if(mouseInside){
        fill(255,0,0,175);
      }
      else{
        noFill();
      }
      
      ellipse(point.x, point.y, size, size);
    }
  }
  
  void updatePoint(ClippingMask parent, float x, float y){
    point.x = x;
    point.y = y;
  
    parent.updateShape();
  }
  
  boolean checkMouse(){
    return mouseX >= point.x - size/2 && mouseX <= point.x + size/2 && mouseY >= point.y - size/2 && mouseY <= point.y + size/2;
  }
}
