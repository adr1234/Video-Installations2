import processing.sound.*;
import wordcram.*;

StartScreen s;
PhotoScreen p;
MusicScreen m;
//WordScreen w;
void setup() {
  fullScreen();
  //s=new StartScreen();
  //p=new PhotoScreen();
  //p.file = new SoundFile(this, "PhotoScreen/sound13.wav");
  //p.file.loop();
  
  m=new MusicScreen();
  m.file = new SoundFile(this, "MusicScreen/blip.wav");
}

void draw() {
  //s.run();
  m.run();
}