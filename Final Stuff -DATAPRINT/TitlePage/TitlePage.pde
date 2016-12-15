void setup(){
  fullScreen();
  textAlign(CENTER);
  
}
void draw(){
  text("Hi.", width/2, 200);
  text("uyfsah dfjsajfam.", width/2, 220);
  text("kjahbxdyuagk hf.", width/2, 240);
  
  
}
void mouseMoved(){
  text(mouseX+","+mouseY, mouseX, mouseY);
}