class PointCharge{
  final float k = 0.5;  //scaled k
  final float mass = 1;
  float mag, xPos,yPos,xVel,yVel,xAcc,yAcc;
  boolean canShow;
  float r, scaleFactor;
  
  PointCharge(float mag,float x, float y){
    this.mag = mag;
    xVel = yVel = xAcc = yAcc = 0;
    xPos = x;
    yPos = y;
    scaleFactor = mag/5 + 1;
    r = 50 + scaleFactor;
    canShow = false;
  }
  
  void showCharge(){
    if(canShow){
      stroke(255);
      strokeWeight(2);
      fill(#E5B63C);
      ellipse(xPos,yPos,r,r);
    }
  }
  
  void move(){
    xPos += xVel;
    yPos += yVel;
    xVel += xAcc;
    yVel += yAcc;
  }
  
  void calculateForce(PointCharge t){
    float xSign = 1;
    float ySign = 1;    
    if(t.xPos > xPos){xSign*=-1;}
    if(t.yPos < yPos){ySign*=-1;}
    float deltaX = Math.abs(t.xPos - xPos);
    float deltaY = Math.abs(t.yPos - yPos);
    //f=(kQq)/r^2=ma so **a = (kQq)/(mr^2)**
    xAcc = xSign*(k*mag*t.mag)/((float)(Math.pow(deltaX,2))*mass);
    yAcc = ySign*(k*mag*t.mag)/((float)(Math.pow(deltaY,2))*mass);
  }
}
