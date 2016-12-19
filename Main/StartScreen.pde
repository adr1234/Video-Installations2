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