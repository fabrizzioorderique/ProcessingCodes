class Button{
  private float xpos, ypos, w, h;
  private color col = #FF9B17;
  int state = 1;
  //Constructor default sets amplitude to 100
  Button(){
    xpos = 0;
    ypos = 500;
    w = 100;
    h =100;
    col = #196E98;
  }
  //General constructor
  Button(float x, float y, float w, float h, color c){
     xpos = x;
     ypos = y;
     this.w = w;
     this.h = h;
     col = c;
  }
  //methods
  void display(){
    strokeWeight(2);
    stroke(col);
    fill(col);
    rectMode(CENTER);
    rect(xpos, -1*ypos, w, h); //y axis has to be negated 
  }
  void changeAmp(float dh){
    amplitude+=dh;
  }

  //getters and setters
  float getH(){return h;}
  void setColor(color c){col = c;}
}
