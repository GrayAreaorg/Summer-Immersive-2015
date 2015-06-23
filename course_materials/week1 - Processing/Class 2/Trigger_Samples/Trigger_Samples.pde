import ddf.minim.*;  // Imports Minim, a library for playing sound

Minim minim;         // Creates an object called minim from the class Minim
AudioSample kick;    // In Minim, AudioSample is the variable type for an audio sample player
AudioSample snare;   // here we have made two AudioSample variables named kick and snare

void setup() {
  size(600, 600);
  minim = new Minim(this);  // This line turns the variable minim into an object.

  kick = minim.loadSample("BD.mp3", 512);  // note: 512 is the buffer rate and should not be changed
  snare = minim.loadSample("SD.wav", 512);
}

void draw() {
  background(100);
}

void keyPressed() {
  if (key == 's'){
    snare.trigger();
    background(255,0,0);
  }
  
  if (key == 'k'){ 
    kick.trigger();
    background(0,255,0);
  }
}

