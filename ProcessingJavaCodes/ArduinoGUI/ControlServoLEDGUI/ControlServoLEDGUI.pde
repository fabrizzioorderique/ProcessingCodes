/*
 *  Servo and LED control GUI 
 *  @author Piero Orderique
 *
 *  Used to control servo motor position, LED states, and flickering
 */
 
import controlP5.*;
import processing.serial.*;

Serial port;
ControlP5 cp5; 
CheckBox checkbox;
Knob servoKnob;
int redBoxState = 0, yellowBoxState = 0, greenBoxState = 0; 
String redBoxCap = " RED OFF", yellowBoxCap = " YEllOW OFF", greenBoxCap = " GREEN OFF";
PFont buttonFont, titleFont;

void setup(){
  size(1200, 800);  
  //printArray(Serial.list());   //prints all available serial ports
  port = new Serial(this, "COM5", 9600);  //i have connected arduino to com5
  cp5 = new ControlP5(this);
  titleFont = createFont("Georgia", 50);
  buttonFont = createFont("calibri", 28);   
  //---------------------------------------------------------------------------
  //LED SWITCHES
  checkbox = cp5.addCheckBox("redBox")
                .setPosition(100, 180)
                .setSize(70, 70)
                .setItemsPerRow(1)
                .setSpacingColumn(30)
                .setSpacingRow(20)
                .addItem(redBoxCap, 0)
                .addItem(yellowBoxCap, 0)
                .addItem(greenBoxCap, 0)           
                ;
    checkbox.getItem(0).setCaptionLabel(redBoxCap).setFont(buttonFont);
    checkbox.getItem(1).setCaptionLabel(yellowBoxCap).setFont(buttonFont);
    checkbox.getItem(2).setCaptionLabel(greenBoxCap).setFont(buttonFont);
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
  //---------------------------------------------------------------------------
  //GO CRAZY BUTTON
  cp5.addButton("GoCrazy")
     .setPosition(width-200,height-150)
     .setSize(150,100)
     .setFont(buttonFont);
     ;
}

void draw(){ 
  background(ControlP5.BLACK);
  fill(#65CBB1);  //turquioseish   
  textAlign(CENTER);
  textFont(titleFont);
  text("ARDUINO MAINFRAME", width/2, 60);
  fill(255);
  textFont(buttonFont);
  text("LED CONTROL", 150, 150);
  if(cp5.isMouseOver()) {
    fill(#65CBB1);
  } else {
    fill(255);
  }
  ellipse(width-40,40,40,40);
}

//-------------------------------- FUNCTIONALITY ------------------------------------
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkbox)) {
    println(checkbox.getArrayValue());
    for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
      if(n==0 && i ==0){checkbox.getItem(i).setCaptionLabel(" RED OFF");}
      if (n==1 && i==0){checkbox.getItem(i).setCaptionLabel(" RED ON");}
      if(n==0 && i ==1){checkbox.getItem(i).setCaptionLabel(" YELLOW OFF");}
      if (n==1 && i==1){checkbox.getItem(i).setCaptionLabel(" YELLOW ON");port.write("b"+503);}
      if(n==0 && i ==2){checkbox.getItem(i).setCaptionLabel(" GREEN OFF");}
      if (n==1 && i==2){checkbox.getItem(i).setCaptionLabel(" GREEN ON");}
    }
  }
}
void servoKnob(int theValue){
  port.write("a"+theValue);
}
void GoCrazy(){
  port.write("666");  //only works if I send as a String (or char), and parse as int in Arduino 
  println("Go crazy: 666");
}
