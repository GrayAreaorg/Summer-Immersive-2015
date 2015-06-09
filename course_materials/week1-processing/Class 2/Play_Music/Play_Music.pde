import ddf.minim.*;  // Imports Minim, a library for playing sound

Minim minim;        // Creates an object called minim from the class Minim
AudioPlayer player; // In Minim, AudioSample is the variable type for an audio sample player

void setup(){
  size(200,200);
   minim = new Minim(this);  // fills the variable minim with a new object Minim
   player = minim.loadFile("marcus_kellis_theme.mp3");
}

void draw(){
 player.play(); 
}




