Particle [] particles = new Particle[100];

void setup() {
  stroke(0);
  fill(150);
  size(1440, 900);
  for (int i = 0; i < particles.length; i++) {
   particles[i] = new Particle(random(0, width), random(0, height),
                  random(-5, 5), random(-5, 5)); 
  }
}

void draw() {
    background(255);
  for (int i = 0; i < particles.length; i++) {
   particles[i].doStuff(); 
  }
}
