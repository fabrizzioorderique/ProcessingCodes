class Bar{
  private float xpos, ypos, w, h;
  private int col;
  Bar(){
    xpos = ypos = 0;
    w = 50;
  }
  Bar(float xpos, float ypos){
    this.xpos = xpos;
    this.ypos = ypos;
    fill(col);
    w = 50;
  }
  public void setH(float h){
    this.h = h;
  }
  public void display(){
    fill(120,100,col);
    rectMode(CENTER);
    rect(xpos, ypos, w, h);
  }
}
