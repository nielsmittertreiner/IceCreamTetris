class GameManager
{
    //-1 = paused, 0 = starting menu, 1 = game
    int gameState = 0;
    int score = 0, difficulty = 0;
    
    
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
        if(key == 's'&& keyPressed)
        {
            currentPiece.y+=80;
            if(currentPiece.y> 650)
            {
                currentPiece.y = 650;
            }
            key = 'q';
        }
        if(key == 'w'&& keyPressed)
        {
            currentPiece.y-=80;
            if(currentPiece.y< 90)
            {
                
                currentPiece.y = 90;
            }
            key = 'q';
        }
        if(key == 'a'&& keyPressed)
        {
            currentPiece.x+=80;
           
            key = 'q';
        }
        // angel = angel+90;
        // if(key == 'y'&& keyPressed)
        // {
        //     push();
        //     translate(currentPiece.x,currentPiece.y);
        //     rotate(angel);
        //     pop();
        //     key = 'q';
        // }
        
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
        if (key == 'd' && keyPressed) 
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
    
    void addScore(int scoreAdded) {
        score += scoreAdded;
        if (score < 0) {
            score = 0;
        }
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