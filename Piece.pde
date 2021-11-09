class Piece
{
    final int BLOCK_COUNT = 5;
    final int BLOCK_SIZE = 80;
    final int ROTATION_COUNT = 4;

    int last;
    int m;

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
        asset.black
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
                {0,-1},
                {-1,0},
                {0,0},
                {0,1},
                {0,0}, // filler
            },
            {
                {0,-1},
                {-1,0},
                {0,0},
                {1,0},
                {0,0}, // filler
            },
            {
                {0,-1},
                {0,0},
                {1,0},
                {0,1},
                {0,0}, // filler
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
                {1 ,0},
                {1, 1},
            },
            {
                {-1,-1},
                {0,-1},
                {0,0},
                {-1,1},
                {0,1},
            },
            {
                {-1,-1},
                {1,-1},
                {-1,0},
                {0,0},
                {1,0},
            },
            {
                {0,-1},
                {1,-1},
                {0,0}
                {0,1},
                {1,1},
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
                {0,0},
                {0,1},
                {-1,1},
                {0,0}, // filler
                {0,0}, // filler
            },
            {
                {-1,-1},
                {-1,0},
                {0,0},
                {0,0}, // filler
                {0,0}, // filler
            },
            {
                {0,-1},
                {1,-1},
                {0,0},
                {0,0}, // filler
                {0,0}, // filler
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
                {-1,-1},
                {-1,0},
                {0,0},
                {0,1},
                {0,0}, // filler
            },
            {
                {0,-1},
                {1,-1},
                {-1,0}, 
                {0,0},
                {0,0}, // filler
            },
            {
                {0,-1},
                {0,0},
                {1,0},
                {1,1},
                {0,0}, // filler
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
                {0,-1},
                {0,0},
                {-1,1},
                {0,1},
                {0,0}, // filler
            },
            {
                {-1,-1},
                {-1,0},
                {0,0},
                {1,0},
                {0,0}, // filler
            },
            {
                {0,-1},
                {1,-1},
                {0,0},
                {0,1},
                {0,0}, // filler
            },
        } ,
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
                {0,-1},
                {0,0},
                {0,1},
                {0,0}, // filler
                {0,0}, // filler
            },
            {
                {-1, 0}, 
                {0, 0}, 
                {1, 0},
                {0, 0}, // filler
                {0, 0}, // filler
            },
            {
                {0,-1},
                {0,0},
                {0,1},
                {0,0}, // filler
                {0,0}, // filler
            },
        }
    };
    
    int[][][] piece = new int[ROTATION_COUNT][BLOCK_COUNT][2];
    PImage[] gfx = new PImage[BLOCK_COUNT];
    int x = int(width / 2);
    int y = 0;
    int type;
    int tint;
    int rotation;
 // Generate of the Pieces
    Piece(int type)
    {
        this.type = type;
        this.rotation = 0;
        this.piece = blockCoordinates[type];
        this.tint = tints[type];

        for (int i = 0; i < BLOCK_COUNT; i++)
        {
            gfx[i] = loadImage(textures[int(random(0, textures.length))]);
        }
        
        // testing only
        this.x = int(0); // center piece x
        this.y = int(170); // center piece y
        println("type: " + type);
    }
    

    void render()
    {  //rendering the Pieces
        pushMatrix();
        translate(x, y); // verander dit naar grid x y later
        tint(tint);
        for (int i = 0; i < BLOCK_COUNT; i++)
        {
            image(gfx[i], piece[rotation][i][0] * BLOCK_SIZE, piece[rotation][i][1] * BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE);
        }  
        popMatrix();   
        // generate next Pieces
        if (currentPiece.x >= 1440) {
                currentPiece.x = 1440;
                currentPiece = new Piece(int(random(0,7)));
            }
        m = millis() - last;
        // movement Pieces
        if (millis() > last + gameManager.speeddifficulty) {
            last = millis();
            this.x += 80;
        }   
    }
}
