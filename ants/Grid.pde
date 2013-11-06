class Grid {

  int [][] grid;
  int rows, columns, cellSize;
  int xpos = 10, ypos = 10;
  boolean drawTheGrid = true;

  Grid (int w, int h, int cS, int xp, int yp) {
    rows = w;
    columns = h;
    cellSize = cS;
    xpos = xp;
    ypos = yp;
    grid = new int[rows + 1][columns + 1];
    for (int i = 0; i < rows + 1; i++) {
      grid[i][columns] = -1;
    }
    for (int i = 0; i < columns + 1; i++) {
      grid[rows][i] = -1;
    }
  }
  
  void decay() {
   for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      if (grid[i][j] > 0)
       grid[i][j]--;   
    }
   }
     
  }

  void drawGrid() {
    stroke (0);
    for (int i = ypos; i <= rows*cellSize + ypos; i += cellSize) {
      line(xpos, i, columns*cellSize + xpos, i);
    }
    for (int j = xpos; j <= columns*cellSize + xpos; j += cellSize) {
      line(j, ypos, j, rows*cellSize + ypos);
    }
    stroke (0);
  }

  void drawTrue() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        if (grid[i][j] >= 0) {
          fill(255 - 10*grid[i][j], 255 - 10*grid[i][j], 255);
          rect(xpos + i*cellSize, ypos + j*cellSize, cellSize, cellSize);
        }
        if (grid[i][j] == -1) {
          fill(40, 120, 10);
          rect(xpos + i*cellSize, ypos + j*cellSize, cellSize, cellSize);
        }

      }
    }
  }

  void drawHighlight() {
    if (mouseX > xpos && mouseX < xpos + columns*cellSize
      && mouseY > ypos && mouseY < ypos + rows*cellSize) {

      int currX = (mouseX - xpos)/cellSize;
      int currY = (mouseY - ypos)/cellSize;
      fill(120, 40, 50);
      rect(xpos + currX*cellSize, ypos + currY*cellSize, cellSize, cellSize); 
      if (mousePressed) {
        if (mouseButton == LEFT) 
          grid[currX][currY] = -1;
        else if (mouseButton == RIGHT) 
          grid[currX][currY] = 0;
      }
    }
  }

  void draw() {
    if (drawTheGrid)
      drawGrid();
    drawHighlight();
    drawTrue();
  }
}

