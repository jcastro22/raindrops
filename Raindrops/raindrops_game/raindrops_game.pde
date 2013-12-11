Raindrop[] r; 
Catcher c; 
int oldtime;
int index; 
int score; 
PImage background; 
void setup() {
  size (480,364);
  c = new Catcher();
  r = new Raindrop[1000];//array for the raindrops 
  for (int i=0; i<r.length; i++) { 
    r[i] = new Raindrop();
  }
}

void draw() {
  background ( loadImage ("background22.jpg"));
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
 fill (234,224,111);  
  text (score, 20, 100);
} 

