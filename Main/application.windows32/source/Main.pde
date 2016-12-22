import processing.sound.*;
import wordcram.*;
import http.requests.*;

StartScreen s;
PhotoScreen p;
MusicScreen m;
WordScreen w;
int flag=1;
int x=230, y1=550, y2=750, y3=950, wi=300, hi=150;
Data d;
String str;
void setup() {
  fullScreen();
  s=new StartScreen();
  s.file = new SoundFile(this, "typing-medium-01.wav");
  s.file.play();
  //d=new Data();
  //d.loadData();
  //d.loadString();
  
 // flag=0;
}

void draw() {
  switch(flag) {
  case 1: 
    s.run(); 
    break;
  case 2: 
    p.run();
    break;
  case 3: 
    m.run();
    break;
  case 4: 
    w.run();
    break;
  }

  //drawButtons();
}

void startWordCram() {

  new WordCram(this)
    .fromTextFile("WordScreen/Story.txt")
    //.fromTextString(str)
    //.withFont(createFont("Firestarter Z.otf", 1))
    .sizedByWeight(10, 90)
    .withColors(color(random(255), random(255), random(255)), color(random(255), random(255), random(255)), color(random(255), random(255), random(255)))
    .drawAll();
}

void keyPressed() {
  if (key=='1') {
    flag=1;
    s=new StartScreen();
    s.file = new SoundFile(this, "typing-medium-01.wav");
    s.file.play();
    redraw();
  } else if (key=='2') {
    flag=2;
    p=new PhotoScreen();
    //p.file = new SoundFile(this, "PhotoScreen/sound13.wav");
    //p.file.loop();
    redraw();
  } else if (key=='3') {
    flag=3;
    m=new MusicScreen();
    //m.file = new SoundFile(this, "MusicScreen/blip.wav");
    redraw();
  } else if (key=='4') {
    flag=4;
    w = new WordScreen();
    redraw();
  }
}
//void mouseMoved() {
//text(mouseX+","+mouseY, mouseX, mouseY);
//}
void mousePressed() {
  if ((mouseX>x)&&(mouseX<x+wi)&&(mouseY>y1)&&(mouseY<y1+hi)) {
    flag=2;
    p=new PhotoScreen();
    //p.file = new SoundFile(this, "PhotoScreen/sound13.wav");
    //p.file.loop();
    redraw();
  } else if ((mouseX>x)&&(mouseX<x+wi)&&(mouseY>y2)&&(mouseY<y2+hi)) {
    flag=3;
    m=new MusicScreen();
    //m.file = new SoundFile(this, "MusicScreen/blip.wav");
    redraw();
  } else if ((mouseX>x)&&(mouseX<x+wi)&&(mouseY>y3)&&(mouseY<y3+hi)) {
    flag=4;
    w = new WordScreen();
    redraw();
  }
}

void drawButtons() {
  fill(0, 5);
  stroke(0, 0);
  rect(x, y1, wi, hi);
  rect(x, y2, wi, hi);
  rect(x, y3, wi, hi);
  fill(0);
  stroke(0);
}