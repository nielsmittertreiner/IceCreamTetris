class Grid
{
  private int[][] grid;
  private int cellSize;

  int boxX;
  int boxY;

  private int tileColor;
  private int backgroundColor;
  private int strokeColor;
  private int opacity;

  public Grid(int width, int height, int cellSize) {
    grid = new int[height][width];
    this.cellSize = cellSize;

    tileColor = asset.black;
    backgroundColor = asset.lightBlue;
    strokeColor = asset.black;
    opacity = asset.opacity;
  }

  int width() {
    return grid[0].length;
  }

  int height() {
    return grid.length;
  }

  int gridX() {
    return boxX;
  }

  int gridY() {
    return boxY;
  }

  boolean isRowFull(int x) {
    for (int y = 0; y < grid.length; y++) {   
      if (grid[y][x] == 0) {  
        return false;
      }
    }

    return true;
  }

  void removeRow(int x) {
    for (int y = 0; y < grid.length; y++) {
      grid[y][x] = 0;
    }
  }


  void setTileColor(int rgb) {
    tileColor = rgb;
  }

  void setBackgroundColor(int rgb) {
    backgroundColor = rgb;
  }

  void setStrokeColor(int rgb) {
    strokeColor = rgb;
  }

  void setOpacity(int alpha) {
    opacity = alpha;
  }

  void addPiece(Piece newPiece, int posX, int posY) {
    int[] origin = {posX, posY};
    int[][] pieceCoords = newPiece.piece[newPiece.rotation];

    for (int[] coord : pieceCoords) {
      grid[origin[1] + coord[1]][origin[0] + coord[0]] = 1;
    }
  }

  int getRowPosition(int rowX) {
    int gridWidth = grid[0].length * cellSize;
    int boxOffsetX = width / 2 - gridWidth / 2;
    return boxOffsetX + rowX * cellSize;
  }

  void setState(int x, int y, int state) {
    grid[y][x] = state;
  }

  int getState(int x, int y) {
    try {
      return grid[y][x];
    } 
    catch (Exception e) {
      return -1;
    }
  }

  void draw() {        
    // Calculate grid
    int gridWidth = grid[0].length * cellSize;
    int gridHeight = grid.length * cellSize;
    boxX = width / 2 - gridWidth / 2;
    boxY = height / 2 - gridHeight / 2;

    // Draw background
    fill(asset.grey);
    rect(boxX, boxY, gridWidth, gridHeight);

    // Draw animation
    riverAnimation.draw(boxY, gridHeight, asset.lightBlue);

    // Draw tiles
    fill(tileColor, opacity);

    for (int y = 0; y < grid.length; y++) {
      for (int x = 0; x < grid[y].length; x++) {
        if (grid[y][x] >= 1) {
          int tileX = boxX + x * cellSize;
          int tileY = boxY + y * cellSize;
          rect(tileX, tileY, cellSize, cellSize);
        }
      }
    }
  }
}
