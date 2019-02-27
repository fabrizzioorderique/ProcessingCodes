MyCharacter mitchell = new MyCharacter();
int textSize = 50;
int[][] gridSize = new int[10][10];
boolean gameOver = false;    
int tempX;
int tempY;

void setup() {
  frameRate(5);
  size(1000, 1000);
  textAlign(CENTER);
  textSize(textSize);
}

void draw() {
  background(#37A6DB);
  fill(255);
  //text("Move character around using WASD keys", width/2, 5*textSize/6);
  drawGrid();
  do {
    mitchell.move();
    mitchell.show();
    println(mitchell.xpos, mitchell.ypos);
    if (mitchell.xpos>1000 || mitchell.xpos<0) {
      mitchell.xpos = tempX;
      mitchell.ypos = tempY;
      mitchell.xspeed = 0;
      mitchell.yspeed = 0;
      gameOver = !gameOver;
    }else if(mitchell.ypos>1000 || mitchell.ypos<0){
      mitchell.xpos = tempX;
      mitchell.ypos = tempY;
      mitchell.xspeed = 0;
      mitchell.yspeed = 0;
    }
    tempX = mitchell.xpos;
    tempY = mitchell.ypos;
  }while(gameOver);
}

//in the form [row][col], creates a grid
void drawGrid() {
  stroke(0);
  strokeWeight(5);
  for (int w=0; w<=width; w+=width/(gridSize[0].length)) {
    line(w, 0, w, height);
  }
  for (int h=0; h<=height; h+= height/(gridSize.length)) {
    line(0, h, width, h);
  }
}
