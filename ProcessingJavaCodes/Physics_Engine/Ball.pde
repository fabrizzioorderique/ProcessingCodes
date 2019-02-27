class Ball {
  Physics phy;
  private float r;
  private float xpos;
  private float ypos;
  private float dx, dy;
  public float vX, vY;
  public float a;
  Ball() {
    phy = new Physics(0, 0);
    vX = 0;
    vY = 0;
    a = phy.g;
    r = random(40, 100);
    xpos = random(r, width - r);
    ypos = random(r, height - r);
    print(xpos, ypos);
  }
  Ball(float x, float y) {
    phy = new Physics(0, 0);
    vX = vY = 0;
    a = phy.g;
    r = 40;
    xpos = x;
    ypos = y;
    print(xpos, ypos);
  }
  public void fall() {
    if (ypos < height) {
      vY -= phy.g;
      vX += phy.aX;
    } else {
      vY += phy.g/2;
      vX += phy.aX;
    }
    ypos -= vY;
    xpos += vX;
  }
  public float getX() {
    return xpos;
  }
  public float getY() {
    return ypos;
  }
  public void show() {
    fill(#E86A54);
    ellipse(xpos, ypos, r, r);
  }
}
