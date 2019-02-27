class Physics {
  public final float g = 9.8;
  public float xpos, ypos, dx, dy, voX, voY, vX,vY, t,aX;
  Physics(float xVel, float yVel) {
    voX = xVel;
    voY = yVel;
  }
  public float getDx(float vo, float t, float a) {
    float answer = vo * t;
    answer += 0.5*a*t*t;
    return answer;
  }
  public float getDx(float dvsquared, float a) {
    return dvsquared / (2*a);
  }
  public float getVo(float dx, float a, float t) {
    float answer = dx - (0.5*a*t*t);
    answer /= t;
    return answer;
  }
  public float getV(float vo, float a, float t) {
    return vo+ a*t;
  }
  public float getA(float dx, float vo, float t) {
    float answer = dx - (vo*t);
    answer /= t;
    return answer;
  }
  public float getT(float dx, float vo, float a) {
    float answer = dx/(vo + 0.5*a);
    return answer;
  }
  public float getT(float dv, float a) {
    return dv/a;
  }
  public float getDv(float a, float t) {
    return a*t;
  }
  public float getDvSquared(float a, float dx) {
    return a*dx;
  }
}
