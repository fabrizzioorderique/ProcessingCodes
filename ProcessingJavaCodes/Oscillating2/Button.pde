class Button{
  private float xpos, ypos, w, h;
  private color col;
  int state = 1;
  String text;
  //Constructor default sets amplitude to 100
  Button(){
    xpos = 0;
    ypos = 500;
    w = 100;
    h =100;
    col = #196E98;
    text = "Test Button";
  }
  //General constructor
  Button(float x, float y, float w, float h, color c, String text){
     xpos = x;
     ypos = y;
     this.w = w;
     this.h = h;
     col = c;
     this.text = text;
  }
  //displays the Button
  void display(){
    //makes the actual rectangular button
    strokeWeight(2);
    stroke(col);
    fill(col);
    rectMode(CENTER);
    rect(xpos, -1*ypos, w, h); //y axis has to be negated 
    //puts text on it;
    fill(255);
    textSize(50); //defalut size
    textAlign(CENTER);
    text(text, xpos, -1*ypos);
  }
  //checks if mouse is over a certain color
  boolean mouseOver() {
    //fills in pixels just in case it wasn't filled already
    if(pixels == null) {
      loadPixels();
      return false;
    } else if(pixels[(mouseY*width) + mouseX] == col) {
        return true;
     } else {
        return false;
     }
   }
  //getters and setters
  float getH(){return h;}
  float getX(){return xpos;}
  float getY(){return ypos;}
  void setColor(color c){col = c;}
  void setTextSize(int size){textSize(size);}
}
