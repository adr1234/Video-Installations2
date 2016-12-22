import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 
import wordcram.*; 
import http.requests.*; 
import processing.sound.*; 
import processing.sound.*; 

import cue.lang.*; 
import cue.lang.stop.*; 
import cue.lang.unicode.*; 
import org.jsoup.*; 
import org.jsoup.examples.*; 
import org.jsoup.helper.*; 
import org.jsoup.nodes.*; 
import org.jsoup.parser.*; 
import org.jsoup.safety.*; 
import org.jsoup.select.*; 
import wordcram.*; 
import wordcram.text.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Main extends PApplet {





StartScreen s;
PhotoScreen p;
MusicScreen m;
WordScreen w;
int flag=1;
int x=230, y1=550, y2=750, y3=950, wi=300, hi=150;
Data d;
String str;
public void setup() {
  
  s=new StartScreen();
  s.file = new SoundFile(this, "typing-medium-01.wav");
  s.file.play();
  //d=new Data();
  //d.loadData();
  //d.loadString();
  
 // flag=0;
}

public void draw() {
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

public void startWordCram() {

  new WordCram(this)
    .fromTextFile("WordScreen/Story.txt")
    //.fromTextString(str)
    //.withFont(createFont("Firestarter Z.otf", 1))
    .sizedByWeight(10, 90)
    .withColors(color(random(255), random(255), random(255)), color(random(255), random(255), random(255)), color(random(255), random(255), random(255)))
    .drawAll();
}

public void keyPressed() {
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
public void mousePressed() {
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

public void drawButtons() {
  fill(0, 5);
  stroke(0, 0);
  rect(x, y1, wi, hi);
  rect(x, y2, wi, hi);
  rect(x, y3, wi, hi);
  fill(0);
  stroke(0);
}
class Data {
  GetRequest get;
  JSONObject response;
  JSONArray users;
  int number_of_users;

  JSONArray MusicArtist[];
  JSONArray sms[];
  JSONArray answers[];
  JSONArray photo[];
  String id[];
  JSONArray Apps[];
  Data() {
    get = new GetRequest("http://104.162.96.94:7890/users");
    get.send();
    response=parseJSONObject(get.getContent());
    users=response.getJSONArray("users");
    //println(users.getJSONObject(0).getJSONArray("answers"));

    if (response!=null) {
      number_of_users=response.getJSONArray("users").size();
    }
    println(number_of_users);
    //println(response.getJSONArray("users").getJSONObject(0).getJSONArray("photos"));
    if (number_of_users>0) {
      //MusicArtist=new JSONArray[number_of_users];
      answers=new JSONArray[number_of_users];
      //sms=new JSONArray[number_of_users];
      //photo=new JSONArray[number_of_users];
      //Apps=new JSONArray[number_of_users];
    }

    for (int i=0; i<number_of_users; i++) {
      JSONObject user=users.getJSONObject(i);
      println(user);
      JSONArray a=new JSONArray();
      if(user.getJSONArray("answers").isNull(0)){
        a=user.getJSONArray("answers");
      }
      println(a);
    }
  }
  public void loadData() {
    for (int i=0; i<number_of_users; i++) {
      JSONArray a=users.getJSONObject(i).getJSONArray("answers");
      concat(str, a.toString());
    }
    //try {
    //  for (int i=0; i<number_of_users; i++) {
    //    MusicArtist[i]=users.getJSONObject(i).getJSONArray("MusicArtist");
    //    sms[i]=users.getJSONObject(i).getJSONArray("sms");
    //    answers[i]=users.getJSONObject(i).getJSONArray("answers");
    //    photo[i]=users.getJSONObject(i).getJSONArray("photo");
    //    Apps[i]=users.getJSONObject(i).getJSONArray("Apps");
    //    println(answers[i]);
    //  }
    //}catch(NullPointerException ne){
    //  println("null pointer exception"); 
    //}
  }
  public void loadString() {
    //for(int i=0;i<number_of_users;i++){
    //   for(int j=0;j<answers[i].size();j++){
    //       concat(str," "+answers[i].getString(j));
    //   }
    //}
  }
}
class MusicScreen {
  MyImage[] myimages= new MyImage[10];
  int index=1;
  PImage mask[];
  
  //SoundFile file;
  int maskindex=1;

  MusicScreen() {
    frameRate(24);
    imageMode(CORNER);
    background(0);
    //Loading images
    for (int i=0; i<myimages.length; i++) {
      myimages[i]=new MyImage(i);
    }
    mask = new PImage[4];

    for (int i=0; i<mask.length; i++) {
      mask[i]=loadImage("MusicScreen/Mask"+(i+1)+".png");
      mask[i].resize(width, height);
    }
    
  }

  public void run() {

    
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
    if ((frameCount%100 == 0)) {
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
      img = loadImage("MusicScreen/"+i+".jpg");
      x=(int)random(width);
      y=(int)random(height);
      img.resize(20, 20);
    }

    public void display() {
      for (int i=0; i<MAX; i++) {
        image(img, x, y);
        resetPosition();
      }
    }

    public void resetPosition() {
      x=(int)random(width);
      y=(int)random(height);
    }

    public void flickr(int state) {

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

  public void run() {

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

    public void display() {
      for (int i=0; i<MAX; i++) {
        image(img, x, y);
        resetPosition();
      }
    }

    public void resetPosition() {
      x=(int)random(width);
      y=(int)random(height);
    }

    public void flickr(int state) {

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
  SoundFile file;
  

  StartScreen() {
    imageMode(CENTER);
    textAlign(CENTER);
    x=calculateX(s[flag]);
    //file = new SoundFile(this, "typing-medium-01.wav");
    //file.play();
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

  public void run() {
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

  public void displayIcon() {
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
  public int calculateX(String temp) {
    //println(temp.length());
    cs=calculateCS(fs);
    return ((width/2)-(temp.length()*cs)/2);
  }

  public int calculateCS(int fontsize) {
    return fontsize-fontsize/7;
  }

  public void displayEmpty() {
    for (int i=0; i<1000; i++) {
      frameRate(1);
    }
  }
  
  //void mouseClicked(){
  //  if(mouseX<b1x &&  
  //}
}
class WordScreen {
  WordScreen() {
    background(255);
    colorMode(HSB);
    frameRate(1);
  }
  public void run() {
    clear();
    background(255);
    startWordCram();
    
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
