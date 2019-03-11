/**
*Oscillations Program
*this is just to play around with sinx
*@author Piero Orderique
*/
import java.util.*;

Random rand = new Random();
float x = 0;
double g = 0;
Bar[] bars;

void setup(){
  //size(5000,800);
  fullScreen();
  frameRate(60);
  bars = new Bar[floor(width/60) + 1];
  for(int i = 0; i < bars.length; i++){
    bars[i] = new Bar(i*50,0);
    bars[i].col = (int) (255/(255*i*sin(x)) + i*3);
  }
}
void draw(){
  background(0);
  translate(50,height/2);
  for(int i = 0; i < bars.length; i++){
    bars[i].display();
  } 
  for(int i = 1; i <= bars.length; i++){
    bars[i-1].setH(250*cos(x)/50*i+25);
  }  
  //g = rand.nextGaussian();
  x+=0.05;
}
