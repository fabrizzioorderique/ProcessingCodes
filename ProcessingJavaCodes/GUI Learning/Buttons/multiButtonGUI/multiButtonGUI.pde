/**
 *  MultiButton
 *  
 *  Spin off from my buttonGUI sketch
 *  but with ability to make multiple ones
 *  @author Piero Orderique
 *  @date 3 April 2019
 */

Button[] buttons;
Button cButton;
void setup(){
  size(1000, 680);
  buttons = new Button[10];
  cButton = new Button(width - 40, 40, 80, 40, #3AFF0F, #FF0F1F);
  for(int i = 0; i < buttons.length; i++){
    buttons[i] = new Button(40,i * height/buttons.length + 40, 80, 40, #3AFF0F, #FF0F1F);
  }
}
void draw(){
  background(#0FB5FF);
  cButton.displayRect();
  cButton.updateFeatures();
  for(int i = 0; i < buttons.length; i++){
    buttons[i].displayRect();
    buttons[i].updateFeatures();    
  }
}

void mousePressed(){
  if(cButton.overButton()){
    exampleMethod();
    cButton.state*=-1;
  }
  for(int i = 0; i < buttons.length; i++){
    if(buttons[i].overButton()){
      exampleMethod();
      buttons[i].state*=-1;
    }
  }
}

void exampleMethod(){
  print("Clicked!");
}
