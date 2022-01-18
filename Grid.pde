class Grid
{
  PImage tileTexture = loadImage("img/wood_1.png");
  int piecesAmount = 1;

  private int[][] grid;
  private int[][] colorGrid;
  public int cellSize;

  int boxX;
  int boxY;


  private int tileColor;
  private int strokeColor;
  private int opacity;

  public Grid(int width, int height, int cellSize) {
    grid = new int[height][width];
    colorGrid = new int[height][width];
    this.cellSize = cellSize;

    tileColor = asset.black;
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

  void pushRow(int x)
  {
    for (int y = 0; y < 9; y++) 
    {
      if (x < 20) {
        for (int i = x; i > 0; --i) {
          grid[y][i]= 0; 
          grid[y][i]=grid[y][i-1];
        }
      }
    }
  }

  void removeRow(int x) {
    for (int y = 0; y < grid.length; y++) {
      grid[y][x] = 0;
    }
  }

  void setTileColor(int rgb) {
    tileColor = rgb;
  }

  void setStrokeColor(int rgb) {
    strokeColor = rgb;
  }

  void setOpacity(int alpha) {
    opacity = alpha;
  }

  void addPiece(Piece newPiece, int posX, int posY) {
    gameManager.updateStorm();

    int[] origin = {posX, posY};
    int[][] pieceCoords = newPiece.piece[newPiece.rotation];
    if ( gameManager.gameState == 1 && piece.x == 0) {
      gameManager.selectedButton = 0;
      gameManager.gameState = 4;
    }
    for (int[] coord : pieceCoords) {
      grid[origin[1] + coord[1]][origin[0] + coord[0]] = piecesAmount;
      colorGrid[origin[1] + coord[1]][origin[0] + coord[0]] = newPiece.tint;
    }

    piecesAmount++;
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

  void renderBox() {
    // Calculate grid
    int gridWidth = grid[0].length * cellSize;
    int gridHeight = grid.length * cellSize;
    boxX = width / 2 - gridWidth / 2;
    boxY = height / 2 - gridHeight / 2;


    // Draw background
    fill(asset.grey);
    rect(boxX, boxY, gridWidth, gridHeight);


    // Draw grid box
    stroke(strokeColor, opacity);
    noFill();
    rect(boxX, boxY, gridWidth, gridHeight);
  }

  void renderTiles() {
    // Calculate grid
    int gridWidth = grid[0].length * cellSize;
    int gridHeight = grid.length * cellSize;
    boxX = width / 2 - gridWidth / 2;
    boxY = height / 2 - gridHeight / 2;

    // Draw tiles
    fill(tileColor, opacity);

    for (int y = 0; y < grid.length; y++) {
      for (int x = 0; x < grid[y].length; x++) {
        if (grid[y][x] >= 1) {
          int tileX = boxX + x * cellSize;
          int tileY = boxY + y * cellSize;
          // rect(tileX, tileY, cellSize, cellSize);
          tint(colorGrid[y][x]);
          image(tileTexture, tileX, tileY, cellSize, cellSize);
        }
      }
    }
  }
}   
