class Raindrop { 
  PVector loc;
  PVector vel;
  PVector accl; 

  Raindrop() { 
    loc = new PVector (random (width), -10);//controls where the raindrops fall from which is a random place at the x axis and a -10 on the y axis
    vel = new PVector (0, 0); 
    accl = new PVector (0, .2);// determines the speed of which the raindrops fall
  } 

  void display () {
    image (loadImage("raindrop.png"), loc.x, loc.y, 50, 50);
  }

  void move () { //speed of which the raindrop falls
    vel.add(accl);
    loc.add(vel);
  }

  void checkcatcher(Catcher c) {// so that the raindrop disappears from the screen when the catcher catches it
    if (dist(loc.x, loc.y, mouseX, 325) <= 50) {
      loc.set (-100, -100);
      score++; 
    }
  }
}

