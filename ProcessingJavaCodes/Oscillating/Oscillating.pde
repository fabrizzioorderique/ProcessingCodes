/**
*Oscillations Program
*this is an educative program to help teach students about the properties of sine graphs
*@author Piero Orderique
*@date January 03 2020
*/
import java.util.*;
AmplitudeLine myLine = new AmplitudeLine(100);
AmplitudeLine boundary = new AmplitudeLine(620);
ArrayList<Dot> dots = new ArrayList<Dot>(0);
float t = 0.0;
float dt = 0.1;
float amplitude = 100;
float frequency = 1;
float radius = 50;
boolean canMove = false;
boolean draggable = false;


void setup(){
  size(3000,2000);  
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
    //does let amplitude fall below 0
    if(draggable && mouseY-height/2 < radius*0.05 && mouseY-height>-1*(height+0.2*myLine.getH()+radius)){
      myLine.setAmp(-1*(mouseY-height/2));
    }
    //creates the initial, non moving dots
    for(int i = 0; i < width/radius; i++){
      //x coor gets shifted, amplitudes start at different points 
      dots.add(new Dot(i*radius,myLine.getAmp()*sin(frequency*(t+i)),radius));
      dots.get(i).display();
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
//action methods
void mouseClicked(){
  canMove = true;
  println(mouseY-height/2);
}
//draggability of amplitude line
void mouseDragged(){
  //mouseY was translated to mouseY - height/2 due to matrix translations
  //this makes sure that the mouse is within the rectangle boundaries before being dragged
  if(mouseY-height/2<-1*(myLine.getAmp()+radius/2) && 
     mouseY-height/2>-1*(myLine.getAmp()+radius/2+myLine.getH())){
    draggable = true;
    print(draggable);
  }
}
void mouseReleased(){
  draggable = false;
}
