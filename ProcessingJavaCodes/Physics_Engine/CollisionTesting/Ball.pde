public class Ball{
    float x;
    float y;
    float xVel;
    float yVel;
    int r;  
    int red;
    
  Ball(){
    x = width/2;
    y = height;
    xVel = random(10,20);
    yVel = random(10,50);
    r = 50;
    red = 0;
  }
  
  void show(){
    fill(red,0,255);
    ellipse(x,y,r,r);
  }
  
  void move(){
    x += xVel;
    y += yVel;
  
  if (x < 0 || x > width) {
    xVel *= -1;
    }
  if (y < 0  || y > height) {
    yVel *= -1;
    }
  }
  
  void updateColor(){
    if(collided()){
      red+=10;
    }
  }
  
  boolean collided(){
  if (x < 0 || x > width || y < 0  || y > height) {
    return true;
  }else{
    return false;
    }
  }
}
