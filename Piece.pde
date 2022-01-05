class Piece
{
  final int BLOCK_COUNT = 5;
  final int BLOCK_SIZE = 80;
  final int ROTATION_COUNT = 4;
  final int PREVIEW_OFFSET_X = 600;
  final int PREVIEW_OFFSET_Y = 815;
  final int PREVIEW_BLOCK_SIZE = BLOCK_SIZE / 2;

  final String[] textures = 
  { // Texture of the Pieces
    "img/wood_1.png", 
    "img/wood_2.png", 
    "img/wood_3.png", 
    "img/wood_4.png"
  };

  final color[] tints =
  {   // colour of the Pieces
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
  int[] order;
  int currentOrderIndex;
  PImage[] gfx = new PImage[BLOCK_COUNT];
  int x;
  int y;
  int type;
  int tint;
  int rotation;

  Piece()
  {
    this.order = generatePieceOrder();
    generatePieceFromOrder();
  }

  //rendering the Pieces
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

  void renderBeam() {
    noStroke();
    fill(255, 255, 255, 64);

    int minY = 0;
    int maxY = 0;

    for(int i = 0; i < piece[rotation].length; i++) {
      int[] coord = piece[rotation][i];

      if(coord[1] > maxY) {
        maxY = coord[1];
      }

      if(coord[1] < minY) {
        minY = coord[1];
      }
    }

    rect(grid.gridX(), y + minY * BLOCK_SIZE, grid.width() * BLOCK_SIZE, BLOCK_SIZE + (maxY - minY) * BLOCK_SIZE);
  }

  void renderPreview()
  {
    pushMatrix();
    translate(PREVIEW_OFFSET_X, PREVIEW_OFFSET_Y);
    tint(tint);
    for (int i = 0; i < BLOCK_COUNT; i++)
    {
      image(gfx[i], piece[rotation][i][0] * PREVIEW_BLOCK_SIZE, piece[rotation][i][1] * PREVIEW_BLOCK_SIZE, PREVIEW_BLOCK_SIZE, PREVIEW_BLOCK_SIZE);
    }
    noTint();
    popMatrix();
  }

  void generatePieceFromOrder()
  {
    if (this.currentOrderIndex == gameManager.pieceAmount - 1)
    {
        this.order = generatePieceOrder();
    }
    this.rotation = 0;
    this.type = this.order[this.currentOrderIndex];
    this.piece = blockCoordinates[this.type];
    this.tint = tints[this.type];
    this.currentOrderIndex++;

    for (int i = 0; i < BLOCK_COUNT; i++)
    {
      gfx[i] = loadImage(textures[int(random(0, textures.length))]);
    }

    this.x = int(0); // initialize piece x
    this.y = int(90 + (int(random(1, 7)) * BLOCK_SIZE)) ; // initialize piece y 
    println("piece.type: " + this.type);
  }

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

  void printPieceOrder(int[] arr)
  {
    for (int i = 0; i < gameManager.pieceAmount; i++)
    {
      println("order[",+i,"],", + arr[i]);
    }
  }

  void move(Grid grid, int x, int y) {
    if (gameManager.spawnpiece) {
    int[] w2g = world2grid();

    int[][] piece = this.piece[rotation];

    for (int[] coord : piece) {
      if (w2g[0] + coord[0] == grid.width() - 1) {
        grid.addPiece(this, w2g[0], w2g[1]);
        asset.pop.play();
        generatePieceFromOrder();
        //instanceNextPiece();
        return;
      } else if (grid.getState(w2g[0] + coord[0] + 1, w2g[1] + coord[1]) > 0) {
        grid.addPiece(this, w2g[0], w2g[1]);
        asset.pop.play();
        generatePieceFromOrder();
        //instanceNextPiece();
        return;
      } else if (grid.getState(w2g[0] + coord[0] - 1 + x, w2g[1] + coord[1] + y) > 0) {
        return;
      }
    }

    this.x += BLOCK_SIZE * x;
    this.y += BLOCK_SIZE * y;
    }
  }

  int[] world2grid() {
    int grid_x = (x / BLOCK_SIZE) + 1;
    int grid_y = (y / BLOCK_SIZE) - 1;
    return new int[] {grid_x, grid_y};
  }
}


//test
