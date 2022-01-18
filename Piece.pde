class Piece
{
  final int BLOCK_COUNT = 5;
  final int BLOCK_SIZE = 80;
  final int ROTATION_COUNT = 4;
  final int PREVIEW_OFFSET_X = 600;
  final int PREVIEW_OFFSET_Y = 815;
  final int PREVIEW_BLOCK_SIZE = BLOCK_SIZE / 2;

  final String[] textures = 
  {
    "img/wood_1.png", 
    "img/wood_2.png", 
    "img/wood_3.png", 
    "img/wood_4.png"
  };

  final color[] tints =
  {
    asset.green, 
    asset.orange, 
    asset.blue, 
    asset.darkBlue, 
    asset.red, 
    asset.darkRed, 
    asset.white, 
    asset.black,
    asset.lightBlue
  };

  // coordinates of individual blocks that make up one piece
  int[][][][] blockCoordinates =
  {
    {   // Pyramid
      // . . .    
      // X X X
      // . X .
      {
        {-1, 0}, 
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {-1, 0}, 
        {0, 0}, 
        {0, 1}, 
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {-1, 0}, 
        {0, 0}, 
        {1, 0}, 
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {0, 0}, 
        {1, 0}, 
        {0, 1}, 
        {0, 0}, // filler
      }, 
    }, 
    {   // C shape
      // . . .
      // X X X
      // X . X
      {
        {-1, 0}, 
        {-1, 1}, 
        {0, 0}, 
        {1, 0}, 
        {1, 1}, 
      }, 
      {
        {-1, -1}, 
        {0, -1}, 
        {0, 0}, 
        {-1, 1}, 
        {0, 1}, 
      }, 
      {
        {-1, 0}, 
        {-1, 1}, 
        {0, 1}, 
        {1, 1}, 
        {1, 0}, 
      }, 
      {
        {0, -1}, 
        {1, -1}, 
        {0, 0}, 
        {0, 1}, 
        {1, 1}, 
      }, 
    }, 
    {  // Snake
      // . . .
      // . X X
      // X X .
      {
        {-1, 1}, 
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
        {0, 0}, // filler
      }, 
      {
        {-1, -1}, 
        {-1, 0}, 
        {0, 0}, 
        {0, 1}, 
        {0, 0}, // filler
      }, 
      {
        {-1, 1}, 
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {0, 0}, 
        {1, 0}, 
        {1, 1}, 
        {0, 0}, // filler
      }, 
    }, 
    {   // L shape
      // . . .
      // X X X
      // . . X
      {
        {-1, 0}, 
        {0, 0}, 
        {1, 0}, 
        {1, 1}, 
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {0, 0}, 
        {-1, 1}, 
        {0, 1}, 
        {0, 0}, // filler
      }, 
      {
        {-1, -1}, 
        {-1, 0}, 
        {0, 0}, 
        {1, 0}, 
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {1, -1}, 
        {0, 0}, 
        {0, 1}, 
        {0, 0}, // filler
      }, 
    }, 
    {   // Long Rectangle
      // . . .
      // X X X
      // . . .
      {
        {-1, 0}, 
        {0, 0}, 
        {1, 0}, 
        {0, 0}, // filler
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {0, 0}, 
        {0, 1}, 
        {0, 0}, // filler
        {0, 0}, // filler
      }, 
      {
        {-1, 0}, 
        {0, 0}, 
        {1, 0}, 
        {0, 0}, // filler
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {0, 0}, 
        {0, 1}, 
        {0, 0}, // filler
        {0, 0}, // filler
      }, 

    }, 
    {   // Stairs
      // . . .
      // . X X
      // . . X
      {
        {0, 0}, 
        {1, 0}, 
        {1, 1}, 
        {0, 0}, // filler
        {0, 0}, // filler
      }, 
      {
        {0, 0}, 
        {0, 1}, 
        {-1, 1}, 
        {0, 0}, // filler
        {0, 0}, // filler
      }, 
      {
        {0, 0}, 
        {0, 0}, 
        {0, 0}, 
        {0, 1}, // filler
        {1, 0}, // filler
      }, 
      {
        {0, 0}, 
        {0, 0}, 
        {0, 0}, 
        {0, 1}, // filler
        {1, 1}, // filler
      }, 
    }, 
    {
      // Square
      // . . .
      // . X X
      // . X X
      {
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
        {1, 1}, 
        {0, 0}, // filler
      }, 
      {
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
        {1, 1}, 
        {0, 0}, // filler
      }, 
      {
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
        {1, 1}, 
        {0, 0}, // filler
      }, 
      {
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
        {1, 1}, 
        {0, 0}, // filler
      }, 
    },
    {   // L shape
      // . . .
      // X X X
      // . . X
      {
        {-1, 0}, 
        {0, 0}, 
        {1, 0}, 
        {1, -1}, 
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {0, 0}, 
        {1, 1}, 
        {0, 1}, 
        {0, 0}, // filler
      }, 
      {
        {-1, 1}, 
        {-1, 0}, 
        {0, 0}, 
        {1, 0}, 
        {0, 0}, // filler
      }, 
      {
        {0, -1}, 
        {-1, -1}, 
        {0, 0}, 
        {0, 1}, 
        {0, 0}, // filler
      }, 
    },
    {   // Plus 
      // . X .
      // X X X
      // . X .
      {
        {-1, 0}, 
        {0, -1}, 
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
      }, 
      {
        {-1, 0}, 
        {0, -1}, 
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
      }, 
      {
        {-1, 0}, 
        {0, -1}, 
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
      }, 
      {
        {-1, 0}, 
        {0, -1}, 
        {0, 0}, 
        {0, 1}, 
        {1, 0}, 
      }, 
    },
  };

  int[][][] piece = new int[ROTATION_COUNT][BLOCK_COUNT][2];
  int[] orderSmall = new int[8];
  int[] orderLarge = new int[blockCoordinates.length];
  int currentOrderIndex;
  PImage[] gfx = new PImage[BLOCK_COUNT];
  int x;
  int y;
  int type;
  int tint;
  int rotation;

  // constructor creates initial orders and piece
  Piece()
  {
    orderSmall = generatePieceOrder();
    orderLarge = generatePieceOrder();
    generatePieceFromOrder();
  }

  // display piece as textured images with a specific tint applied
  void render()
  {
    pushMatrix();
    translate(x, y);
    tint(tint);
    for (int i = 0; i < BLOCK_COUNT; i++)
    {
      image(gfx[i], piece[rotation][i][0] * BLOCK_SIZE, piece[rotation][i][1] * BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE);
    }
    noTint();
    popMatrix();
  }

  // display white translucent beam to preview where the piece will land
  void renderBeam()
  {
    noStroke();
    fill(255, 255, 255, 64);

    int minY = 0;
    int maxY = 0;

    for(int i = 0; i < piece[rotation].length; i++)
    {
      int[] coord = piece[rotation][i];

      if(coord[1] > maxY)
      {
        maxY = coord[1];
      }

      if(coord[1] < minY)
      {
        minY = coord[1];
      }
    }

    rect(grid.gridX(), y + minY * BLOCK_SIZE, grid.width() * BLOCK_SIZE, BLOCK_SIZE + (maxY - minY) * BLOCK_SIZE);
  }

  // generates a piece from either 'orderSmall' or 'orderLarge'
  void generatePieceFromOrder()
  {
    // pick piece type by stepping through order array, if it hits the end, generate a new order
    if (this.currentOrderIndex < gameManager.pieceAmount - 1)
    {
      if (gameManager.pieceAmount == 8)
        this.type = orderSmall[this.currentOrderIndex];
      else
        this.type = orderLarge[this.currentOrderIndex];
    }
    else
    {
      if (gameManager.pieceAmount == 8)
      {
        this.orderSmall = generatePieceOrder();
        this.type = orderSmall[this.currentOrderIndex];
      }
      else
      {
        this.orderLarge = generatePieceOrder();
        this.type = orderLarge[this.currentOrderIndex];
      }
    }

    // initialize piece variables
    this.rotation = 0;
    this.piece = blockCoordinates[this.type];
    this.tint = tints[this.type];
    this.currentOrderIndex++;
    gameManager.piecesused++; //increment total pieces used each time

    // load random textures for every block of the piece
    for (int i = 0; i < BLOCK_COUNT; i++)
    {
      gfx[i] = loadImage(textures[int(random(0, textures.length))]);
    }

    this.x = int(0); // initialize piece x
    this.y = int(90 + (int(random(1, 7)) * BLOCK_SIZE)) ; // initialize piece y 
    println("piece.type: " + this.type);
  }

  // generate a piece order
  int[] generatePieceOrder()
  {
    // initialize empty array of size 'gameManager.pieceAmount'
    int[] arr = new int[gameManager.pieceAmount];

    // fill entire array with 0, 1, 2, 3, etc
    for (int i = 0; i < arr.length; i++)
    {
      arr[i] = i;
    }

    // shuffle array, print final order and reset the order index
    shuffleArray(arr);
    printPieceOrder(arr);
    this.currentOrderIndex = 0;

    // return entire array
    return arr;
  }

  // random shuffling algorithm
  int[] shuffleArray(int[] arr)
  {
    for (int i = 0; i < arr.length; i++)
    {
      int a = (int)random(0, arr.length);
      int b = arr[i];

      arr[i] = arr[a];
      arr[a] = b;
    }
    return arr;
  }

  // print the array in a nice fashion
  void printPieceOrder(int[] arr)
  {
    for (int i = 0; i < arr.length; i++)
    {
      println("order[",+i,"],", + arr[i]);
    }
  }

  // move a piece per grid cell
  void move(Grid grid, int x, int y)
  {
    if (gameManager.spawnpiece)
    {
      int[] w2g = world2grid();

      int[][] piece = this.piece[rotation];

      // if piece collides with something in the grid or hits the bottom, add the piece to the grid and generate a new one
      for (int[] coord : piece)
      {
        if (w2g[0] + coord[0] == grid.width() - 1)
        {
          grid.addPiece(this, w2g[0], w2g[1]);
          asset.pop.play();
          generatePieceFromOrder();
          return;
        }
        else if (grid.getState(w2g[0] + coord[0] + 1, w2g[1] + coord[1]) > 0)
        {
          grid.addPiece(this, w2g[0], w2g[1]);
          asset.pop.play();
          generatePieceFromOrder();
          return;
        }
        else if (grid.getState(w2g[0] + coord[0] - 1 + x, w2g[1] + coord[1] + y) > 0)
        {
          return;
        }
      }

    this.x += BLOCK_SIZE * x;
    this.y += BLOCK_SIZE * y;
    }
  }

  // converts a world x y to a grid x y
  int[] world2grid() {
    int grid_x = (x / BLOCK_SIZE) + 1;
    int grid_y = (y / BLOCK_SIZE) - 1;
    return new int[] {grid_x, grid_y};
  }
}
