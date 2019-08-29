class Shape{
  int nodes;
  Vertex p1,p2,p3,p4;
  Shape(int n){
    nodes = n;
    if(nodes==3){
      p1 = new Vertex(0,-300);
      p2 = new Vertex(-220,180);
      p3 = new Vertex(220,180);
    }
    if(nodes==4){
      p1 = new Vertex(200,-200);
      p2 = new Vertex(200,200);
      p3 = new Vertex(-200,200);
      p4 = new Vertex(-200,-200);
    }
  }
  void display(){
    if(nodes==3){
      noFill();
      beginShape();
      vertex(0,-300);
      vertex(-220,180);
      vertex(220,180);
      vertex(0,-300);
      endShape();
    }else if(nodes==4){
      noFill();
      beginShape();
      vertex(200,-200);
      vertex(200,200);
      vertex(-200,200);
      vertex(-200,-200);
      vertex(200,-200);
      endShape();
    }
  }
}
