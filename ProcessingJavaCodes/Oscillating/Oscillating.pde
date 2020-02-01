/**
*Oscillations Program
*this is an educative program to help teach students about the properties of sine graphs
*@author Piero Orderique
*@date January 03 2020
*/
import java.util.ArrayList;
ArrayList<Dot> dots = new ArrayList<Dot>(0);
float t = 0.0;
float dt = 0.1;
float amplitude = 100;
float frequency = 1;
float radius = 40;
boolean canMove = false;
boolean draggable = false;
AmplitudeLine myLine = new AmplitudeLine(amplitude);
AmplitudeLine boundary = new AmplitudeLine(620);
Button moveButton = new Button(2600, 800, 200, 100, #196E98, "Move");
Button resetButton = new Button(2600, -800, 200, 100, #BC0606, "RESET");


void setup(){
  size(3000,2000);  
      //creates the initial, non moving dots 
    for(int i = 0; i < width/radius; i++){
      //x coor gets shifted, amplitudes start at different points 
      dots.add(new Dot(i*radius,myLine.getAmp()*sin(frequency*(t+i)),radius));
      
    }
}
void draw(){
  //redraws background and axis every time
  background(0);  
  drawAxis();
  //starts a matrix translation
  pushMatrix();
    translate(0,height/2);
    myLine.display();
    boundary.setColor(255);
    boundary.display();
    moveButton.display();
    resetButton.display();
    for(Dot d : dots){
      d.display();
    }
    //does let amplitude fall below 0 or go above the boundary line
    if(draggable && mouseY-height/2 < radius*0.05 && 
       mouseY-height>-1*(height+0.2*myLine.getH()+radius) && -1*(mouseY-height/2)<600){
      myLine.setAmp(-1*(mouseY-height/2));
    }

    //addReference();
    //allows movement when "canMove" is enabled
    if(canMove){
      for(int i = 0; i < dots.size(); i++){
        dots.get(i).setY(myLine.getAmp()*sin(frequency*(t+i)));
      }
    }
  popMatrix();
  t += dt;
}
//draws the axis
void drawAxis(){
  strokeWeight(2);
  translate(0,0);
  stroke(255);
  line(width/2,height,width/2,0);
  line(0,height/2,width,height/2);
}
//adds a reference sine graph
void addReference(){
  int rad = 20;
  for(int i = 0; i < width/rad+10; i++){
    ellipse(i*rad,myLine.getAmp()*sin(i*-5.822),rad,rad);
  }
}

  void updateButton(Button c){
    //resetButton
    if(c == resetButton){
      canMove = false;
      myLine.setAmp(amplitude);
      for(int i = 0; i < dots.size(); i++){
        dots.get(i).setY(myLine.getAmp()*sin(frequency*(t+i)));
      }
    }
    //moveButton
    if(c == moveButton){
      if(c.state % 2 == 0){
        canMove = true;
      }else{
      canMove = false;
      }
    }
  }
/*--------------------------------------action methods----------------------------------*/
void mouseClicked(){
  if(moveButton.mouseOver()) {
    println("Move button clicked");
    moveButton.state++;
    updateButton(moveButton);
  }
  if(resetButton.mouseOver()){
    println("Reset button clicked");
    resetButton.state++;
    updateButton(resetButton);
  }
}
//draggability of amplitude line
void mouseDragged(){
  //mouseY was translated to mouseY - height/2 due to matrix translations
  //this makes sure that the mouse is within the rectangle boundaries before being dragged
  if(mouseY-height/2<-1*(myLine.getAmp()+radius/2) && 
     mouseY-height/2<-1*(myLine.getAmp()+radius/2+myLine.getH())){
    draggable = true;
  }
}
void mouseReleased(){
  draggable = false;
}
