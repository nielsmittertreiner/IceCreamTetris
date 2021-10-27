class Piece {
    final int BLOCKS_PER_PIECE_COUNT = 8;

    final int BLOCK_SIZE = 80;

    final int[] colors =
    {
      asset.green,
      asset.green,
      asset.blue,
      asset.blue,
      asset.red,
      asset.red,
      asset.white,
      asset.white
    };

    int[][][] piecesCoords =
    {       // Pyramide
        {   // . . X    
            // . X X
            // . . X
           {0,0},
           {0,0},
           {1,-1},
           {0,0},
           {0,0},
           {1,0},
           {0,0},
           {0,0},
           {1,1},
        },
        { // C shape
          // . . .
          // X X X
          // X . X
            {0,0},
            {0,0},
            {0,0},
            {-1,0},
            {0,0},
            {1,0},
            {-1,1},
            {0,0},
            {1,1},
        },
        { // stairs
          // . . .
          // . X X
          // . . X
            {0, 0}, 
            {0, 0}, 
            {0, 0},
            {0, 0},
            {0, 0},
            {1, 0},
            {0, 0},
            {0, 0},
            {1, 1},
        },
        { // snake
          // . X X
          // . X .
          // X X .
            {0, 0}, 
            {0, -1}, 
            {1, -1},        
            {0, 0},
            {0, 0},
            {0, 0},
            {-1, 1},
            {0, 1},
            {0, 0},
        },
        { // L shape
          // . . X
          // X X X
          // . . .
            {0, 0}, 
            {0, 0}, 
            {1, -1},
            {-1, 0},
            {0, 0},
            {1, 0},
            {0, 0},
            {0, 0},
            {0, 0},
        },
        { // plus
          // . X .
          // X X X
          // . X .
            {0, 0}, 
            {0, -1}, 
            {0, 0},
            {-1, 0}, 
            {0, 0}, 
            {1, 0},
            {0, 0}, 
            {0, 1}, 
            {0, 0},
        },
        { // square
          // . X X
          // . X X
          // . . .
            {0, 0}, 
            {0, -1}, 
            {1, -1},
            {0, 0},
            {0, 0},
            {1, 0},
            {0, 0},
            {0, 0},
            {0, 0},
        },
        { // rectangle
          // . X .
          // . X .
          // . X .
            {0, 0}, 
            {0, -1}, 
            {0, 0},
            {0, 0},
            {0, 0},
            {0, 0},
            {0, 0},
            {0, 1},
            {0, 0},
        }
    };

    int[][] piece = new int[9][2];
    int x = int(width/2);
    int y = 0;
    int type;
    int c;
    int rotation;
    boolean isPieceOnTheEnd(int endIndex){
      return this.x >= 1440;
    }

    Piece(int type)
    {
        this.type = type;
        this.piece = piecesCoords[type];
        this.c = colors[type];
        this.rotation = 0;
        
        // testing only
        this.x = int(80); // center piece x
        this.y = int(random(140,700)); // center piece y
        println("type: "+type);
    }
 
    void render()
    {
        fill(c);
        pushMatrix();
        translate(x, y); // verander dit naar grid x y later
        for (int i = 0; i < BLOCKS_PER_PIECE_COUNT; i++)
        {
            rect(piece[i][0] * BLOCK_SIZE, piece[i][1] * BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE);
        }
        popMatrix();
        
     
       
          this.x+=1;
          if (this.x > 1440){
            // currentPiece = new Piece(nextPiece.type);
            nextPiece = new Piece(int(random(0, 7)));
            this.x = 1440;
          }
    }
}
