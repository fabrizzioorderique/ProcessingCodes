ArrayList<Box> boxes;
void setup(){
  fullScreen();
  boxes = new ArrayList<Box>();
}
void draw(){
  background(0);
  if(mousePressed){
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }
  for(Box b: boxes){
    b.show();
  }
}
