import deadpixel.keystone.*;
import processing.video.*;

Keystone ks; //this the main library object - must have

/***VARIABLES FOR A PROJECTION MAPPED SURFACE***/
CornerPinSurface surface; //this is the surface you can
                          //  manipulate to fit a shape
PGraphics texture; //this is where you draw your 
                   //  image/video/animation/etc onto
Movie movie; //load your video file here
/**********************************************************/


/***VARIABLES FOR A PROJECTION MAPPED SURFACE***/
CornerPinSurface surface2; //this is the surface you can
                          //  manipulate to fit a shape
PGraphics texture2; //this is where you draw your 
                   //  image/video/animation/etc onto
Movie movie2; //load your video file here
/**********************************************************/

void setup(){
  size(800, 600, P3D); //Keystone requires a 3d renderer, so specify one here
  
  ks = new Keystone(this); //initialize the Keystone library
  
  
  /***SETUP CODE FOR A MAPPED SURFACE***/
  surface = ks.createCornerPinSurface(400,300,20); //create a new "surface" object
                                                   //  that the library will manage
  
  texture = createGraphics(400, 300, P2D); //create the texture surface that will
                                           //  map onto the "surface" object.
                                           //  Note, you need this to be P2D if
                                           //  you want to use video
  
  movie = new Movie(this, "clip.mp4"); //create a new Movie object
                                          //  loaded with your video
  movie.loop(); //for this demo, just loop the movie
  /*********************************************************/
  
  
  /***SETUP CODE FOR A MAPPED SURFACE***/
  surface2 = ks.createCornerPinSurface(400,300,20); //create a new "surface" object
                                                   //  that the library will manage
  
  texture2 = createGraphics(400, 300, P2D); //create the texture surface that will
                                           //  map onto the "surface" object.
                                           //  Note, you need this to be P2D if
                                           //  you want to use video
  
  movie2 = new Movie(this, "clip.mp4"); //create a new Movie object
                                          //  loaded with your video
  movie2.loop(); //for this demo, just loop the movie
  /*********************************************************/
}

//Necessary function for the Movie object to run
void movieEvent(Movie m) {
  m.read();
}

void draw(){
  background(0);
  
  /***DRAW ONTO A TEXTURE, AND MAP IT ONTO THE MAPPING SURFACE***/
  texture.beginDraw(); //start drawing onto the texture surface
  texture.background(0); //create a black background
  
  //this image function will hold each from from the video we loaded
  //  into the Movie object.  You can specify a location and width
  //  and height.  For now we have it stretching the whole frame
  texture.image(movie, 0, 0, texture.width, texture.height);
  
  texture.endDraw(); //end drawing onto the texture surface
  
  surface.render(texture); //now render the texture surface
                           //  onto the Keystone surface
  /**************************************************************/
  
  
  /***DRAW ONTO A TEXTURE, AND MAP IT ONTO THE MAPPING SURFACE***/
  texture2.beginDraw(); //start drawing onto the texture surface
  texture2.background(0); //create a black background
  
  //this image function will hold each from from the video we loaded
  //  into the Movie object.  You can specify a location and width
  //  and height.  For now we have it stretching the whole frame
  texture2.image(movie2, 0, 0, texture2.width, texture2.height);
  
  texture2.endDraw(); //end drawing onto the texture surface
  
  surface2.render(texture2); //now render the texture surface
                           //  onto the Keystone surface
  /**************************************************************/
}

/***KEYBOARD EVENTS***/
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
/*********************/
