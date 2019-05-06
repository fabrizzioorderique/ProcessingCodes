float x = 150;
float y = 100;
float xSpeed = 50;
float ySpeed = 40;

void setup() {
  size(3000, 1500);
  frameRate(100);
}

void draw() {
  background(20);
  ellipse(x, y, 25, 25);

  x += xSpeed;
  y += ySpeed;
  
  if (x < 0 || x > width) {
    xSpeed *= -1;
  }

  if (y < 0  || y > height) {
    ySpeed *= -1;
  }
}
