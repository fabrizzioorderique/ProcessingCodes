class Basket{
  float x = random(ball.nWidthZero+200,ball.nWidthMax);
  float y= random(ball.nHeightZero,ball.nHeightMax);
  float s = 50;
  
  void showBasket(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,s,s);
  }
}
