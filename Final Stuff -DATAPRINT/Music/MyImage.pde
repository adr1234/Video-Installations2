class MyImage {
  //int w;
  //int h;
  int x;
  int y;
  final int MAX = 100;   //No of copies for a single image
  PImage img;

  MyImage(int i) {
    img = loadImage(i+".jpg");
    x=(int)random(width);
    y=(int)random(height);
    img.resize(40,40);
  }

  void display() {
    for(int i=0; i<MAX; i++){
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