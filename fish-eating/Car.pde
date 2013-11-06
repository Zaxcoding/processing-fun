class Car {

  color c;
  float xpos, ypos;
  float xvel, yvel;
  int rwidth = 20, rheight = 10;
  boolean dontDraw = false;

  Car(color c, float xpos, float ypos, float xvel, float yvel) {
    this.c = c;
    this.xpos = xpos;
    this.ypos = ypos;
    this.xvel = xvel;
    this.yvel = yvel;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, rwidth, rheight);
  }

  void doStuff() {
    randomDirection();
    drive();
    display();
  }

  void drive() {
    xpos += xvel;
    ypos += yvel;
    if (xpos > width || xpos < 0) {
      xvel *= -1;
      xpos += xvel;
    }
    if (ypos > height || ypos < 0) {
      yvel *= -1;
      ypos += yvel;
    }
  }

  void randomDirection() {
    xvel = random(xvel - .5, xvel + .5);
    yvel = random(yvel - .5, yvel + .5);
  }
}

