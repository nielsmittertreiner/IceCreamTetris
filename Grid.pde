class Grid
{
    private int[][] grid;
    private int cellSize;
    
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
    
    
    boolean isRowFull(int x) {
        for (int y = 0; y < grid.length; y++) {   
            if (grid[y][x] == 0) {  
                return false;
            }
        }
        
        return true;
    }

    void removeRow(int x) {
        for(int y = 0; y < grid.length; y++) {
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
        int[][] piece = newPiece.piece;

        for(int y = 0; y < piece.length; y++) {
            for(int x = 0; x < piece[y].length; x++) {
                grid[y + posY][x + posX] = piece[y][x];
            }
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
        return grid[y][x];
    }
    
    void draw() {        
        // Calculate grid
        int gridWidth = grid[0].length * cellSize;
        int gridHeight = grid.length * cellSize;
        int boxX = width / 2 - gridWidth / 2;
        int boxY = height / 2 - gridHeight / 2;
        
        // Draw background
        fill(asset.grey);
        rect(boxX, boxY, gridWidth, gridHeight);

        // Draw animation
        riverAnimation.draw(boxY, gridHeight);

        // Draw grid box
        stroke(strokeColor, opacity);
        fill(backgroundColor, opacity);
        rect(boxX, boxY, gridWidth, gridHeight);
        
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
