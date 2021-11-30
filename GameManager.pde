class GameManager
{
    //-1 = paused, 0 = starting menu, 1 = game
    int gameState = 0;
    int score = 0, difficulty = 0;
    int speeddifficulty = 600;
    int selectedButton;
    char usedKey = ' ';
    int timer = 0, timerTotal = 30;
    
    PImage heart = new PImage();
    float xHearts;
    int yHearts = 815;
    int heartsSize = 80;

    int health = 5;
    

    void update()
    {   
        
        timer++;
        
        if (keyPressed && timer > timerTotal)
        {
            timer = 0;
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    usedKey = 'U';
                }
                else if (keyCode == DOWN)
                {
                    usedKey = 'D';
                }
                else if (keyCode == LEFT)
                {
                    usedKey = 'L';
                }
            }
            else
            {
                usedKey = key;
            }
        } else if (keyPressed & keyCode == RIGHT)
        {   
          usedKey = 'R';
        }
        else
        {
            usedKey = 0;
        }
    }
    
    void keyInput()
    {
        // going Down
        if (usedKey == 'D')
            {
            currentPiece.move(grid, 0, 1);// currentPiece.y+=80;
            changeFit();
        } 
        
        // going Up
        if (usedKey == 'U')
            {
            
            currentPiece.move(grid, 0, -1);// currentPiece.y -= 80;   
            changeFit();
        } 
        
        
        // going forward
        if (usedKey == 'R')
            {
            if (currentPiece.x <= 1360)
                {
                currentPiece.move(grid, 1, 0);// currentPiece.x+=80;
            }
        }
        if (usedKey == 'L')
            { 
            currentPiece.rotation = (currentPiece.rotation + 1) % 4;        
            changeFit();      
        }
        
        //add 2 to Score by pressing m, take 2 away by pressing l
        if (usedKey == 'm')
            {
            gameManager.addScore(5);
        } 
        if (usedKey == 'l')
            {
            gameManager.addScore( -5);
        }
        
        //up the difficulty by pressing d
        if (gameManager.usedKey == 'd') 
            {
            //gameManager.setDifficulty(1);
        }
        
        //reset both by pressing r
        if (gameManager.usedKey == 'r')
        {
            gameManager.reset();
        }
        
        //pause game
        if (gameManager.usedKey == 'E')
        {
            gameManager.gameState = 2;
        }
        if (gameManager.usedKey == 'y')
        {
            gameManager.reset();
            gameManager.gameState = 4;
            
        }
    }
    
    void addScore(int scoreAdded)
    {
        score += scoreAdded;
        if (score < 0)
        {
            score = 0;
        }
        changeSpeedDifficulty();
    }
    
    void changeSpeedDifficulty()
        {
        if (speeddifficulty >= 100)
            {
            speeddifficulty -= (score / 200);
            println(speeddifficulty);
        }
        else
            {
            println("MaximumDifficultyspeed reached!");
        }       
    }
    
    
    void changeFit()
        {
        if (currentPiece.type == 0) 
            {   
            if (currentPiece.rotation == 0)
                {
                if (currentPiece.y < 90)
                    {
                    currentPiece.y = 90;
                }
            }
            if (currentPiece.rotation == 1 || currentPiece.rotation == 2 || currentPiece.rotation == 3)
                {
                if (currentPiece.y < 170)
                    {
                    currentPiece.y = 170;
                    
                }   
            }
            
            if (currentPiece.rotation == 0 || currentPiece.rotation == 1 || currentPiece.rotation == 3)
                {
                if (currentPiece.y > 650)
                    {
                    currentPiece.y = 650;
                }
            }
            if (currentPiece.rotation == 2)
                {
                if (currentPiece.y > 730)
                    {
                    currentPiece.y = 730;
                }   
            }
            
        }
        
        if (currentPiece.type == 1) 
            {
            
            if (currentPiece.rotation == 0 || currentPiece.rotation == 2)
                {
                if (currentPiece.y < 90)
                    {
                    currentPiece.y = 90;
                }
            }
            if (currentPiece.rotation == 1 || currentPiece.rotation == 3)
                {
                if (currentPiece.y < 170)
                    {
                    currentPiece.y = 170;
                }       
            }
            
            if (currentPiece.y > 650)
                {
                currentPiece.y = 650;
            }
        }
        
        if (currentPiece.type ==  2) 
            {
            
            if (currentPiece.rotation == 0 || currentPiece.rotation == 2)
                {
                if (currentPiece.y < 90)
                    {
                    currentPiece.y = 90;
                }
            }
            if (currentPiece.rotation == 1 || currentPiece.rotation == 3)
                {
                if (currentPiece.y < 170)
                    {
                    currentPiece.y = 170;
                }           
            }
            
            if (currentPiece.y > 650)
                {
                currentPiece.y = 650;
            }
        }
        
        if (currentPiece.type == 3) 
            {
            
            if (currentPiece.rotation ==  0)
                {
                if (currentPiece.y < 90)
                    {
                    currentPiece.y = 90;
                }
            }
            if (currentPiece.rotation == 1  || currentPiece.rotation == 2 || currentPiece.rotation == 3)
                {
                if (currentPiece.y < 170)
                    {
                    currentPiece.y = 170;
                }     
            }
            
            if (currentPiece.rotation == 0 || currentPiece.rotation == 1 || currentPiece.rotation == 3)
                {
                if (currentPiece.y > 650)
                    {
                    currentPiece.y = 650;
                }
            }
            if (currentPiece.rotation == 2)
                {
                if (currentPiece.y > 730) {
                    currentPiece.y = 730;
                }           
            }
        }
        
        if (currentPiece.type == 4) 
            {
            
            if (currentPiece.rotation == 0  || currentPiece.rotation == 2)
                {
                if (currentPiece.y < 90)
                    {
                    currentPiece.y = 90;
                }
            }
            if (currentPiece.rotation == 1 || currentPiece.rotation == 3)
                {
                if (currentPiece.y < 170)
                    {
                    currentPiece.y = 170;
                }
                
            }
            
            if (currentPiece.rotation == 1 || currentPiece.rotation == 3)
                {
                if (currentPiece.y > 650)
                    {
                    currentPiece.y = 650;
                }
            }
            if (currentPiece.rotation == 0 || currentPiece.rotation == 2)
                {
                if (currentPiece.y > 730) {
                    currentPiece.y = 730;
                }           
            }
            
        }
        
        if (currentPiece.type == 5) 
            {
            if (currentPiece.y < 170)
                {
                currentPiece.y = 170;
            }
            if (currentPiece.y > 650)
                {
                currentPiece.y = 650;
            }
        }
        
        if (currentPiece.type == 6) 
            {
            if (currentPiece.y < 90)
                {
                currentPiece.y = 90;
            }
            if (currentPiece.y > 650)
                {
                currentPiece.y = 650;
            } 
        }
        
        if (currentPiece.type == 7) 
            {
            if (currentPiece.y < 90)
                {
                currentPiece.y = 90;
            }
            if (currentPiece.y > 650)
                {
                currentPiece.y = 650;
            } 
        }
    }
    
    void reset()
    {
        difficulty = 0;
        score = 0;
        icecreamsystem.resettimer();
         for (int i = 0; i < 20; ++i) {
                grid.removeRow(i);
            }
    }


void setup(){

     heart = loadImage("img/heart.png");

}
    
void removeHealth(){

    health -= 1;
}


    void draw(){
       for (int i = 0; i < health; ++i) {
           noFill();
           image(heart,xHearts + i * 100, yHearts, heartsSize, heartsSize);
       }

       if (health == 0 && gameManager.gameState == 1){

           gameManager.gameState = 4;
       }
    }
}


// test
