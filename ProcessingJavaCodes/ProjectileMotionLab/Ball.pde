class Ball{
  PVector power, horizon;
  float x,y,xVel,yVel,g;
  float nWidthZero, nHeightZero, nWidthMax, nHeightMax;
  boolean canMove, canShowV;
  int r;  
  Ball(){
    r = 50;
    x = 0;
    y = 0;
    xVel = 0;
    yVel = 0;
    g = 1;
    horizon = new PVector(1,0);
    canMove = false;
    canShowV = true;
    nWidthZero = -r/2;
    nWidthMax = width - r/2;
    nHeightZero = -1*height + r/2;
    nHeightMax = r/2;
  }
  
  void showBall(){
    stroke(255);
    strokeWeight(2);
    fill(#E5B63C);
    ellipse(x,y,r,r);
  }
  
  void showVector(){
    if(canShowV){
      power = new PVector(mouseX+(-1*r/2),mouseY+(-1*(height-r/2)));
      stroke(255);
      strokeWeight(5);
      line(0,0,power.x,power.y);
    }
  }
  
  void move(){
    if(canMove){
      x += xVel;
      y += yVel;
      yVel += g;
  
      if (x < nWidthZero || x > nWidthMax) {
        xVel *= -0.999;
        }
      if (y < nHeightZero  || y > nHeightMax) {
        yVel *= -0.95;
        }
      }else{
      showVector();
    }
  }
}
