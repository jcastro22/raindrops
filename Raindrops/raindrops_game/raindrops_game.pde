Raindrop[] r; 
Catcher c; 
int oldtime;
int index; 
int score; 
PImage background; 
boolean run = false; 
int lives = 5; 
boolean gameOver; 
void setup() {
  size (480, 364);
  background = loadImage("background22.jpg");
  PFont font = loadFont ("OldEnglishTextMT-48.vlw"); 
  textFont(font); 
  c = new Catcher();
  r = new Raindrop[1000];//array for the raindrops 
  for (int i=0; i<r.length; i++) { 
    r[i] = new Raindrop();
  }
}

void draw() {
  background (background);   
  if (run == false) {
    fill (234, 224, 111); 
    ellipse(480, 0, 200, 200);
    fill(0); 
    textSize(20); 
    text("start", 408, 40);
  } 
  if (run == true && gameOver == false) {
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
    fill (27, 28, 49);  
    text (score, 20, 100);
    text (lives, 20, 300);
  }
  if (lives == 0) {
    gameOver= true;
  }
  if (gameOver == true) {
    background = (loadImage ("eeyore.jpg")); 
    textSize (70); 
    textAlign (CENTER); 
    text ("Game Over", width/2, height/2);
  }
}
  void mouseClicked() {
    if (mouseX > 280 && mouseX < 480 && mouseY < 200 && mouseY > 0) {
      run= !run;
    }
  }

