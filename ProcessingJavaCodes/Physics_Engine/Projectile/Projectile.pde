Ball ball;
void setup() {
  size(600, 800);
  frameRate(60);
  ball = new Ball();
}

void draw() {
  background(20);
  //println(mouseX);
  //println(mouseY); 
  pushMatrix();
    translate(ball.r/2, height-ball.r/2);
    ball.showBall();
    ball.move();
  popMatrix();
}

void mousePressed(){
  ball.v = 0.01*ball.power.mag();
  ball.angle = degrees(PVector.angleBetween(ball.power, ball.horizon));
  ball.power.x = ball.power.y = 0;
  ball.xVel = ball.v*cos(radians(ball.angle));
  ball.yVel = -1*ball.v*sin(ball.angle);
  println("vel: " + ball.v);
  println("angle: " + ball.angle);
  println("xVel: " + ball.xVel);
  println("yVel: " + ball.yVel);
  ball.canMove = true;
}
