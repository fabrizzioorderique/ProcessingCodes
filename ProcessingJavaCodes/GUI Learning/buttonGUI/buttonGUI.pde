/**
 *  buttonGUI
 *
 *  My own attempt at making a button GUI
 *  This will all cumilate together to make one huge GUI for Arduino
 *  @author Piero Orderique
 *  @date 31 March 2019
 */
color rectColor, textColor;
String display;
int state;
void setup(){
   size(680,300);
   rectColor = 255;
   display = "OFF";
   state = 0;
}

void draw(){
  background(#171C76);
  rectMode(CENTER);
  fill(rectColor);
  rect(width/2,height/2,100,100);
  fill(textColor);
  textSize(50);
  textAlign(CENTER);
  text(display,width/2,height/2);
  updateFeatures();
}

boolean overButton(){
  if(mouseX <= (width/2 + 50) && mouseX >= (width/2 - 50) && 
     mouseY <= (height/2 + 50) && mouseY >= (height/2 - 50)){
    return true;
  }else{
    return false;
  }
}

void updateFeatures(){
  if(state == 1){
    display = "ON";
    textColor = 40;
    rectColor = 255;
  }else{
    display = "OFF";
    textColor = 255;
    rectColor = 40;
  }
}

void mousePressed(){
  if(overButton()){
    exampleMethod();
    if(state == 1){
      state = 0;
    }else if(state == 0){
       state = 1; 
    }
  }
}
 
//this could be where you put what would execute if button clicked
void exampleMethod(){
  print("Clicked!");
}
