class ObstacleBar{
  private float xpos, ypos;
  private float ogX, ogY;
  private int barColor;
  private float wdth, hgt;
  
  public ObstacleBar(float x, float y){
    x = Float.parseFloat(nf(x, 0, 2));
    y = Float.parseFloat(nf(y, 0, 2));
    xpos = x;
    ypos = y;
    ogX = x;
    ogY = y;
    barColor = #0000FF;
    wdth = 20;
    hgt = 60;
  }
  
  public ObstacleBar(float x, float y, float h){
    x = Float.parseFloat(nf(x, 0, 2));
    y = Float.parseFloat(nf(y, 0, 2));
    xpos = x;
    ypos = y;
    ogX = x;
    ogY = y;
    barColor = #0000FF;
    wdth = 20;
    hgt = h;
  }
  
  //show character
  public void show(){
    fill(barColor);
    rectMode(CORNER);
    rect(xpos,height-ypos-hgt, wdth, hgt);
  }
  
  //getters and setters
  public float getX(){ return Float.parseFloat(nf(xpos, 0, 2)); } //returns 2 decimal places
  public float getY() { return Float.parseFloat(nf(ypos, 0, 2)); }
  public float getOgX(){ return Float.parseFloat(nf(ogX, 0, 2)); } //returns 2 decimal places
  public float getOgY() { return Float.parseFloat(nf(ogY, 0, 2)); }
  public float getWidth() { return wdth; }
  public void setX(float x){ xpos = x; }  
  public void setY(float y){ ypos = y; }
  
  public void changeX(float x){ xpos += x; }  
  public void changeY(float y){ ypos += y; }
}
