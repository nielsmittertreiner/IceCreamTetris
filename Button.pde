class Button
{
    String text;
    int link;
    int buttonWidth = 300, buttonHeight = 60;
    
    void draw(String text, float top, float bottom, boolean selected, int number, int total)
    {
        float y = top + (bottom / (total + 1)) * number;
        rectMode(CENTER);
        fill(asset.darkRed);
        if (selected)
        {
            stroke(asset.white);
        }
        else
        {
            stroke(asset.grey);
        }
        rect(width / 2, y, buttonWidth, buttonHeight);
        
        textSize(ui.textSize);
        textAlign(CENTER, CENTER);
        if (selected)
        {
            fill(asset.white);
        }
        else
        {
            fill(asset.grey);
        }
        text(text, width / 2, y - ui.textSize / 10);
        
        rectMode(CORNER);
        textAlign(LEFT, BASELINE);
    }
    
    void keyInput(int link, int button, int numberButtons, boolean selected)
    {
        if (selected)
        {
            if (gameManager.usedKey == 'x')
            {
                gameManager.selectedButton = 0;
                gameManager.gameState = link;
            }
            
            if (gameManager.usedKey == 'D')
            {
                gameManager.selectedButton += 1;
                if (gameManager.selectedButton == numberButtons)
                {
                    gameManager.selectedButton = 0;
                }  
            }
            
            if (gameManager.usedKey == 'U')
            {
                gameManager.selectedButton -= 1;
                if (gameManager.selectedButton == -1)
                {
                    gameManager.selectedButton = numberButtons - 1;
                }
            }
            gameManager.usedKey = ' ';
        }
    }
    
}
