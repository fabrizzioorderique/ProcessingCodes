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
  public void changeX(float amount){xpos += amount;}
  public void changeY(float amount){ypos += amount;}
}
