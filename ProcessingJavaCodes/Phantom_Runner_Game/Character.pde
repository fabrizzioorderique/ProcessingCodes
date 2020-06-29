class Character{
  private boolean inShadowMode;
  private float xpos, ypos;
  private float ogX, ogY;
  private int characterColor;
  private float wdth, hgt;
  
  public Character(float x, float y){
    x = Float.parseFloat(nf(x, 0, 2));
    y = Float.parseFloat(nf(y, 0, 2));
    xpos = x;
    ypos = y;
    ogX = x;
    ogY = y;
    characterColor = #FF0000;
    wdth = 20;
    hgt = 50;
  }
  
  //show character
  public void show(){
    fill(characterColor);
    rectMode(CORNER);
    rect(xpos,height-ypos-hgt, wdth, hgt);
  }
  
  //returns whether or not character is on/under ground
  public boolean onGround(){
    return Float.parseFloat(nf(height-ypos-hgt, 0, 2)) == Float.parseFloat(nf(height-ogY-hgt, 0, 2));
  }
  
  //getters and setters
  public float getX(){ return Float.parseFloat(nf(xpos, 0, 2)); } //returns 2 decimal places
  public float getY() { return Float.parseFloat(nf(ypos, 0, 2)); }
  public float getHeight() { return hgt; }
  public float getWidth() { return wdth; }
  public float getOgX(){ return Float.parseFloat(nf(ogX, 0, 2)); } //returns 2 decimal places
  public float getOgY() { return Float.parseFloat(nf(ogY, 0, 2)); }
  public void setX(float x){ xpos = x; }  
  public void setY(float y){ ypos = y; }
  
  public void changeX(float x){ xpos += x; }  
  public void changeY(float y){ ypos += y; }
}
