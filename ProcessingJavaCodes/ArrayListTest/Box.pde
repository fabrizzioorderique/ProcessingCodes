class Box {
  private float x, y, w, h;
  Box(float X, float Y){
    w = 50;
    h = 50;
    x = X;
    y = Y;
  }
    public void show() {
    fill(30, 75, 160);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
