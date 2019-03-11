import java.util.Random;
int h = 50;
double g;
Random rand = new Random();
void setup(){
  size(800,800);
  background(255);
}
void draw(){
  g = 100 * rand.nextGaussian() + 1;
  translate(width/2,height/2);
  fill(5);
  line((float)g,0,(float)g,100);
}
