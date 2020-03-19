import processing.serial.*;
import controlP5.*;
Serial port;  //the Serial port object
ControlP5 cp5;
Knob servoKnob;
PFont buttonFont, titleFont;

void setup() {
   size(1200, 800); 
   port = new Serial(this, "COM5", 9600);  //i have connected arduino to com5
   cp5 = new ControlP5(this);
   titleFont = createFont("Georgia", 50);
   buttonFont = createFont("calibri", 28);
 //---------------------------------------------------------------------------
  //SERVO KNOB
  servoKnob = cp5.addKnob("servoKnob") 
               .setRange(0,180)
               .setValue(50)
               .setPosition(70,550)
               .setRadius(100)
               .setDragDirection(Knob.HORIZONTAL)
               .setFont(buttonFont)  //changes BOTH number and caption sizes!
               .setCaptionLabel("SERVO KNOB");
               ;
}

void draw() {
  background(ControlP5.BLACK);
  fill(#65CBB1);  //turquioseish   
  textAlign(CENTER);
  textFont(titleFont);
  text("ARDUINO MAINFRAME", width/2, 60);
  fill(255);
  textFont(buttonFont);
}
void servoKnob(int theValue){
  port.write("a"+theValue);
}
