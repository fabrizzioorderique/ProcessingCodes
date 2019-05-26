int a = 0; 
int b = 0;
int c = 0;

void setup(){
  //size(2500,2000);
  fullScreen();
}

void draw(){
  background(a,b,c);
  textSize(150);
  stroke(255);
  textAlign(CENTER);
  translate(width/2,height/2);
text("Virus detected... Hard RESET in progress",0,0);
}
