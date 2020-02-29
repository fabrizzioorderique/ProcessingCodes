/*
 * Projectile Motion Simulation Lab
 *
 * @author Piero Orderique
 *
 * This program is to be used for educative purposes 
 * in applying kinematic equations to 2 dimensions by 
 * simulating projectile motion
 *
*/
Ball ball;
Basket goal;
float start, ms;
int currentTime;
int score = 0;
void setup() {
  size(1500, 900);
  ball = new Ball();
  goal = new Basket(255);
}

void draw() {
  background(20);
  ms = millis();
  currentTime = (int) (ms - start)/1000;
  translate(ball.r/2, height-ball.r/2);
  ball.showBall();
  goal.showBasket();
  ball.move();
  textSize(50);
  text("Score: " + score, ball.nWidthZero + 120, ball.nHeightZero +50);
  if(goalReached()){
    ball.canMove = false;
    textSize(40); 
    textAlign(CENTER);
    text("Goal Reached",ball.nWidthMax/2,ball.nHeightMax/2 - 30);
    textSize(25);
    text("(press space to reset)",ball.nWidthMax/2,ball.nHeightMax/2 - 5);
  }else if(currentTime >= 10){
    ball.canMove = false;
    textSize(40); 
    textAlign(CENTER);
    fill(255);
    text("Objective Failed",ball.nWidthMax/2,ball.nHeightMax/2 - 30);
    textSize(25);
    text("(press space to reset)",ball.nWidthMax/2,ball.nHeightMax/2 - 5);
  }else{
    textSize(50);
    text(currentTime, ball.nWidthZero + 1300, ball.nHeightZero +50);
    println(currentTime);
  }
}

void mousePressed(){
  ball.xVel = 0.05*ball.power.x;
  ball.yVel = 0.05*ball.power.y;
  ball.canMove = true;
  ball.canShowV = false;
}

void keyPressed(){
  if(keyCode == ENTER ){
    start = millis();
  } 
  if(keyCode == ' '){
    if(goalReached()){
      score++;
    }else{
      score = 0;
    }
    resetGame();
    start = millis();
  } 
}

boolean goalReached() {
  if(ball.x > (goal.x - goal.s) && ball.x < (goal.x + goal.s)){
    if(ball.y > (goal.y - goal.s) && ball.y < (goal.y + goal.s)){
        return true;
    }
  }
  return false;
}

void resetGame(){
  ball.x = ball.y = 0;
  ball.canMove = false;
  ball.canShowV = true;
  goal.x = random(ball.nWidthZero+200,ball.nWidthMax);
  goal.y= random(ball.nHeightZero,ball.nHeightMax);
}
