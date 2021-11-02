class Piece {
   final int BLOCK_SIZE = 80;

    final color[] colors =
    {
      asset.green,
      asset.orange,
      asset.blue,
      asset.darkBlue,
      asset.red,
      asset.darkRed,
      asset.white,
      asset.black
    };

    int[][][] piecesCoords =
    {       // Pyramide
        {   // . . .    
            // x X X
            // . X .
           {0,0},
           {0,0},
           {0,0},
           {-1,0},
           {0,0},
           {1,0},
           {0,0},
           {0,1},
           {0,0},
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
          // . . .
          // . X X
          // X X .
            {0, 0}, 
            {0, 0}, 
            {0, 0},        
            {0, 0},
            {0, 0},
            {1, 0},
            {-1, 1},
            {0, 1},
            {0, 0},
        },
        { // L shape
          // . . .
          // X X X
          // . . X
            {0, 0}, 
            {0, 0}, 
            {0, 0},
            {-1, 0},
            {0, 0},
            {1, 0},
            {0, 0},
            {0, 0},
            {1, 1},
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
          // . . .
          // . X X
          // . X X
            {0, 0}, 
            {0, 0}, 
            {0, 0},
            {0, 0},
            {0, 0},
            {1, 0},
            {0, 0},
            {0, 1},
            {1, 1},
        },
        { // rectangle
          // . . .
          // X X X
          // . . .
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
    

    Piece(int type)
    {
        this.type = type;
        this.piece = piecesCoords[type];
        this.c = colors[type];
        this.rotation = 0;

        // testing only
        this.x = int(0); // center piece x
        this.y = int(170); // center piece y
        println("type: "+type);
    }
 
    void render()
    {
        fill(c);
        pushMatrix();
        translate(x, y); // verander dit naar grid x y later
        for (int i = 0; i < 9; i++)
        {
            
            rect(piece[i][0] * BLOCK_SIZE, piece[i][1] * BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE);
        }  
              popMatrix();
            this.x+=4;
            if(currentPiece.x >= 1440)
            {
            currentPiece = new Piece(nextPiece.type);
            println(this.x);
            println(this.y);
            grid.addPiece(currentPiece,calculateXposition(currentPiece.x),calculateYposition(currentPiece.y));
            nextPiece = new Piece(int(random(0,7)));
            this.x = 1440;
            }

        
    }   
 int calculateXposition(int xPosition)
 {
      println("old"+xPosition);
      int(xPosition = 19);
      
      println("new"+xPosition);
      return xPosition;

 }
    int calculateYposition(int yPosition)
    {
      println("old"+yPosition);

      int(yPosition = 0);
      println("new"+yPosition);
      return yPosition;

    }
}
// class Piece
// {
//   final int[][] theSquare = {{0,0},{0,1},{1,0},{1,1}};
//   final int[][] theLine = {{0,0},{1,0},{2,0},{3,0}};
//   final int[][] theStair = {{0,0},{1,0},{1,1},{2,1}};
//   final int[][] shapeL = {{0,0},{0,1},{1,0},{2,0}};
//   final int[][] theSnake = {{0,0},{1,0},{1,1},{2,1}};
//   final int[][] theShape;
//   final int[][] r,g,b, choice;
//   private boolean isActive;
//   private int w;
//   public Piece()
//   {
//     w = width/9;
//     choice = (int)random(5);
//     switch (choice) {
//       case 0:
//       theShape = theSquare;
//       r = 155;
//       break;
//       case 1:
//       theShape = theLine;
//       g =155;
//       break;
//       case 2:
//       theShape = theStair;
//       b =155;
//       break;
//       case 3:
//       theShape = shapeL;
//       r =155;
//       g =155;
//       break;
//       case 4:
//       theShape = theSnake;
//       g =155;
//       b =155;
//       break;
//     }

//   }
//   public void display()
//   {
//     for(i=0;i<4;i++)
//     {
//       rect(theShape[i][0]*BLOCK_SIZE,theShape[i][1]*BLOCK_SIZE,BLOCK_SIZE,BLOCK_SIZE);

//     }

//   }


// }