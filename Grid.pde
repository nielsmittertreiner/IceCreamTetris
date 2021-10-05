class Grid
{
    private int[][] grid;
    private int cellSize;

    private int[] tileColor;
    private int[] backgroundColor;
    private int[] strokeColor;
    private int opacity;

    public Grid(int width, int height, int cellSize) {
        grid = new int[height][width];
        this.cellSize = cellSize;

        tileColor = new int[] {0, 0, 0};
        backgroundColor = new int[] {255, 255, 255};
        strokeColor = new int[] {0, 0, 0};
        opacity = 255;
    }
    
   

    public void setTileColor(int r, int g, int b) {
        tileColor[0] = r;
        tileColor[1] = g;
        tileColor[2] = b;
    }

    public void setBackgroundColor(int r, int g, int b) {
        backgroundColor[0] = r;
        backgroundColor[1] = g;
        backgroundColor[2] = b;
    }

    public void setStrokeColor(int r, int g, int b) {
        strokeColor[0] = r;
        strokeColor[1] = g;
        strokeColor[2] = b;
    }

    public void setOpacity(int alpha) {
        opacity = alpha;
    }

    /**
    * Sets the state of a grid cell
    */
    public void setState(int x, int y, int state) {
        grid[y][x] = state;
    }

    /** 
    * Returns the state of the grid cell
    */
    public int getState(int x, int y) {
        return grid[y][x];
    }

    public void draw() {
        stroke(strokeColor[0], strokeColor[1], strokeColor[2], opacity);

        // Draw grid box
        fill(backgroundColor[0], backgroundColor[1], backgroundColor[2], opacity);
        int gridWidth = grid[0].length * cellSize;
        int gridHeight = grid.length * cellSize;
        int boxX = width / 2 - gridWidth / 2;
        int boxY = height / 2 - gridHeight / 2;

        rect(boxX, boxY, gridWidth, gridHeight);

        // Draw tiles
        fill(tileColor[0], tileColor[1], tileColor[2], opacity);

        for(int y = 0; y < grid.length; y++) {
            for(int x = 0; x < grid[y].length; x++) {
                if(grid[y][x] >= 1) {
                    int tileX = boxX + x * cellSize;
                    int tileY = boxY + y * cellSize;
                    rect(tileX, tileY, cellSize, cellSize);
                } 
            }
        }
    }
}
