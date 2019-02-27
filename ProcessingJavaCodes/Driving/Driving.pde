Car bmw;
boolean leftHeld, rightHeld, downHeld, upHeld = false;
void setup(){
  size(1500,1200);
 // fullScreen();
  bmw = new Car();
}

void draw(){
  background(0);
  translate(width/2, height/2);
  bmw.move();
  bmw.show();
}

void keyPressed(){
  if(key == 'w'){
    upHeld = true;
  }
  if(key == 'a'){
    leftHeld = true;
  }
  if(key == 's'){
    downHeld = true;
  }
  if(key == 'd'){
    rightHeld = true;
  }
}

void keyReleased(){
  if(key == 'w'){
    upHeld = false;
  }
  if(key == 'a'){
    leftHeld = false;
  }
  if(key == 's'){
    downHeld = false;
  }
  if(key == 'd'){
    rightHeld = false;
  }
}
