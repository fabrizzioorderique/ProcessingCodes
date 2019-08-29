/**
 *  Chaos Unlimited
 *
 *  My own attempt at replicating the chaos game with
 *  resizable nodes and maybe colors?
 *
 *  @author fabri
 *  @date 30 July 2019
 */
 
import java.util.*;
color chosenColor, rColor, bColor, gColor;
PVector horizon, mouse, center;
float a;
float xpos, ypos;
Shape[] myShapes;

void setup(){
  size(800,650);
  frameRate(120);
  rColor = color(#E31919);
  bColor = color(#2A6BD8);
  gColor = color(#2AD86E);
  horizon = new PVector(1,0);
  myShapes = new Shape[2];
  for(int i = 0;i < myShapes.length;i++){
    myShapes[i] = new Shape(i+3);
  }
  xpos = ypos = 0;
  background(bColor);
}

void draw(){
  translate(width/2,height/2);
  mouse = new PVector(mouseX, mouseY);
  center = new PVector(width/2,height/2);
  stroke(255);
  //line(0,0,horizon.x,horizon.y);
  //line(0,0,mouse.x,mouse.y);
  
  a = degrees(PVector.angleBetween(mouse,horizon));
  myShapes[1].display();
  beginChaos(3);
}

void beginChaos(int n){
  int r = 1;
  int rand = floor(random(1,n+1));
  fill(255);
  if(rand == 1){
    xpos = (xpos+myShapes[n-3].p1.x)/2;
    ypos = (ypos+myShapes[n-3].p1.y)/2;
    ellipse(xpos,ypos,r,r);
  }
  if(rand == 2){
    xpos = (xpos+myShapes[n-3].p2.x)/2;
    ypos = (ypos+myShapes[n-3].p2.y)/2;
    ellipse(xpos,ypos,r,r);
  }
  if(rand == 3){
    xpos = (xpos+myShapes[n-3].p3.x)/2;
    ypos = (ypos+myShapes[n-3].p3.y)/2;
    ellipse(xpos,ypos,r,r);
  }
  if(rand == 4){
    xpos = (xpos+myShapes[n-3].p4.x)/2;
    ypos = (ypos+myShapes[n-3].p4.y)/2;
    ellipse(xpos,ypos,r,r);
  }
}

void mousePressed(){
  print(a);
  print(" ");
  beginChaos(3);
}
