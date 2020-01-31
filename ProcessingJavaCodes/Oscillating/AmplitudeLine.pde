class AmplitudeLine{
  private float amplitude;
  private float h = 15; //the height, or "thickness" of the rectangular line
  private color col = #FF9B17;
  //Constructor default sets amplitude to 100
  AmplitudeLine(){
    amplitude = 100;
  }
  //General constructor
  AmplitudeLine(float amp){
    amplitude = amp;
  }
  //methods
  void display(){
    strokeWeight(2);
    stroke(col);
    fill(col);
    //line(0,-1*(amplitude+radius/2),width,-1*(amplitude+radius/2));
    rectMode(CENTER);
    rect(0,-1*(amplitude+radius/2+h/2),2*width,h);
  }
  void changeAmp(float dh){
    amplitude+=dh;
  }

  //getters and setters
  float getAmp(){return amplitude;}
  float getH(){return h;}
  void setAmp(float a){amplitude = a;}
  void setColor(color c){col = c;}
}
