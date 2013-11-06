class Particle {
  float xpos, ypos;
  float xvel, yvel;
  float rad = 5;

  float G = 2000;

  Particle (float x, float y, float a, float b) {
    xpos = x;
    ypos = y;
    xvel = a;
    yvel = b;
  }

  void doStuff() {
  if (mousePressed)
    gravity();
    
   updatePosition();
   draw(); 
  }

  void updatePosition() {
    xpos += xvel;
    ypos += yvel;

    if (xpos + rad >= width || xpos - rad <= 0) {
      xvel *= -1;
      xpos += xvel + 1;
    }

    if (ypos + rad >= height || ypos - rad <= 0) {
      yvel *= -1;
      ypos += yvel + 1;
    }
    
    xvel *= .999;
    yvel *= .999;
    
  } 

  void draw() {
    ellipse(xpos, ypos, rad, rad);
  }

  void gravity() {
    float xDist = mouseX - xpos + rad;
    float yDist = mouseY - ypos + rad;
    float accel = G/(xDist*xDist + yDist*yDist); 
    if (accel > 3) {
     accel = 0;
     xvel = 0;
     yvel = 0;
    }
    else {
      if (xpos > mouseX) 
       xvel -= accel;
      else  
       xvel += accel;
       
      if (ypos > mouseY)
       yvel -= accel;
       else
       yvel += accel;
    }
  }
}

