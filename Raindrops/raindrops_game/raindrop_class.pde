class Raindrop { 
  PVector loc;
  PVector vel;
  PVector accl; 

  Raindrop() { 
    loc = new PVector (random (width), -10);
    vel = new PVector (0, 0); 
    accl = new PVector (0, .2);
  } 

  void display () {
    image (loadImage("raindrop.png"), loc.x, loc.y, 50, 50);
  }

  void move () { 
    vel.add(accl);
    loc.add(vel);
  }

  void checkcatcher(Catcher c) {
    if (dist(loc.x, loc.y, mouseX, 400) <= 50) {
      loc.set (-100, -100);
    }
  }
}

