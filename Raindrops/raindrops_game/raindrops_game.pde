PVector[] Jane = new PVector[1000];
float[] d = new float[1000];
int aj = 0;

void setup() {
  size (500,500);
  for (int i = 0; i < 1000; i++){
    
  }
}

void draw() {
  background (0);
  Jane [aj] = new PVector (random(width), 0);
    d[aj] = random (0,10);
  for (int i = 0; i < aj; i++){
ellipse (Jane[i].x, Jane[i].y, d[i], d[i]); 
Jane[i].y++;
  }
  aj++; 
  if (aj > 999){
    aj = 0;
  }
}
   
    
