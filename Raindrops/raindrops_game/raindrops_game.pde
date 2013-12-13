Raindrop[] r; 
Catcher c; 
int oldtime;
int index; 
int score; 
PImage background; 
boolean run = false; 
void setup() {
  size (480, 364);
  PFont font = loadFont ("Castellar-48.vlw"); 
  textFont(font); 
  c = new Catcher();
  r = new Raindrop[1000];//array for the raindrops 
  for (int i=0; i<r.length; i++) { 
    r[i] = new Raindrop();
  }
}

void draw() {
  background ( loadImage ("background22.jpg"));   
  if (run == false) {
    fill (234, 224, 111); 
    ellipse(480, 0, 200, 200);
    fill(0); 
    textSize(20); 
    text("start", 408, 40);
  } 
  if (run == true) {
    c.display();
    for (int i=0; i < index; i++) {
      r[i].display();
      r[i].move();
      r[i].checkcatcher(c);
    }
    if (millis() >= oldtime) {//rainsdrops fall indivdually based on timer
      index++;
      oldtime+= 3000;
    }
    textSize(120);
    fill (234, 224, 111);  
    text (score, 20, 100);
  }
}

void mouseClicked() {
  if (mouseX > 280 && mouseX < 480 && mouseY < 200 && mouseY > 0) {
    run= !run;
  }
}

