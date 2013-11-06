
Car [] cars = new Car[500];
Car emptyCar = new Car(color(255, 255, 255), 0, 0, 0, 0);

void setup() {
  size(1440, 900);
  background(255);
  stroke(0);
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car(color(random(0, 255), random(0, 255), random(0, 255)), 
    random(0, width), random(0, height), 
    random(-.5, .5), random(-.45, .45));
  }
}

void draw() {
  background(255);
  checkCollisions();
  for (int i = 0; i < cars.length; i++) {
    if (cars[i] != null) {
      cars[i].doStuff();
    }
  }
}

void checkCollisions() {
  for (int i = 0; i < cars.length; i++) {
    for (int j = 0; j < cars.length; j++) {
      if (cars[i] != null && cars[j] != null && cars[i] != cars[j] && 
        ((cars[i].xpos + cars[i].rwidth > cars[j].xpos &&
        cars[i].xpos + cars[i].rwidth < cars[j].xpos + cars[j].rwidth)
        && (cars[i].ypos + cars[i].rheight > cars[j].ypos &&
        cars[i].ypos + cars[i].rheight < cars[j].ypos + cars[j].rheight))) {

        if (cars[i].rwidth <= cars[j].rwidth) {
          cars[j].rwidth += cars[i].rwidth*.23;
          cars[j].rheight += cars[i].rheight*.23;
          cars[i] = null;
        }
        else {
          cars[i].rwidth += cars[j].rwidth*.23;
          cars[i].rheight += cars[j].rheight*.23;
          cars[j] = null;
        }
      }
    }
  }
}

