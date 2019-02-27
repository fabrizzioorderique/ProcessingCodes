class MyCharacter {
  int xpos;
  int ypos;
  int xspeed;
  int yspeed;
  int midX = 50;
  int midY = 50;
  MyCharacter() {
    xpos = midX +((100) * ((int) random(1, 10)));
    ypos = midY +((100) * ((int) random(1, 10))); 
    xspeed = 100;
    yspeed = 100;
    println(midX, midY);
    println("initial position: ", xpos, " ", ypos);
    println("intital speeds: ", xspeed, " ", yspeed);
  }
  void show() {
    rectMode(CENTER);
    fill(#280C48);
    rect(xpos, ypos, width/gridSize[0].length, height/gridSize.length);
  }

  void move() {
    if (key == 'w') {
      ypos-=yspeed;
    } else if
      (key == 's') {
      ypos+=yspeed;
    } else if
      (key == 'a') {
      xpos-=xspeed;
    } else if 
      (key == 'd') {
      xpos+=xspeed;
    }
  }
}
