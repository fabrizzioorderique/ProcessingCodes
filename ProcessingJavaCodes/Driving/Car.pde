class Car{
  private float xpos,ypos,xspeed,yspeed,xacc,yacc,angle,anglespeed;
  private int xsize,ysize;
  Car(){
    xsize = 50;
    ysize = 100;
    angle = 0;
    anglespeed = PI/180;
    xpos = 0;
    ypos = 0;
    xspeed = 5;
    yspeed = 5;
    xacc = 0;
    yacc = 0;
    print("Car is at: ",xpos,ypos+" ");
  }
  Car(float xpos, float ypos){
    xsize = 50;
    ysize = 100;
    angle = 0;
    anglespeed = PI/180;
    this.xpos = xpos;
    this.ypos = ypos;
    xspeed = 5;
    yspeed = 5;
    xacc = 0;
    yacc = 0;
  }
  public void show(){
    fill(#03AA9B);
    ellipseMode(CENTER);
    rotate(angle);
    ellipse(xpos,ypos,xsize,ysize);
  }
  public void move(){
    if(upHeld){
      ypos-=yspeed;
    }
    if(leftHeld){
      //xpos-=xspeed;
      angle -=anglespeed;
    }
    if(downHeld){
      ypos+=yspeed;
    }
    if(rightHeld){
     //xpos+=xspeed;
      angle +=anglespeed;
    }
  }
  private boolean inBounds(){
    if(xpos+xsize > width || xpos-xsize < 0 || ypos+ysize > height || ypos-ysize < 0){
      return false;
    }else{
      return true;
    }
  }
  public PosPoint getPos(){
    PosPoint carPos = new PosPoint(xpos,ypos);
    return carPos;
  }
  
}
