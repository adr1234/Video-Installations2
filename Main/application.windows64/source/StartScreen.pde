class StartScreen {
  String s[]={"HI.", 
    "I KNOW YOU.", 
    "I'VE COLLECTED YOUR DATA.", 
    " ", 
    "CLICK BELOW TO SEE", 
    "WHAT I'VE DONE WITH IT!"
  };
  int fs;
  int cs;
  int x;
  int y;
  int i=0;
  int flag=0;
  PImage p1;
  PImage p2;
  PImage p3;

  StartScreen() {
    imageMode(CENTER);
    textAlign(CENTER);
    x=calculateX(s[flag]);

    //Set initial y
    y=200;
    frameRate(10);
    background(255);
    fill(0);
    fs=26;
    textSize(fs);
    cs=calculateCS(fs);
    p1=loadImage("1-01.png");
    p2=loadImage("2-01.png");
    p3=loadImage("3-01.png");
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
    if (flag==6) {
      displayEmpty();
      flag++;
    }
    else if (flag==7) {
      displayIcon();
      flag++;
    }
  }

  void displayIcon() {
    //rect((width/2)-150,550,300,150);
    //rect((width/2)-150,750,300,150);
    //rect((width/2)-150,950,300,150);

    image(p1, width/2, 600);
    text("Your images", width/2, 650);
    image(p2, width/2, 800);
    text("Your music", width/2, 850);
    image(p3, width/2, 1000);
    text("Your text messages", width/2, 1050);
  }
  int calculateX(String temp) {
    println(temp.length());
    cs=calculateCS(fs);
    return ((width/2)-(temp.length()*cs)/2);
  }

  int calculateCS(int fontsize) {
    return fontsize-fontsize/7;
  }

  void displayEmpty() {
    for (int i=0; i<1000; i++) {
      frameRate(1);
    }
  }
  
  //void mouseClicked(){
  //  if(mouseX<b1x &&  
  //}
}