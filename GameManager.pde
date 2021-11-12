class GameManager
{
    //-1 = paused, 0 = starting menu, 1 = game
    int gameState = 0;
    int score = 0, difficulty = 0;
    int speeddifficulty = 600;
    
    
    void keyInput()
    {
        
        if (keyCode == BACKSPACE && keyPressed)
        {
            keyCode = TAB;
            if (gameManager.gameState == 1)
            {
                gameManager.gameState = 2;
            }
        }
        // going Down
        if(keyCode == DOWN && keyPressed)
        {
            currentPiece.y += 80;
            if(currentPiece.y > 650)
            {
                currentPiece.y = 650;
            }
            key = 'q';
        }
        // going Up
        if(keyCode == UP && keyPressed)
        {
        if (currentPiece.type == 5)
        {
            currentPiece.y -= 80;
            if(currentPiece.y < 170)
            {
                
                currentPiece.y = 170;
            }
            key = 'q';
        }
        else
        {
            currentPiece.y -= 80;
            if(currentPiece.y < 90)
            {
                currentPiece.y = 90;
            }
            key = 'q';
        }
        } // going forward
        if(keyCode == RIGHT && keyPressed)
        {
            
            if (currentPiece.x <=1360) {
                
            
            currentPiece.x+=80;
           
            key = 'q';
        }
        }
        if(keyCode == LEFT && keyPressed)
        {
            currentPiece.rotation = (currentPiece.rotation + 1) % 4;
            keyCode = ENTER;
        }
    
        
        //add 2 to Score by pressing m, take 2 away by pressing l
        if (key == 'm' && keyPressed)
        {
            gameManager.addScore(5);
            key = 'q';
        } 
        if (key == 'l' && keyPressed)
        {
            gameManager.addScore( -5);
            key = 'q';
        }
        
        //up the difficulty by pressing d
        if (key == 'a' && keyPressed) 
        {
            gameManager.setDifficulty(1);
            key = 'q';
        }
        
        //reset both by pressing r
        if (key == 'r' && keyPressed)
        {
            gameManager.reset();
            key = 'q';
        }
    }
    
    void changeSpeedDifficulty()
    {   if(speeddifficulty >= 100){
            speeddifficulty -= (score / 200);
            println(speeddifficulty);
            }
            else {
                println("Maximum Difficultyspeed reached!");
            } 

        
    }
        
    void addScore(int scoreAdded) {
        score += scoreAdded;
        if (score < 0) {
            score = 0;
        }
        changeSpeedDifficulty();
}
    
    void setDifficulty(int difficultyAdded) {
        difficulty += difficultyAdded;
}
    
    void reset() {
        difficulty = 0;
        score = 0;
        gameState = 0;
}
}