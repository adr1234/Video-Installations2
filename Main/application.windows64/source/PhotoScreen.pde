class PhotoScreen {
  MyImage[] myimages= new MyImage[16];
  int index=1;
  PImage mask[];
  SoundFile file;
  int maskindex=1;
  PhotoScreen() {
    imageMode(CORNER);
    background(255);
    frameRate(24);
    //Loading images
    for (int i=0; i<myimages.length; i++) {
      myimages[i]=new MyImage(i);
    }
    mask = new PImage[4];

    for (int i=0; i<mask.length; i++) {
      mask[i]=loadImage("PhotoScreen/Mask"+(i+1)+".png");
      mask[i].resize(width, height);
    }
  }

  void run() {

    fill(255, 10);
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
    if ((frameCount%200 == 0)) {
      maskindex=(maskindex+1)%mask.length;
    }
    //if((frameCount%50 == 0) && (maskindex%2!=0)){
    //  maskindex=(maskindex+1)%5;
    //}
  }
  class MyImage {
    //int w;
    //int h;
    int x;
    int y;
    final int MAX = 100;   //No of copies for a single image
    PImage img;

    MyImage(int i) {
      img = loadImage("PhotoScreen/"+i+".JPG");
      x=(int)random(width);
      y=(int)random(height);
      img.resize(20, 20);
    }

    void display() {
      for (int i=0; i<MAX; i++) {
        image(img, x, y);
        resetPosition();
      }
    }

    void resetPosition() {
      x=(int)random(width);
      y=(int)random(height);
    }

    void flickr(int state) {

      if (state==0) {
        fill(255, 100);
        rect(x, y, img.width, img.height);
      } else {      
        fill(0, 100);
        rect(x, y, img.width, img.height);
      }
    }
  }
}