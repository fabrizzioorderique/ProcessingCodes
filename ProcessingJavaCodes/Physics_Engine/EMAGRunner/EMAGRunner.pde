PointCharge c;
ArrayList<PointCharge> charges;
boolean goAhead = false;

void setup(){
  size(1500,900);
  charges = new ArrayList<PointCharge>();
}

void draw(){
  background(20);
  if(goAhead){
    for (int i = 0; i < charges.size() - 1; i++) {
      if(charges.get(i).canShow) {
        charges.get(i).showCharge();
        if(charges.size()>2){
          charges.get(i).calculateForce(charges.get(i+1));
        }
      }
    }
    for (int i = 0; i < charges.size() - 1; i++) {
      charges.get(i).move();
    }
  }
}

void mousePressed(){
  c = new PointCharge(1, mouseX, mouseY);
  charges.add(c);
  c.canShow = true;
  goAhead = true;
}
