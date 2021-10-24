class Piece {
    final int BLOCK_SIZE = 20;

    final color[] colors =
    {
        color(0, 255, 255), // cyan
        color(0, 0, 255),   // blue
        color(230, 170, 0), // orange
        color(255, 255, 0), // yellow
        color(0, 255, 0),   // green
        color(153, 0, 255), // purple
        color(255, 0, 0),   // red
        color(255, 0, 0)    // red
    };

    int[][][] piecesCoords =
    {
        {   // . . .    
            // . X .
            // X X X
            {0, 0},
            {0, 0},
            {-1, 1},
            {0, 0},
            {0, 0},
            {0, 1},
            {0, 0},
            {0, 0},
            {1, 1},
        },
        { // C shape
            {1, 1, 1}, 
            {1, 0, 1}, 
            {0, 0, 0},
        },
        { // stairs
            {0, 0, 0}, 
            {0, 1, 1}, 
            {0, 0, 1},
        },
        { // snake
            {1, 1, 0}, 
            {0, 1, 0}, 
            {0, 1, 1},
        },
        { // L shape
            {1, 1, 1}, 
            {0, 0, 1}, 
            {0, 0, 0},
        },
        { // plus
            {0, 1, 0}, 
            {1, 1, 1}, 
            {0, 1, 0},
        },
        { // square
            {0, 0, 0}, 
            {0, 1, 0}, 
            {0, 0, 0},
        },
        { // rectangle
            {0, 1, 0}, 
            {0, 1, 0}, 
            {0, 1, 0},
        }
    };

    int[][] piece = new int[9][2];
    int x = int(width/2);
    int y = 0;
    int type;
    int c;
    int rotation;

    Piece(int type)
    {
        this.type = type;
        this.piece = piecesCoords[type];
        this.c = colors[type];
        this.rotation = 0;

        // testing only
        this.x = int(width/2); // center piece x
        this.y = int(height/2); // center piece y
        println("type: "+type);
    }

    void render()
    {
        fill(c);
        pushMatrix();
        translate(x, y); // verander dit naar grid x y later
        for (int i = 0; i < 3; i++)
        {
            rect(piece[i][0] * BLOCK_SIZE, piece[i][1] * BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE);
        }
        popMatrix();
    }
}
