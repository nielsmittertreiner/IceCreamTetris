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
        {0,0} ,
        {0,0} ,
        {0,0} ,
        { - 1,0} ,
        {0,0} ,
        {1,0} ,
        {0,0} ,
        {0,1} ,
        {0,0} ,
        } ,
        { // C shape
            //. . .
            //X X X
            //X . X
            {0,0} ,
            {0,0} ,
            {0,0} ,
            { - 1,0} ,
            {0,0} ,
            {1,0} ,
            { - 1,1} ,
            {0,0} ,
            {1,1} ,
        } ,
        { // stairs
            //. . .
            //. X X
            //. . X
            {0, 0} , 
            {0, 0} , 
            {0, 0} ,
            {0, 0} ,
            {0, 0} ,
            {1, 0} ,
            {0, 0} ,
            {0, 0} ,
            {1, 1} ,
        } ,
        { // snake
            //. . .
            //. X X
            //X X .
            {0, 0} , 
            {0, 0} , 
            {0, 0} ,        
            {0, 0} ,
            {0, 0} ,
            {1, 0} ,
            { - 1, 1} ,
            {0, 1} ,
            {0, 0} ,
        } ,
        { // L shape
            //. . .
            //X X X
            //. . X
            {0, 0} , 
            {0, 0} , 
            {0, 0} ,
            { - 1, 0} ,
            {0, 0} ,
            {1, 0} ,
            {0, 0} ,
            {0, 0} ,
            {1, 1} ,
        } ,
        { // plus
            //. X .
            //X X X
            //. X .
            {0, 0} , 
            {0, -1} , 
            {0, 0} ,
            { - 1, 0} , 
            {0, 0} , 
            {1, 0} ,
            {0, 0} , 
            {0, 1} , 
            {0, 0} ,
        } ,
        { // square
            //. . .
            //. X X
            //. X X
            {0, 0} , 
            {0, 0} , 
            {0, 0} ,
            {0, 0} ,
            {0, 0} ,
            {1, 0} ,
            {0, 0} ,
            {0, 1} ,
            {1, 1} ,
        } ,
        { // rectangle
            //. . .
            //X X X
            //. . .
            {0, 0} , 
            {0, -1} , 
            {0, 0} ,
            {0, 0} ,
            {0, 0} ,
            {0, 0} ,
            {0, 0} ,
            {0, 1} ,
            {0, 0} ,
        }
    };
    
    int[][] piece = new int[9][2];
    int x = int(width / 2);
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
        println("type: " + type);
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
        this.x += 4;
        if (currentPiece.x >= 1440)
            {
            currentPiece = new Piece(nextPiece.type);
            println(this.x);
            println(this.y);
            grid.addPiece(currentPiece,calculateXposition(this.x),calculateYposition(this.y));
            nextPiece = new Piece(int(random(0,7)));
            this.x = 1440;
        }
        
        
    }   
    int calculateXposition(int xPosition)
        {
        println("old" + xPosition);
            switch(xPosition) {
                case -80:
                   return 0;
                    case 0 :
                   return 1;
                    case 80 :
                   return 2;
                    case 160 :
                   return 3;
                    case 240 :
                   return 4;
                    case 320 :
                   return 5;
                   case 400 :
                   return 6;
                   case 480 :
                   return 7;
                   case 560 :
                   return 8;
                  case 640 :
                   return 9;
                   case 720 :
                   return 10;
                   case 800 :
                   return 11;
                   case 880 :
                   return 12;
                   case 960 :
                   return 13;
                   case 1040 :
                   return 14;
                   case 1120 :
                   return 15;
                   case 1200 :
                   return 16;
                   case 1280 :
                   return 17;
                   case 1360 :
                   return 18; 
                    case 1440 :
                   return 19;
                   default :
                   println("can not calculate xPosition.");
                  return -1;    
            }
    }
        int calculateYposition(int yPosition)
        {
            println("old" + yPosition);
            
            switch(yPosition) {
                case 90 :
                   return 0;
                    case 170 :
                   return 1;
                    case 250 :
                   return 2;
                    case 330 :
                   return 3;
                    case 410 :
                   return 4; 
                    case 490 :
                   return 5;                   
                    case 570 :
                   return 6;                    
                    case 650 :
                   return 7;
                   default :
                   println("can not calculate yPosition.");
                  return -1;    
            }
            
        }
    }
        // classPiece
        // {
           //   final int[][] theSquare = {{0,0} ,{0,1} ,{1,0} ,{1,1} };
           //   final int[][] theLine = {{0,0} ,{1,0} ,{2,0} ,{3,0} };
           //   final int[][] theStair = {{0,0} ,{1,0} ,{1,1} ,{2,1} };
           //   final int[][] shapeL = {{0,0} ,{0,1} ,{1,0} ,{2,0} };
           //   final int[][] theSnake = {{0,0} ,{1,0} ,{1,1} ,{2,1} };
           //   final int[][] theShape;
           //   final int[][] r,g,b, choice;
           //   privateboolean isActive;
           //   privateint w;
           //   public Piece()
           //   {
            //     w = width / 9;
             //     choice = (int)random(5);
             //     switch(choice) {
               //       case 0:
                   //       theShape = theSquare;
                  //       r = 155;
                   //       break;
               //       case 1:
                   //       theShape = theLine;
                   //       g = 155;
                   //       break;
               //       case 2:
                   //       theShape = theStair;
                   //       b = 155;
                   //       break;
               //       case 3:
                   //       theShape = shapeL;
                   //       r = 155;
                   //       g = 155;
                   //       break;
               //       case 4:
                   //       theShape = theSnake;
                   //       g = 155;
                   //       b = 155;
                   //       break;
         //     }
                
       //   }
           //   public void display()
           //   {
             //     for (i = 0;i < 4;i++)
             //     {
               //       rect(theShape[i][0] * BLOCK_SIZE,theShape[i][1] * BLOCK_SIZE,BLOCK_SIZE,BLOCK_SIZE);
                    
         //     }
                
       //   }
            
            
        // }