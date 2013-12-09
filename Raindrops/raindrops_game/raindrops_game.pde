Raindrop[] r; 
Catcher c; 
int oldtime;
int index; 
void setup() {
  size (500, 500);
  c = new Catcher();
  r = new Raindrop[1000];
  for (int i=0; i<r.length; i++) { 
    r[i] = new Raindrop();
  }
}

void draw() {
  background (0);
  c.display();
  for (int i=0; i < index; i++) {
    r[i].display();
    r[i].move();
    r[i].checkcatcher(c);
  }
  if (millis() >= oldtime) {
    index++;
    oldtime+= 3000;
  }
} 

