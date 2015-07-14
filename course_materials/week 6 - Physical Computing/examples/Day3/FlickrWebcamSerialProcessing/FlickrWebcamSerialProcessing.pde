import processing.serial.*;
import processing.video.*;
Capture cam;

Serial myPort;        // The serial port
int sensorValue;      // value of the byte received
int counter; // Automatically initialized at 0
int DISPLAY_TIME = 50; // 2000 ms = 2 seconds
int lastTime; // When the current image was first displayed

String api = "https://api.flickr.com/services/rest/?method=flickr.photos.search&";
PImage[] images;
int imageIndex;
 
boolean bDisplayImage; // False by default
int startTime; // The (last) time when the mouse have been clicked

void setup() {
  size(displayWidth, displayHeight);
  println(Serial.list());
  myPort = new Serial(this, "/dev/tty.usbmodem1411", 9600);
  frameRate(30);
  //Sign up for flickr API and put your API key here, Dont use Mine!
  String query = api + "tags=hipster&format=rest&extras=url_o&api_key=562b5c8df6a49c0f5db3562b7e0de4c4&per_page=+500);";
  XML xml;
  xml = loadXML(query);
  XML[] photoTag = xml.getChildren("photos/photo");
  println(photoTag.length + " images");
  images = new PImage[photoTag.length];
  for (int i = 0; i < photoTag.length; i++) {
    String farm = photoTag[i].getString("farm");
    String server = photoTag[i].getString("server");
    String id = photoTag[i].getString("id");
    String secret = photoTag[i].getString("secret"); 
    String img = "http://farm"+farm+".static.flickr.com/"+server+"/"+id+"_"+secret+".jpg";
    images[i] = requestImage(img);
  }
  textAlign(CENTER, CENTER);
  smooth();
  lastTime = millis();
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}
 
void draw() {
  
  if (cam.available() == true) {
    cam.read();
  }
  //image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  
  int rate = int(map(sensorValue, 0, 255, 50, 500));
  int opac = int(map(sensorValue, 0, 255, 1, 255));
  int range1 = int(map(sensorValue, 0, 255, 1, 255));
  int range2 = int(map(sensorValue, 0, 255, 255, 1));
  if (images[imageIndex] != null) { 
  
  DISPLAY_TIME = rate;
  if (millis() - lastTime >= DISPLAY_TIME) // Time to display next image
  {
    // Increment counter, then compute its modulo, ie. reset it at zero when reaching images.length
    background(0);
    counter = ++counter % images.length;
    lastTime = millis();
  }
  
  fill(0);
  ellipse(15,15,20,20);
  fill(255);
  text(rate, 16, 14);
  tint(255, range2);
   image(cam, 0, 0,width,height);
    tint(255, range1);
  image(images[counter], 0, 0,width,height);
    

  }
}

void serialEvent(Serial myPort) { 
  // read the serial buffer:
  sensorValue = myPort.read();
} 

