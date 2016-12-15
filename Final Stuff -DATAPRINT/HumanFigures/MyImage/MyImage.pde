class MyImage {
  //int w;
  //int h;
  int x;
  int y;
  PImage img;

  MyImage(int i) {
    img = loadImage(i+".jpeg");
    x=(int)random(width);
    y=(int)random(height);
  }

  void display() {
    image(img, x, y);
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