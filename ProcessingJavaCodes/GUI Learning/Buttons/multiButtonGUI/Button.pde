class Button{
  private color colorOn, colorOff, buttonColor;
  private float xpos, ypos, w, h;
  private int state;
  
  //Default small black and white button
  Button(float xpos, float ypos){
    colorOn = 255;
    colorOff = 0;
    state = -1;
    w = 50;
    h = 50;
    buttonColor = colorOff;
    this.xpos = xpos;
    this.ypos = ypos;
  }
  
  Button(float xpos, float ypos, float w, float h, color colorOn, color colorOff){
    this.colorOn = colorOn;
    this.colorOff = colorOff;
    state = -1;
    buttonColor = colorOff;
    this.xpos = xpos;
    this.ypos = ypos;
    this.w = w;
    this.h = h;
  }
  
  
  public void displayRect(){
    fill(buttonColor);
    rectMode(CENTER);
    rect(xpos,ypos, w, h);
  }
  public void displayEllipse(float w, float h){
    fill(buttonColor);
    ellipseMode(CENTER);
    ellipse(xpos,ypos, w, h);
  }
  public boolean overButton(){
    if(mouseX <= (xpos + w) && mouseX >= (xpos - w) && mouseY <= (ypos + h) && mouseY >= (ypos - h)){
      return true;
    }else{
      return false;
    }
  }
  public void updateFeatures(){
    if(state > 0){
      buttonColor = colorOn;
    }else{
      buttonColor = colorOff;
    }
  }
}
