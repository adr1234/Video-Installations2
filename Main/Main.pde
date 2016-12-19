import processing.sound.*;
import wordcram.*;

StartScreen s;
PhotoScreen p;
MusicScreen m;
WordScreen w;
int flag=1;
void setup() {
  fullScreen();
  imageMode(CENTER);
  s=new StartScreen();
  //p=new PhotoScreen();
  //p.file = new SoundFile(this, "PhotoScreen/sound13.wav");
  //p.file.loop();
  
  //m=new MusicScreen();
  //m.file = new SoundFile(this, "MusicScreen/blip.wav");
  //w = new WordScreen();
}

void draw() {
  switch(flag){
    case 1: s.run();
            break;
    case 2: p.run();
            break;
    case 3: m.run();
            break;
    case 4: startWordCram();
            break;
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

void keyPressed(){
  if(key=='1'){
    flag=1;
  }
  else if(key=='2'){
    flag=2;
  }
  else if(key=='3'){
    flag=3;
  }
  else if(key=='4'){
    flag=4;
  }
}