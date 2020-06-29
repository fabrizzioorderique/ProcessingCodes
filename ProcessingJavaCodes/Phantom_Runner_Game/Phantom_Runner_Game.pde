/**
 * Phantom Runner
 * 
 * Simple runner game much like Google's 
 * T-Rex Runner game but with a twist!
 *
 * Ideas: Shadow Ability that makes you invinsible
 *        for t seconds. After T seconds, you enter new level
 *        (shown in fading in/out text on top of screen) and speeds get faster and colors change.
 */
Character player;

ArrayList<ObstacleBar> obstacles;
float barSpeed;
float barDistance;

int bgColor;
int floorColor;
float floorHeight;

//jumping mechanics variables
boolean jumping;
boolean goingUp;
float yOffset;
float topBoundaryHeight;
float topBoundary;
boolean showBoundary = true; //for testing

//collision detection
boolean collided;

void setup() {
  size(1200, 600);
  surface.setTitle("Phantom Runner");
  surface.setResizable(true);
  surface.setLocation(700, 900);

  player = new Character(90, 0.3*height);

  bgColor = #FFFFFF;
  floorColor = #000000;
  floorHeight = player.getY();

  //init jumping variables
  jumping = false;
  goingUp = true;
  yOffset = 10.00;
  topBoundaryHeight = 200;
  topBoundary = (int) player.getOgY()+topBoundaryHeight;

  //obstacles
  barSpeed = 10;
  barDistance = 600;
  obstacles = new ArrayList();
  for (int i = 0; i < 5; i++) {
    obstacles.add(new ObstacleBar(width+i*barDistance, player.getOgY(), random(0.5*player.getHeight(), 0.65*topBoundaryHeight)));
  }

  //collision
  collided = false;
}
void draw() {    
  background(bgColor);

  //draw floor
  fill(floorColor);
  rectMode(CORNER);
  rect(0, height-floorHeight, width, floorHeight);

  //draw character + bar
  player.show();
  for (ObstacleBar b : obstacles) {
    b.show();
  }

  //shows boundary line for testing (
  if (showBoundary) {
    stroke(100); 
    line(0, topBoundary-topBoundaryHeight, width, topBoundary-topBoundaryHeight);
  }
  //only move if not collided
  if (!collided) {
    //updates position based on if character is jumping
    if (jumping) {
      if (player.getY() < topBoundary && goingUp) {
        player.changeY(yOffset);
      } else if (!player.onGround()) {
        goingUp = false;
        player.changeY(-yOffset);
      } else {
        goingUp = true;
        jumping = false;
      }
    }
    //moves obstacles
    for (ObstacleBar b : obstacles) {
      b.changeX(-barSpeed);
    }
    //checks for out of page obstacles
    float xthreshold = 0-obstacles.get(0).getWidth();
    if (obstacles.get(0).getX()< xthreshold) {
      obstacles.remove(0);
      obstacles.add(new ObstacleBar(obstacles.get(obstacles.size()-1).getX()+barDistance, player.getOgY(), random(0.5*player.getHeight(), 0.7*topBoundaryHeight)));
    }
    //checks for collision
    for (ObstacleBar b : obstacles) {
      if (player.getX()-b.getX() > 0 && player.getY()-player.getHeight() < b.getY()) {
        collided = true;
      }
    }
  }
}
void keyPressed() {
  float yOffset = 30.00;
  if (key == ' ') {
    if (jumping) {
    } else {
      jumping = true;
      player.changeY(yOffset);
    }
  } 
  if (key == CODED) {
    if (keyCode == UP) {
      //only jump if on ground!
      player.changeY(yOffset);
    } else if (keyCode == DOWN) {
      player.changeY(-yOffset);
    }
  }
}

void mouseClicked() {
  print("click!");
  collided = false;
}
