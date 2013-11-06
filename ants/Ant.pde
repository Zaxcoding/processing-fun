class Ant {

  int xpos, ypos;
  int xtarget, ytarget;
  int cellSize;
  int id;

  Ant(int x, int y, int xt, int yt, int cs, int id) {
    xpos = x;
    ypos = y;
    xtarget = xt;
    ytarget = yt;
    cellSize = cs;
    this.id = id;
  } 

  boolean tryToMove(Grid grid, int rightOrLeft, int upOrDown) {
    boolean didMove = false;

    if (xpos >= xtarget && ypos >= ytarget) {
      xpos = xtarget + 1;
      ypos = ytarget + 1;
      return false;
    }

    if (ypos + 1 < grid.columns && 
      grid.grid[xpos][ypos + 1] != -1 && 
      grid.grid[xpos][ypos + 1] > grid.grid[xpos + 1][ypos] && 
      grid.grid[xpos][ypos + 1] > grid.grid[xpos + 1][ypos+1]) {
        // go right
        grid.grid[xpos][ypos + 1]++; 
        ypos++;
        println("going right!");
        didMove = true;
    }
    else if (ypos + 1 < grid.columns && 
      xpos + 1 < grid.rows && 
      grid.grid[xpos + 1][ypos + 1] != -1 &&
      !(grid.grid[xpos + 1][ypos] == -1 &&
      grid.grid[xpos][ypos + 1] == -1) &&
      grid.grid[xpos + 1][ypos + 1] > grid.grid[xpos][ypos + 1] && 
      grid.grid[xpos + 1][ypos + 1] > grid.grid[xpos + 1][ypos]) {
      // go down right
        grid.grid[xpos + 1][ypos + 1]++; 
        xpos++;
        ypos++;
        println("going downright!");
        didMove = true;
    }
    else if (xpos + 1 > grid.rows && 
    grid.grid[xpos + 1][ypos] != -1 && 
    grid.grid[xpos + 1][ypos] > grid.grid[xpos][ypos + 1] && 
    grid.grid[xpos + 1][ypos] > grid.grid[xpos + 1][ypos + 1]) {
      // go down
      didMove = true;
      grid.grid[xpos + 1][ypos]++; 
      println("going down!");
      xpos ++;
    }
    else  if (ypos + rightOrLeft < grid.columns && ypos + rightOrLeft > 0
      && xpos + upOrDown < grid.rows && xpos + upOrDown > 0
      && grid.grid[xpos + upOrDown][ypos + rightOrLeft] != -1
      && !(grid.grid[xpos + upOrDown][ypos] == -1
      && grid.grid[xpos][ypos + rightOrLeft] == -1)) {
      // pick a random spot
      grid.grid[xpos + upOrDown][ypos + rightOrLeft]++;
      ypos += rightOrLeft;
      xpos += upOrDown;
      didMove = true;
    }

    return didMove;
  }

  void draw() {
    fill (255, 25, 25);
    if (xpos >= xtarget && ypos >= ytarget)
      rect (xpos*cellSize + 55 + id, ypos*cellSize + 55, 5, 5);

    rect (xpos*cellSize + 55, ypos*cellSize + 55, 5, 5);
  }
}

