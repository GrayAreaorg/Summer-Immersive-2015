class ClippingMask{
  
  PShape clippingShape;
  PGraphics clippingMask;
  PGraphics frame;
  
  ArrayList<ControlPoint> controlPoints = new ArrayList<ControlPoint>();
  
  IsoWrap iso;
  Point3d[] ptset;
  QuickHull3D hull;
  
  Movie movie;
  
  String dataFilename;
  
  int id;
  
  ClippingMask( PApplet sketch, String mov, String d, int myID){
    movie = new Movie(sketch, mov);    
    movie.loop();
    
    dataFilename = d;
    
    id = myID;
    
    clippingShape = createShape();
    clippingMask = createGraphics(sketch.width, sketch.height, P3D);
    
    frame = createGraphics(sketch.width, sketch.height, P2D);
    
    ptset = new Point3d[0];
    hull = new QuickHull3D();
  }
  
  void drawClippingMask(){
    clippingMask.beginDraw();
    clippingMask.background(0);
    try{
      clippingMask.shape(clippingShape);
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
    
    for(int i=0;i<controlPoints.size();i++){
      if(calibrate){
        stroke(255,0,0);
        if(currShape == id){
          strokeWeight(3);
        }
        else{
          strokeWeight(1);  
        }
        if(controlPoints.get(i).mouseInside){
          fill(255,0,0,175);
        }
        else{
          noFill();
        }
      }
      controlPoints.get(i).drawControlPoint();
    }
  }
  
  void addPointToShape(float x, float y, float z){
    controlPoints.add(new ControlPoint(new PVector(x, y, z)));
    
    updateShape();
  }
  
  void updateShape(){
    ptset = new Point3d[controlPoints.size()];
    for(int i=0;i<controlPoints.size();i++){
      ptset[i] = new Point3d(controlPoints.get(i).point.x, controlPoints.get(i).point.y, controlPoints.get(i).point.z);
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
      
      clippingShape = s; //clear the old shape stored in clippingShape and make it equal to the new plaeholder shape
      
    }
    catch(Exception e){
      //  
    }
  }
  
  void saveData(){
    JSONArray json = new JSONArray();
    
    for(int i=0;i<controlPoints.size();i++){
      JSONObject point = new JSONObject();
      
      point.setFloat("x", controlPoints.get(i).point.x);
      point.setFloat("y", controlPoints.get(i).point.y);
      point.setFloat("z", controlPoints.get(i).point.z);
      
      json.setJSONObject(i, point);
    }
    
    saveJSONArray(json, "data/"+dataFilename);
    println("successfully saved the data");
  }
  
  void loadData(){
    JSONArray json = loadJSONArray(dataFilename);
    
    for(int i=0;i<json.size();i++){
      JSONObject point = json.getJSONObject(i);
      
      float x = point.getFloat("x");
      float y = point.getFloat("y");
      float z = point.getFloat("z");
      addPointToShape(x, y, z); 
    }
    
    println("successfully loaded the data");
  }
}
