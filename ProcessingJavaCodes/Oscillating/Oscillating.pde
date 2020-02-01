/**
*Oscillations Program
*this is an educative program to help teach students about the properties of sine graphs
*@author Piero Orderique
*@date January 03 2020
*
*To teach: y = asin(b(x+c))+d , ignoring c and d
*/
import java.util.ArrayList;
ArrayList<Dot> dots = new ArrayList<Dot>(0);
float t = 0.0;
float dt = 0.1;
float amplitude = 100;
float frequency = 1.0;
float initRadius = 40;
float radius = 40;
boolean canMove = false;
boolean draggable = false;
AmplitudeLine myLine = new AmplitudeLine(amplitude);
AmplitudeLine boundary = new AmplitudeLine(620);
Button moveButton = new Button(2600, 800, 200, 100, #196E98, "Start");
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
    displayEquation();
    //displayInstructions();
    for(Dot d : dots){d.display();}
    //does not let amplitude fall below 0 or go above the boundary line
    if(draggable && mouseY-height/2 < radius*0.05 && 
       mouseY-height>-1*(height+0.2*myLine.getH()+radius) && 
       -1*(mouseY-height/2)<600){
      myLine.setAmp(-1*(mouseY-height/2));
    }
    //addReference();
    //allows movement when "canMove" is enabled
    if(canMove){updateDots();}
  popMatrix();
  t += dt;
}
/*---------------------------------- cleanup/test methods-------------------------------*/
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
void updateDots(){
  for(int i = 0; i < dots.size(); i++){
    dots.get(i).setRadius(radius);
    dots.get(i).setY(myLine.getAmp()*sin(frequency*(t+i)));
  }
}
float roundFloat(float a){
  a *= 100;
  a = (int)a;
  a = (float)a;
  a/= 100;
  return a;
}
void displayEquation(){
  String t = "Equation: y = "+myLine.getAmp()+"sin("+roundFloat(frequency)+"x)";
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(t, 700, -1*800);
}
void displayInstructions(){
  String t = "test";
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(t,1800 ,-1*800);
}
/*--------------------------------------button updates----------------------------------*/
  void updateButton(Button c){
    //resetButton
    if(c == resetButton){
      canMove = false;
      myLine.setAmp(amplitude);
      frequency = 1;
      radius = initRadius;
      updateDots();
    }
    //moveButton
    if(c == moveButton){
      if(c.state % 2 == 0){
        canMove = true;
        c.text = "Stop";
      }else{
        canMove = false;
        c.text = "start";
      }
    }
  }
/*--------------------------------------action methods----------------------------------*/
void mouseClicked(){
  if(moveButton.mouseOver()) {
    //println("Move button clicked");
    moveButton.state++;
    updateButton(moveButton);
  }
  if(resetButton.mouseOver()){
    //println("Reset button clicked");
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
  //adjusts the heights of the dots based on where user drags myLine
  updateDots();
}
void mouseReleased(){
  draggable = false;
}
//For changing frequency
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && radius <= 100) {  //KeyEvent.VK_UP
      radius += 5;
      updateDots();
    } else if (keyCode == DOWN && radius >= 10) {
      radius -= 5;
      updateDots();
    } else if (keyCode == RIGHT && frequency <= 2) {
      frequency+=0.1;
      updateDots();
    } else if (keyCode == LEFT && frequency >= 0) {
      frequency-=0.1;
      updateDots();
    } 
  }
}
