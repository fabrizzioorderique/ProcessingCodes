class Button{
  private float xpos, ypos, w, h;
  private color col;
  int state = 1;
  String display;
  //Constructor default sets amplitude to 100
  Button(){
    xpos = 0;
    ypos = 500;
    w = 100;
    h =100;
    col = #196E98;
    display = "Test Button";
  }
  //General constructor
  Button(float x, float y, float w, float h, color c, String text){
     xpos = x;
     ypos = y;
     this.w = w;
     this.h = h;
     col = c;
     display = text;
  }
  //methods
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
    text(display, xpos, -1*ypos);
  }
  //checks if mouse is over a certain color
  boolean mouseOver() {
    // If processing pixels array is null (we didn't call loadPixels yet)
    // call loadPixels() to fill processing pixels array 
    if(pixels == null) {
      loadPixels();
      return false;
    } else {   
     // Otherwise, if we already get pixels in memory
     // check if mouse over pixel's color is equal to the given color
     if(pixels[(mouseY*width) + mouseX] == col) {
        return true;
     } else {
        return false;
     }
   }
  }


  //getters and setters
  float getH(){return h;}
  void setColor(color c){col = c;}
  void setTextSize(int size){textSize(size);}
}
