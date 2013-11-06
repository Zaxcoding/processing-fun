

Grid grid = new Grid(30, 30, 25, 50, 50);
Ant [] ants = new Ant[1000];
int currAnt = 0;
int elapsed = 0;

int targetx = 29;
int targety = 29;

void setup() {
  size(1440, 900);
  elapsed = millis();
}

void draw() {
  elapsed = millis() % 5000;
  background(30);
  grid.draw();
  for (int i = 0; i < ants.length; i++) {
    if (ants[i] != null) {
      ants[i].tryToMove(grid, ceil(random(-1.9, .9)), ceil(random(-1.9, .9)));
      ants[i].draw();
    }
  }
  if (elapsed > 4950) {
    grid.decay();
    elapsed = 0;
  }
}

void keyPressed() {
 if (key == 'g') 
   grid.drawTheGrid = !grid.drawTheGrid;
 if (key == 'a') {
   ants[currAnt] = new Ant(0,0, targetx, targety, 25, currAnt*5);
   currAnt++;
   grid.grid[targetx][targety] = 100;
 }
}
