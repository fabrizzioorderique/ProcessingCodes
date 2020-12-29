/*
Simple Drawing View Program

Creates a grid where user can draw black+white pixel art.
Does not include basic features like color changer, etc.
It's a simple program that was made quickly to entertain a child I was babysitting.
*/

int GL_WIDTH = 8;
int GL_COLOR = 220;
int GL_SIZE = 50;

void setup(){
  //size(800,800);
  fullScreen();
  background(255);
}

void draw(){
  stroke(GL_COLOR);
  strokeWeight(GL_WIDTH);
  for(int row = 0; row*GL_SIZE < height; row++){line(0,row*GL_SIZE,width,row*GL_SIZE);}
  for(int col = 0; col*GL_SIZE < width; col++){line(col*GL_SIZE,0,col*GL_SIZE,height);}
}

void mouseClicked(){
  int currentColor = get(mouseX,mouseY); //returns -1 if white
  if(currentColor == -1){
    fillGrid(mouseX,mouseY,0);
  }else if(currentColor == -16777216){
    fillGrid(mouseX,mouseY,255);
  }
}

void mouseDragged(){fillGrid(mouseX, mouseY, 0);}

void fillGrid(float x, float y, color c){
  stroke(c);
  fill(c);
  rectMode(CENTER);
  int rectX = (int)(x/50)*50+25;
  int rectY = (int)(y/50)*50+25;
  rect(rectX,rectY,50-GL_WIDTH/2,50-GL_WIDTH/2);
}

void keyPressed(){
  if (keyCode == 'R'){
    background(255);
  }
}
