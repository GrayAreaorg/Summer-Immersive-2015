class ClippingMask{
  
  PShape[] clippingShape;
  
  int currShape = 0;
  
  int id;
  
  PGraphics clippingMask;
  PGraphics frame;
  
  ArrayList<ControlPoint>[] controlPoints;
  
  IsoWrap iso;
  QuickHull3D hull;
  
  Movie movie;
  
  String dataFilename;
  
  ClippingMask( PApplet sketch, String mov, String d, int myID, int num){
    movie = new Movie(sketch, mov);    
    movie.loop();
    
    dataFilename = d;
    
    id = myID;
    
    clippingShape = new PShape[num];
    
    for(int i=0;i<num;i++){
      clippingShape[i] = createShape();
    }
    
    controlPoints = (ArrayList<ControlPoint>[])new ArrayList[num];
    for(int i=0;i<controlPoints.length;i++){
      controlPoints[i] = new ArrayList<ControlPoint>();  
    }
    
    clippingMask = createGraphics(sketch.width, sketch.height, P3D);
      
    frame = createGraphics(sketch.width, sketch.height, P2D);
    
    hull = new QuickHull3D();
  }
  
  void drawClippingMask(){
    clippingMask.beginDraw();
    clippingMask.background(0);
    try{
      for(int i=0;i<clippingShape.length;i++){
        clippingMask.shape(clippingShape[i]);
      }
      
    }
    catch(Exception e){
      //  
    }
    clippingMask.endDraw();
    
    frame.beginDraw();
    frame.image(movie, 0, 0, frame.width, frame.height);
    frame.endDraw();
    
    frame.mask(clippingMask);
    
    image(frame, 0, 0);
    
    for(int i=0;i<controlPoints.length;i++){
      for(int u=0;u<controlPoints[i].size();u++){
        if(calibrate){
          stroke(255,0,0);
          if(currShape == i && currMedia == id){
            drawShapeOutline();
            strokeWeight(3);
          }
          else{
            strokeWeight(1);  
          }
          if(controlPoints[i].get(u).mouseInside){
            fill(255,0,0,175);
          }
          else{
            noFill();
          }
        }
        controlPoints[i].get(u).drawControlPoint();
      }
    }
  }
  
  void drawShapeOutline(){
    noFill();
    beginShape();
    for(int i=0;i<controlPoints[currShape].size();i++){
      PVector p = controlPoints[currShape].get(i).point;
      vertex(p.x, p.y, p.z);
    }
    endShape(CLOSE);
  }
  
  void addPointToShape(int id, float x, float y, float z){
    if(id == -1){
      id = currShape;  
    }
    
    controlPoints[id].add(new ControlPoint(new PVector(x, y, z)));
    
    updateShape(id);
  }
  
  void updateShape(int id){
    
    if(id == -1){
      id = currShape;  
    }
    
    Point3d[] ptset;
    
    ptset = new Point3d[controlPoints[id].size()];
    for(int i=0;i<controlPoints[id].size();i++){
      ptset[i] = new Point3d(controlPoints[id].get(i).point.x, controlPoints[id].get(i).point.y, controlPoints[id].get(i).point.z);
    }
    
    try{
      hull.build (ptset);
      
      Point3d[] vertices = hull.getVertices();
      int[][] faceIndices = hull.getFaces();
      
      PShape s = createShape(); //create a new placeholder shape and draw the controlPoints here
      
      for (int i = 0; i < faceIndices.length; i++) {
        s.beginShape(QUAD_STRIP);
        s.fill(255);
        s.noStroke();
        for (int k = 0; k < faceIndices[i].length; k++) {
          Point3d v = vertices[faceIndices[i][k]];
          s.vertex((float)v.x, (float)v.y, (float)v.z);
        }
        s.endShape(CLOSE);
      }
      
      clippingShape[id] = s; //clear the old shape stored in clippingShape and make it equal to the new plaeholder shape
      
    }
    catch(Exception e){
      //  
    }
  }
  
  void updateCurrShape(int diff){
    currShape += diff;  //either +1 or -1
    
    if(currShape >= clippingShape.length){
      currShape--;
    }
    else if(currShape < 0){
      currShape = 0;  
    }
  }
  
  void saveData(){
    JSONArray json = new JSONArray();
    
    for(int i=0;i<controlPoints.length;i++){
      JSONArray shapeData = new JSONArray();
      for(int u=0;u<controlPoints[i].size();u++){
        JSONObject point = new JSONObject();
      
        point.setFloat("x", controlPoints[i].get(u).point.x);
        point.setFloat("y", controlPoints[i].get(u).point.y);
        point.setFloat("z", controlPoints[i].get(u).point.z);
        
        shapeData.setJSONObject(u, point);
      }
      json.setJSONArray(i, shapeData);
    }
    
    saveJSONArray(json, "data/"+dataFilename);
    println("successfully saved the data");
  }
  
  void loadData(){
    JSONArray json = loadJSONArray(dataFilename);
    
    for(int i=0;i<json.size();i++){
      JSONArray shapeData = json.getJSONArray(i);
      for(int u=0;u<shapeData.size();u++){
        JSONObject point = shapeData.getJSONObject(u);
        
        float x = point.getFloat("x");
        float y = point.getFloat("y");
        float z = point.getFloat("z");
        addPointToShape(i, x, y, z);
      }
    }
    
    println("successfully loaded the data");
  }
}
