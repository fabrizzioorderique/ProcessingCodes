Ball[] balls;

void setup() {
  size(600, 800);
  frameRate(100);
  balls = new Ball[5];
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}

void draw() {
  background(20);
  for(int i = 0; i < balls.length; i++){
    balls[i].show();
    balls[i].updateColor();
    balls[i].move();
  }
}
