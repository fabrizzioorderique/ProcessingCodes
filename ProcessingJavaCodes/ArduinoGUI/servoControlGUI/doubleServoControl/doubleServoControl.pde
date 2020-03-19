import processing.serial.*;
import controlP5.*;
Serial port;  //the Serial port object
ControlP5 cp5;
Knob panKnob, tiltKnob;
PFont buttonFont, titleFont;

void setup() {
   size(1200, 800); 
   port = new Serial(this, "COM5", 9600);  //i have connected arduino to com5
   cp5 = new ControlP5(this);
   titleFont = createFont("Georgia", 50);
   buttonFont = createFont("calibri", 28);
 //---------------------------------------------------------------------------
  //PAN KNOB
  panKnob = cp5.addKnob("panKnob") 
               .setRange(0,180)
               .setValue(90)
               .setPosition(70,550)
               .setRadius(100)
               .setDragDirection(Knob.HORIZONTAL)
               .setFont(buttonFont)  //changes BOTH number and caption sizes!
               .setCaptionLabel("PAN SERVO KNOB");
               ;
  //---------------------------------------------------------------------------
  //TILT KNOB
  tiltKnob = cp5.addKnob("tiltKnob") 
               .setRange(0,180)
               .setValue(90)
               .setPosition(400,550)
               .setRadius(100)
               .setDragDirection(Knob.HORIZONTAL)
               .setFont(buttonFont)  //changes BOTH number and caption sizes!
               .setCaptionLabel("TILT SERVO KNOB");
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
void panKnob(int theValue){
  port.write("a"+theValue);
}
void tiltKnob(int theValue){
  //we have to map twice (once here, once in aruino) to keep servo titles from 0 - 180 !
  int newVal = (int) map(theValue,0,180,200,300);  
  port.write("a"+newVal);
}
