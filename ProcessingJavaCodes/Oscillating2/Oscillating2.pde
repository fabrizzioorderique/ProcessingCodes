/**
*Oscillations2 Program
*this is an educative program to help teach students about the properties of sine graphs
*@author Piero Orderique
*@date January 03 2020
*
*To teach: y = asin(b(x+c))+d , ignoring d (becasue itself explanatory)
*
*NOTE: All non personal methods such as mouseClicked() are all part of the open source
*      community libraries provdied by https://processing.org/
*/
import java.util.ArrayList;
ArrayList<Dot> dots = new ArrayList<Dot>(0);
float t = 0.0;
float dt = 0.1;
float amplitude = 100;  //amplitude line starts at 100
float initFrequency = 0.5;  
float frequency = initFrequency;
float initRadius = 40;
float radius = initRadius;
float phaseShift = 0;
boolean canMove = false;
boolean draggable = false;
AmplitudeLine myLine = new AmplitudeLine(amplitude);
AmplitudeLine topBoundary = new AmplitudeLine(600);
AmplitudeLine bottomBoundary = new AmplitudeLine(-650);
Button moveButton = new Button(2600, 800, 200, 100, #196E98, "Start");
Button resetButton = new Button(2600, -800, 200, 100, #BC0606, "RESET");
Slider radiusSlider = new Slider(100,1800,50);

int counter = 0;

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
  radiusSlider.update();
  radiusSlider.display();
  counter++;
  if(counter%10==0){println(mouseX);}
  //starts a matrix translation
  pushMatrix();
    translate(0,height/2);
    //displays the boundaries
    topBoundary.setColor(255);
    topBoundary.display();
    bottomBoundary.setColor(255);
    bottomBoundary.display();
    //displays the interactivity buttons
    moveButton.display();
    resetButton.display();
    //displays other program essentials
    myLine.display();
    displayEquation();
    //addReference();
    displayInstructions();
    for(Dot d : dots){d.display();}
    //does not let amplitude fall below 0 or go above the topBoundary line
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
  line(width/2,height-(bottomBoundary.getAmp()+1020),width/2,topBoundary.getAmp()-220);
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
String roundFloat(float a, int places){
  String num = nf(a,0,places);
 /* a *= 100;
  a = (int)a;
  a = (float)a;
  a/= 100;*/
  return num;
}
void displayEquation(){
  String t = "Equation: y = "+roundFloat(myLine.getAmp(),0)+"sin("+roundFloat(frequency,1)+"x)";
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(t, 1900, -1*800);
}
void displayInstructions(){
  String t1 = "UP and DOWN arrows change the frequency";
  String t2 = "LEFT and RIGHT arrows change phase shift";
  String t3 = "Drag the orange bar to change the amplitude";
  String t4 = "Control Zoom Factor by sliding: "+str(radius);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(t1,700 ,-1*900);
  text(t2,700,-1*825);
  text(t3,700,-1*750);
  text(t4,500,-1*-750);
}
/*--------------------------------------button updates----------------------------------*/
  void updateButton(Button c){
    //resetButton
    if(c == resetButton){
      canMove = false;
      myLine.setAmp(amplitude);
      frequency = initFrequency;
      radius = initRadius;
      radiusSlider.boxX = 398;
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
  if (radiusSlider.canMove) {
    radiusSlider.boxX = mouseX;
    radius = ((mouseX-150)*(100)/(radiusSlider.maxBound-radiusSlider.minBound))+5;  //makes sure radius is between 5 and 100
  }
}
void mouseReleased(){
  draggable = false; 
}
//For changing frequency 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && frequency <= 2) {  //KeyEvent.VK_UP
      frequency+=0.1;      
      updateDots();
    } else if (keyCode == DOWN && frequency >= 0) {
      frequency-=0.1;
      updateDots();
    } else if (keyCode == RIGHT) {
      
      updateDots();
    } else if (keyCode == LEFT ) {
      
      updateDots();
    } 
  }
}
