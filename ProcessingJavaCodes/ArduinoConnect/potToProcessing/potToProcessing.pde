import processing.serial.*;
Serial port;
float background_color ;

void setup(){
  size(500,500);
  port = new Serial(this, "COM5", 9600);
  port.bufferUntil('\n'); 
}
void draw(){
  background(150,50,background_color);
}
void serialEvent (Serial get){
  background_color = float(get.readStringUntil('\n'));
}
