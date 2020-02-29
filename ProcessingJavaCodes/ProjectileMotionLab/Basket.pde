class Basket{
  float x;
  float y;
  float s;
  color c;
  
  Basket(color c){
    x = random(ball.nWidthZero+200,ball.nWidthMax);
    y= random(ball.nHeightZero,ball.nHeightMax);
    s = 50;
    this.c = c;
  }
  
  void showBasket(){
    fill(c);
    rectMode(CENTER);
    rect(x,y,s,s);
  }
}
