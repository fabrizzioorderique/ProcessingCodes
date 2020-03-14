/*
*  Program intended to connect Arduino to Processing
 *  Goes hand in hand with arduinoProcessing sketch
 *  @author Piero Orderique
 *  
 *  KEY METHODS:
 *    myPort.available() returns -1 if no data is present -- Arduino info to processing
 *    myPort.write('1'); writes it in arduino serial  -- processing info to arduino
 */

import processing.serial.*;
Serial myPort;  // Create object from Serial class: this is like Serial.whatever except we need an object
String val;  // Data received from the serial port
boolean firstContact = false;  // we need to check if we've heard from the microcontroller

void setup() {
  size(200, 200);
  // Open whatever port is the one you're using.
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  //Lets us store the incoming data into a buffer until we get a specific character
  myPort.bufferUntil('\n');  //we use \n because we've used printLN in arduino
}
void draw() {
  
  // If data is available
  if (myPort.available() > 0) {
    val = myPort.readStringUntil('\n');  // read it and store it in val
  } 
  println(val); //print it out in the console
  
}
/*
void serialEvent( Serial myPort) {
  //put the incoming data into a String - 
  //the '\n' is our end delimiter indicating the end of a complete packet
  val = myPort.readStringUntil('\n');
  //make sure our data isn't empty before continuing
  if (val != null) {
    //trim whitespace and formatting characters (like carriage return)
    val = trim(val);
    println(val);
  
    //look for our 'A' string to start the handshake
    //if it's there, clear the buffer, and send a request for data
    if (firstContact == false) {
      if (val.equals("A")) {
        myPort.clear();
        firstContact = true;
        myPort.write("A");
        println("contact");
      }
    }
    else { //if we've already established contact, keep getting and parsing data
      println(val);
      //if we clicked in the window
      if (mousePressed == true) {                           
        myPort.write('1');        //send a 1
        println("1");
      }

    // when you've parsed the data you have, ask for more:
    myPort.write("A");
    }
  }
}
*/

void mousePressed() {
  myPort.write('1');  //send a 1
  println("1");
}
