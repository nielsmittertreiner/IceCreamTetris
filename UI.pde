class UI
{
    int textDistance = 5, textSize = 50;
    
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
    void draw()
    {
        textSize(textSize);
        fill(asset.red);
        text("SCORE:" + gameManager.score, textDistance, textSize);
    }
}