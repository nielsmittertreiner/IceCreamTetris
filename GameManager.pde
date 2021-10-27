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