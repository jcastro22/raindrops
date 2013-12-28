import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer player;                                                     //music


Raindrop[] r;                                                           //controls amount of raindrops that fall
Catcher c;                                                              //catcher variable 
int oldtime;                                                            //controls the time between raindrops falling
int index;                                                              //for the individual raindrop 
int score;                                                                //varible that controls score
PImage background;                                                      //
boolean run = false; 
int lives = 5;                                                             // subtracts one everytime the catcher misses the raindrop 
boolean gameOver;   
void setup() {
  size (480, 364);
  background = loadImage("background22.jpg");
  PFont font = loadFont ("OldEnglishTextMT-48.vlw");                       //changes the text style 
  textFont(font); 
  c = new Catcher();
  r = new Raindrop[1000];                                                  //array for the raindrops 
  for (int i=0; i<r.length; i++) { 
    r[i] = new Raindrop();
  }
  minim = new Minim(this);
  player = minim.loadFile("Apartment.mp3");
  player.loop();
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
    if (millis() >= oldtime) {                                                //rainsdrops fall indivdually based on timer
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
    background = (loadImage ("eeyore.jpg"));                                  //gameover image
    textSize (70); 
    textAlign (CENTER); 
    text ("Game Over", width/2, height/2);                                    //gameover text
  }
}
void mouseClicked() {
  if (mouseX > 280 && mouseX < 480 && mouseY < 200 && mouseY > 0) {
    run= !run;
  }
}

