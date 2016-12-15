MyImage[] myimages= new MyImage[10];
int index=1;
PImage mask[];
import processing.sound.*;
SoundFile file;
int maskindex=1;
void setup() {
  //size(1280, 720);
  fullScreen();
  background(0);
  //Loading images
  for (int i=0; i<myimages.length; i++) {
    myimages[i]=new MyImage(i);
  }
  mask = new PImage[4];

  for (int i=0; i<mask.length; i++) {
    mask[i]=loadImage("Mask"+(i+1)+".png");
    mask[i].resize(width,height);
  }
  file = new SoundFile(this, "blip.wav");
}

void draw() {
  
  file.play();
  fill(255, 5);
  rect(0, 0, width, height);
  //Display images
  
  myimages[index].display();
  myimages[index].resetPosition();
  myimages[index].flickr(0);
  index=((index+1)%10);
  image(mask[maskindex], 0, 0);
  //if (frameCount%100==0) { 
    //maskindex=(maskindex+1)%4;
  //}
  if((frameCount%100 == 0)){
    maskindex=(maskindex+1)%mask.length;
  }
  //if((frameCount%50 == 0) && (maskindex%2!=0)){
  //  maskindex=(maskindex+1)%5;
  //}
}