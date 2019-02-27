//ArrayList<Ball> balls = new ArrayList<Ball>();
Ball ball;
void setup() {
  textAlign(CENTER);
  textSize(100);
  frameRate(10);
  //fullScreen();
  size(800, 800);
  ball = new Ball(100,100);
}

void draw() {
   background(#54A9E8);
   ball.show();
   ball.fall();
}

void keyPressed(){
  if(key == 'w'){
    fill(255);
    stroke(255);
    text("Julianna is a HoE",width/2,height/2);
  }
}
