import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.ArrayList; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Sine_Wave_Visualizer extends PApplet {

/**
*Oscillations Program
*this is an educative program to help teach students about the properties of sine graphs
*@author Piero Orderique
*@date January 03 2020
*
*To teach: y = asin(b(x+c))+d , ignoring c and d
*
*NOTE: All non personal methods such as mouseClicked() are all part of the open source
*      community libraries provdied by https://processing.org/
*/

ArrayList<Dot> dots = new ArrayList<Dot>(0);
float t = 0.0f;
float dt = 0.1f;
float amplitude = 100;
float frequency = 1.0f;
float initRadius = 40;
float radius = 40;
boolean canMove = false;
boolean draggable = false;
AmplitudeLine myLine = new AmplitudeLine(amplitude);
AmplitudeLine boundary = new AmplitudeLine(600);
Button moveButton = new Button(2600, 800, 200, 100, 0xff196E98, "Start");
Button resetButton = new Button(2600, -800, 200, 100, 0xffBC0606, "RESET");

public void setup(){
    
    //creates the initial, non moving dots 
    for(int i = 0; i < width/radius; i++){
      //x coor gets shifted, amplitudes start at different points 
      dots.add(new Dot(i*radius,myLine.getAmp()*sin(frequency*(t+i)),radius));
    }
}
public void draw(){
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
    displayInstructions();
    //displayInstructions();
    for(Dot d : dots){d.display();}
    //does not let amplitude fall below 0 or go above the boundary line
    if(draggable && mouseY-height/2 < radius*0.05f && 
       mouseY-height>-1*(height+0.2f*myLine.getH()+radius) && 
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
public void drawAxis(){
  strokeWeight(2);
  translate(0,0);
  stroke(255);
  line(width/2,height,width/2,boundary.getAmp()-220);
  line(0,height/2,width,height/2);
}
//adds a reference sine graph
public void addReference(){
  int rad = 20;
  for(int i = 0; i < width/rad+10; i++){
    ellipse(i*rad,myLine.getAmp()*sin(i*-5.822f),rad,rad);
  }
}
public void updateDots(){
  for(int i = 0; i < dots.size(); i++){
    dots.get(i).setRadius(radius);
    dots.get(i).setY(myLine.getAmp()*sin(frequency*(t+i)));
  }
}
public float roundFloat(float a){
  a *= 100;
  a = (int)a;
  a = (float)a;
  a/= 100;
  return a;
}
public void displayEquation(){
  String t = "Equation: y = "+myLine.getAmp()+"sin("+roundFloat(frequency)+"x)";
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(t, 1900, -1*800);
}
public void displayInstructions(){
  String t1 = "UP and DOWN arrows change radius size";
  String t2 = "LEFT and RIGHT changes the frequency";
  String t3 = "Drag the orange bar to change the amplitude";
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(t1,700 ,-1*900);
  text(t2,700,-1*825);
  text(t3,700,-1*750);
}
/*--------------------------------------button updates----------------------------------*/
  public void updateButton(Button c){
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
        c.text = "Start";
      }
    }
  }
/*--------------------------------------action methods----------------------------------*/
public void mouseClicked(){
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
public void mouseDragged(){
  //mouseY was translated to mouseY - height/2 due to matrix translations
  //this makes sure that the mouse is within the rectangle boundaries before being dragged
  if(mouseY-height/2<-1*(myLine.getAmp()+radius/2) && 
     mouseY-height/2<-1*(myLine.getAmp()+radius/2+myLine.getH())){
    draggable = true;
  }
  //adjusts the heights of the dots based on where user drags myLine
  updateDots();
}
public void mouseReleased(){
  draggable = false;
}
//For changing frequency
public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && radius <= 100) {  //KeyEvent.VK_UP
      radius += 5;
      updateDots();
    } else if (keyCode == DOWN && radius >= 10) {
      radius -= 5;
      updateDots();
    } else if (keyCode == RIGHT && frequency <= 2) {
      frequency+=0.1f;
      updateDots();
    } else if (keyCode == LEFT && frequency >= 0) {
      frequency-=0.1f;
      updateDots();
    } 
  }
}
class AmplitudeLine{
  private float amplitude;
  private float h = 15; //the height, or "thickness" of the rectangular line
  private int col = 0xffFF9B17;
  //Constructor default sets amplitude to 100
  AmplitudeLine(){
    amplitude = 100;
  }
  //General constructor
  AmplitudeLine(float amp){
    amplitude = amp;
  }
  //shows the amplitude line
  public void display(){
    strokeWeight(2);
    stroke(col);
    fill(col);
    //line(0,-1*(amplitude+radius/2),width,-1*(amplitude+radius/2));
    rectMode(CENTER);
    rect(0,-1*(amplitude+radius/2+h/2),2*width,h);
  }
  //getters and setters (and changers)
  public float getAmp(){return amplitude;}
  public float getH(){return h;}
  public void setAmp(float a){amplitude = a;}
  public void setColor(int c){col = c;}
  public void changeAmp(float dh){amplitude+=dh;}

}
class Button{
  private float xpos, ypos, w, h;
  private int col;
  int state = 1;
  String text;
  //Constructor default sets amplitude to 100
  Button(){
    xpos = 0;
    ypos = 500;
    w = 100;
    h =100;
    col = 0xff196E98;
    text = "Test Button";
  }
  //General constructor
  Button(float x, float y, float w, float h, int c, String text){
     xpos = x;
     ypos = y;
     this.w = w;
     this.h = h;
     col = c;
     this.text = text;
  }
  //displays the Button
  public void display(){
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
  public boolean mouseOver() {
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
  public float getH(){return h;}
  public void setColor(int c){col = c;}
  public void setTextSize(int size){textSize(size);}
}
class Dot {
  private float xpos, ypos, radius;
  //default constructor
  Dot(){
    xpos = 0;
    ypos = 0;
    radius = 50;
  } 
  //specific constructor
  Dot(float xpos, float ypos, float radius){
    this.xpos = xpos;
    this.ypos = ypos;
    this.radius = radius;
  }
  //methods
  public void display(){
    strokeWeight(2);
    stroke(255);
    fill(255);
    ellipse(xpos,ypos,radius,radius);
  }
  //getter and setter methods and changers
  public float getX(){return xpos;}
  public float getY(){return ypos;} 
  public float getRadius(){return radius;}
  public void setX(float xpos){this.xpos = xpos;}
  public void setY(float ypos){this.ypos = ypos;}
  public void setRadius(float radius){this.radius = radius;}
  public void changeY(float amount){ypos += amount;}
}
  public void settings() {  size(3000,2000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sine_Wave_Visualizer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
