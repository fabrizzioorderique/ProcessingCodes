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
PFont font;  
color hover = color(0, 230, 150);  //optional: choose a "hover" color
//----------------------------------SETUP--------------------------------------
void setup(){
  //Init size and create object... ALWAYS:
  size(1200,800);
  cp5 = new ControlP5(this);
  font = createFont("calibri", 30);    //custom fonts + sizes for different things
  //---------------------------------------------------------------------------
  //Button
  cp5.addButton("myButton")
     .setPosition(50,140)
     .setSize(150,100)
     .setValue(0)
     .setFont(font);
     ;
  //---------------------------------------------------------------------------
  //Scrollable List: (name, x, y, length, width);
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
                .setFont(font)
                .addItem("23",0);      
                ;
  //---------------------------------------------------------------------------
  //SLIDER
  cp5.addSlider("sliderValue")  //sliderValue is now an int that can be used anywhere
     .setPosition(100,50)
     .setRange(0,255)
     .setValue(3);
     ;
}
//-----------------------------------DRAW--------------------------------------
void draw(){
  textFont(font);
  background(ControlP5.BLACK);
  //CHANGES color of controllers if mouse is over any one of em
  if(cp5.isMouseOver()) {
    fill(hover);
  } else {
    fill(sliderValue);
  }
  ellipse(width-30,height-30,30,30);
}
//-----------------------------------------------------------------------------

//---------------------------FUNCTIONALITY METHODS-----------------------------
void myButton(){
  println("hello there");  
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkbox)) {
    println("general Kenobee");   
  }
}
void printCoor(){
  int count = 0;
  if(count%3==0){print(mouseX,mouseY);}
  count++;
}
