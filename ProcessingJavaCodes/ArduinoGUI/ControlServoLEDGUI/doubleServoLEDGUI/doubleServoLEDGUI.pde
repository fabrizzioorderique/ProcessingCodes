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
  //TABS
  stroke(0);
  cp5.getTab("default")
     .activateEvent(true)
     .setLabel("MAINFRAME")
     .setHeight(50)
     .setWidth(200)
     .getCaptionLabel()
     .setFont(buttonFont)
     ;
  cp5.addTab("ledTab")
     .setColorBackground(color(#144DC4))
     .setLabel("LED TAB")
     .setHeight(50)
     .setWidth(200)
     .setColorLabel(color(255))
     .setColorActive(color(#3184C1))
     .getCaptionLabel()
     .setFont(buttonFont)
     ;
  //---------------------------------------------------------------------------
  //SERVO KNOBS
  stroke(255);
  panKnob = cp5.addKnob("panKnob") 
               .setRange(0,180)
               .setValue(90)
               .setPosition(70, 170)
               .setRadius(250)
               .setDragDirection(Knob.HORIZONTAL)
               .setFont(buttonFont)  //changes BOTH number and caption sizes!
               .setCaptionLabel("PAN SERVO KNOB");
               ;
  tiltKnob = cp5.addKnob("tiltKnob") 
               .setRange(0,180)
               .setValue(90)
               .setPosition(width-570,170)
               .setRadius(250)
               .setDragDirection(Knob.HORIZONTAL)
               .setFont(buttonFont)  //changes BOTH number and caption sizes!
               .setCaptionLabel("TILT SERVO KNOB");
               ;  
  //---------------------------------------------------------------------------
  //LED TOGGLE SWITCHES
  cp5.addToggle("redToggle")
     .setPosition(40,250)
     .setSize(200,60)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setLabel("RED LED")
     .setFont(buttonFont)
     ;
  cp5.addToggle("yellowToggle")
     .setPosition(440,250)
     .setSize(200,60)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setLabel("YELLOW LED")
     .setFont(buttonFont)
     ;
  cp5.addToggle("greenToggle")
     .setPosition(840,250)
     .setSize(200,60)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setLabel("GREEN LED")
     .setFont(buttonFont)
     ;
  //---------------------------------------------------------------------------
  cp5.getController("redToggle").moveTo("ledTab");
  cp5.getController("yellowToggle").moveTo("ledTab");
  cp5.getController("greenToggle").moveTo("ledTab");
}

void draw() {
  background(ControlP5.BLACK);
  fill(#65CBB1);  //turquioseish   
  textAlign(CENTER);
  textFont(titleFont);
  text("ARDUINO MAINFRAME", width/2, 120);
  fill(255);
  textFont(buttonFont);
  showHoverFeedback();  //shows the colored circle is hovered over a control 
}
void panKnob(int theValue){
  int panValue = (int) map(theValue,0,180,2001,3000);  
  port.write("a"+panValue);
}
void tiltKnob(int theValue){
  int tiltValue = (int) map(theValue,0,180,3001,4000);  
  port.write("a"+tiltValue);
}
void redToggle(boolean state) {
  //state is flipped for some reason
  if(state==true) {port.write('2');} else {port.write('3');}
}
void yellowToggle(boolean state) {
  if(state==true) {port.write('4');} else {port.write('5');}
}
void greenToggle(boolean state) {
  if(state==true) {port.write('6');} else {port.write('7');}
}
void showHoverFeedback(){
  if(cp5.isMouseOver()) {fill(#65CBB1);}
  else{fill(255);}
  ellipse(width-40,40,40,40);
}
