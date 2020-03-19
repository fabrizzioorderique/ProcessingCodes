/* 
 *  controlP5 Examples
 *    
 *  This program is intended to showcase some of p5's features 
 *  and act as a reference for adding into other programs 
 *
 *  @author Piero Orderique
 *  @date March 15 2020
 */
//USE THIS TO PRINT OUT ALL METHODS OF A CLASS:
//ControlP5.printPublicMethodsFor(ControlP5.class)

//-----------------------------IMPORTS + GLOBALS-------------------------------
import controlP5.*;
import java.util.*;
ControlP5 cp5;
CheckBox checkbox;  //have to make an object for this one
Knob myKnobA, myKnobB;  //same for this one
PFont font;  
color hover = color(0, 230, 150);  //optional: choose a "hover" color
//int sliderValue = 100;
int checkBoxState = 0;
String checkBoxCap = "OFF";
int knobValue = 100;

//----------------------------------SETUP--------------------------------------
void setup(){
  //Init size and create object... ALWAYS:
  size(1200,800);
  cp5 = new ControlP5(this);
  font = createFont("calibri", 20);    //custom fonts + sizes for different things
  //---------------------------------------------------------------------------
  //Button
  cp5.addButton("myButton")
     .setPosition(50,140)
     .setSize(150,100)
     .setFont(font);
     ;
  //---------------------------------------------------------------------------
  //Scrollable List
  List l = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
  cp5.addScrollableList("myList")  //title
     .setPosition(350, 140)
     .setSize(300, 400)
     .setBarHeight(50)
     .setItemHeight(40)
     .addItems(l)
     .setFont(font);
     // .setType(ScrollableList.LIST) // List keeps the options "down" at all times
     ;
  //---------------------------------------------------------------------------
  //SWITCH: checkBox
  checkbox = cp5.addCheckBox("checkBox")
                .setPosition(100, 300)
                .setSize(70, 70)
                .addItem("23",0)
                ;
    //for changing font size and caption lable of checkbox
    checkbox.getItem(0).setCaptionLabel(checkBoxCap).setFont(font);
  //---------------------------------------------------------------------------
  //SLIDER
  cp5.addSlider("sliderValue")  //sliderValue can also just be declared as int!
     .setPosition(700,50)
     .setSize(60,200)  //invert width and height to get horizontal
     .setRange(0,255)
     .getValueLabel().setFont(font) //use this to change font size of caption
     //.setValue(3);
     ;
  //--------------------------------------------------------------------------- 
  //KNOBS
  myKnobA = cp5.addKnob("knob")  //needs a method since not declared as int
               .setRange(0,255)
               .setValue(50)
               .setPosition(900,70)
               .setRadius(100)
               .setDragDirection(Knob.VERTICAL)
               .setFont(font);  //changes BOTH number and caption sizes!
               ;
               
  //I created global int of the same name, therefore knobValue is stored as int everywhere                   
  myKnobB = cp5.addKnob("knobValue") 
               .setRange(0,255)
               .setValue(100)
               .setPosition(900,410)
               .setRadius(100)
               .setNumberOfTickMarks(10)  //automatically divides into equal sections
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.HORIZONTAL)
               .setFont(font);
               ;            
}

//-----------------------------------DRAW--------------------------------------
void draw(){
  textFont(font);
  background(ControlP5.BLACK);
  //for checkBox state 
  checkbox.getItem(0).setCaptionLabel(checkBoxCap);
  //CHANGES color of controllers if mouse is over any one of em
  if(cp5.isMouseOver()) {
    fill(hover);
  } else {
    fill(255);
  }
  ellipse(width-30,height-30,30,30);
}

//---------------------------FUNCTIONALITY METHODS-----------------------------
void myButton(){
  println("hello there");  
}
void myList(int n) {
  println(n);  //prints the position of array that you clicked
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkbox)) {
    println("general Kenobee");  //same thing everytime 
    //can also change states:
    checkBoxState++;
    if(checkBoxState%2==1){checkBoxCap = "ON";}
    else if(checkBoxState%2==0){checkBoxCap = "OFF";}
  }
}
void sliderValue(int n){
  println("slider at: " +n);
}
void knob(int theValue){
  println("a knob event. number at: "+theValue);
  //can do something here with that value
}
