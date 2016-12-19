class StartScreen {
  String s[]={"HI.", 
    "I KNOW YOU.", 
    "I'VE COLLECTED YOUR DATA.", 
    " ", 
    "CLICK BELOW TO SEE", 
    "WHAT I'VE DONE WITH IT!"
  };
  int fs=32;
  int cs;
  int x;
  int y;
  int i=0;
  int flag=0;
  PImage p1;
  PImage p2;
  PImage p3;
  
  StartScreen() {
    textAlign(CENTER);
    x=calculateX(s[flag]);

    //Set initial y
    y=200;
    frameRate(10);
    background(255);
    fill(0);
    fs=32;
    textSize(fs);
    cs=calculateCS(fs);
    p1=loadImage("1-01.png");
    p2=loadImage("2-01.png");
    p3=loadImage("3-01.png");
    
    image(p1,width/2,600);
    image(p2,width/2,700);
    image(p3,width/2,800);
  }

  void run() {
    if (flag<=5) {
      text(s[flag].charAt(i), x, y);
      i++;
      x+=cs;
      if (i>s[flag].length()-1) {
        flag++;
        y+=50;
        if (flag<=5) {
          x=calculateX(s[flag]);
        }
        i=0;
      }
    }
  }
  
  int calculateX(String temp) {
    println(temp.length());
    cs=calculateCS(fs);
    return ((width/2)-(temp.length()*cs)/2);
  }

  int calculateCS(int fontsize) {
    return fontsize-fontsize/7;
  }
  
  
}