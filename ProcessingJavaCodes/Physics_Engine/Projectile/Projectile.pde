Ball ball;
Basket goal;
void setup() {
  size(3000, 1800);
  //fullScreen();
  //frameRate(500);
  ball = new Ball();
  goal = new Basket();
}

void draw() {
  background(20);
  //println(mouseX);
  //println(mouseY); 
  pushMatrix();
    translate(ball.r/2, height-ball.r/2);
    ball.showBall();
    goal.showBasket();
    ball.move();
  popMatrix();
  if(goalReached()){
    ball.canMove = false;
    textSize(50);
    textAlign(CENTER);
    text("Game Finished",width/2,height/2);
  }
}

void mousePressed(){
  ball.xVel = 0.05*ball.power.x;
  ball.yVel = 0.05*ball.power.y;
  println("powerX: " + ball.power.x);
  println("powerY: " + ball.power.y);
  println("xVel: " + ball.xVel);
  println("yVel: " + ball.yVel);
  ball.canMove = true;
  ball.canShowV = false;
}

boolean goalReached() {
  if(ball.x > (goal.x - goal.s) && ball.x < (goal.x + goal.s)){
    if(ball.y > (goal.y - goal.s) && ball.y < (goal.y + goal.s)){
        return true;
    }
  }
  return false;
}
