//NOTE: This code was copied from the Processing exmaples folder intended for 
//open source use and then was modified to fit needs of the program
class Slider {
  
  int x, y;
  int boxX, boxY;
  int size;
  boolean canMove;
  int minBound, maxBound;
  
  Slider(int ix, int iy, int is) {
    x = ix;
    y = iy;
    size = is;
    boxX = x+298 + size/2;
    boxY = y;
    minBound = x+size;
    maxBound = x+size+700;
  }
  
  void update() {
    if (overRect() && inBounds() && mousePressed) {
      canMove = true;
    }else{
      canMove = false;
    }
  }
  
  void display() {
    line(x, y, boxX-size/2, boxY);  //slider line from node to handle
    fill(255);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(x,y,20,20);
    rectMode(CENTER);
    rect(boxX, boxY, size, size);
  }
  
  //checks to see if the mouse is over the slider handle
  boolean overRect() {
    if (mouseX >= boxX-size/2 && mouseX <= boxX+size/2 && 
      mouseY >= boxY-size/2 && mouseY <= boxY+size/2) {
      return true;
    } else {
      return false;
    }
  }
  
  //makes sure that the sldier cannot be dragged past its limits
  boolean inBounds(){
    if(mouseX>=minBound && mouseX<=maxBound)
      return true;
    return false;
  }
  
}
