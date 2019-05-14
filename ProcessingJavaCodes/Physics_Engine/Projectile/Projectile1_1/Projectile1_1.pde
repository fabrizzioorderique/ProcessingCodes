PVector v = new PVector(100,100);
PVector horizon = new PVector(500,100);
PVector myVector = new PVector(0,0);
boolean show = false;
void setup(){
  size(1000,1000);
}

void draw(){
  background(20);
  if(show){
    stroke(255);
    strokeWeight(5);
    line(500,500,v.x,v.y);
    line(500,500,horizon.x,horizon.y);
  }
}

void mousePressed(){
  show = true;
  println("X: " + (mouseX), "Y: " + (mouseY));
  println(degrees(PVector.angleBetween(v,horizon)));
}
