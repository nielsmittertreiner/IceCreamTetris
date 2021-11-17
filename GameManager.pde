class GameManager
{
    //-1 = paused, 0 = starting menu, 1 = game
    int gameState = 0;
    int score = 0, difficulty = 0;
    int speeddifficulty = 600;
    int selectedButton;
    int timer = 0, timerTotal = 30;
    char usedKey = ' ';
    
    void update()
    {
        if (keyPressed && timer >= timerTotal)
        {
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
                else if (keyCode == RIGHT)
                {
                    usedKey = 'R';
                }
                if (keyCode == BACKSPACE)
                {
                    usedKey = 'E';
                }
            }
            else
            {
                usedKey = key;
            }
            timer = 0;
        }
        else
        {
            usedKey = ' ';
        }     
        timer++;
    }
    
    void keyInput()
    {
        
        if (gameManager.usedKey == 'E')
        {
            if (gameManager.gameState == 1)
            {
                gameManager.gameState = 2;
            }
        }
        if (gameManager.usedKey == 'D')
        {
            currentPiece.y += 80;
            if (currentPiece.y > 650)
            {
                currentPiece.y = 650;
            }
        }
        if (gameManager.usedKey == 'U')
        {
            if (currentPiece.type == 5)
            {
                currentPiece.y -= 80;
                if (currentPiece.y < 170)
                {                    
                    currentPiece.y = 170;
                }
            }
            else
            {
                currentPiece.y -= 80;
                if (currentPiece.y < 90)
                {
                    
                    currentPiece.y = 90;
                }
            }
        }
        if (gameManager.usedKey == 'R')
        {
            
            if (currentPiece.x <=  1360)
            {
                
            }                
            currentPiece.x += 80;
        }
        
        // angel = angel+90;
        // if (gameManager.usedKey == 'y')
    // {
        //  push();
        //  translate(currentPiece.x,currentPiece.y);
        //  rotate(angel);
        //  pop();
// }
    
    //add 2 to Score by pressing m, take 2 away by pressing l
    if (gameManager.usedKey == 'm')
        {
        gameManager.addScore(5);
    } 
    if (gameManager.usedKey == 'l')
        {
        gameManager.addScore( -5);
    }
    
    //up the difficulty by pressing d
    if (gameManager.usedKey == 'a') 
        {
        gameManager.setDifficulty(1);
    }
    
    //reset both by pressing r
    if (gameManager.usedKey == 'r')
        {
        gameManager.reset();
        }
    
}
void changeSpeedDifficulty()
    {  
    if (speeddifficulty >= 100)
        {
        speeddifficulty -= (score / 200);
        //println(speeddifficulty);
        }
    else
        {
        //println("Maximum Difficultyspeed reached!");
        }     
    }

void addScore(int scoreAdded)
    {
    score += scoreAdded;
    if (score < 0) {
        score = 0;
        }
    changeSpeedDifficulty();
    }

void setDifficulty(int difficultyAdded)
    {
    difficulty += difficultyAdded;
    }

void reset()
    {
    difficulty = 0;
    score = 0;
    gameState = 0;
    }
}