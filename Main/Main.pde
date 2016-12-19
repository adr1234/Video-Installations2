import processing.sound.*;
import wordcram.*;

StartScreen s;
PhotoScreen p;
MusicScreen m;
WordScreen w;
int flag=0;
void setup() {
  fullScreen();
  s=new StartScreen();
  //p=new PhotoScreen();
  //p.file = new SoundFile(this, "PhotoScreen/sound13.wav");
  //p.file.loop();
  
  //m=new MusicScreen();
  //m.file = new SoundFile(this, "MusicScreen/blip.wav");
  //w = new WordScreen();
}

void draw() {
  if(flag==0){
    s.run();
  }
}

void startWordCram() {

  new WordCram(this)
    .fromTextFile("Story.txt")
    //.withFont(createFont("Firestarter Z.otf", 1))
    .sizedByWeight(10, 90)
    .withColors(color(random(255), random(255), random(255)), color(random(255), random(255), random(255)), color(random(255), random(255), random(255)))
    .drawAll();
}