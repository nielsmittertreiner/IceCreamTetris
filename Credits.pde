class Credits
{
    int textSize = 50;
    int buttonDistance = 50;
    Button[] buttons;
    
    void draw()
    {
        background(asset.darkBlue); 
        
        textAlign(CENTER, CENTER);
        textSize(textSize);
        fill(asset.white);
        text("CREDITS: \n \n Bas Nierop \n Joel Sarkoh \n Niels Mittertreiner \n Shun Yao Yu \n Steven Klören \n Timo van der Tiel", width / 2, height / 2);
        
        rectMode(CENTER);
        fill(asset.darkRed);
        stroke(asset.white);
        rect(width / 2, height - buttonDistance, button.buttonWidth, button.buttonHeight);
        
        textSize(ui.textSize);
        textAlign(CENTER, CENTER);
        fill(asset.white);
        text("return", width / 2, height - buttonDistance - ui.textSize / 10);
        
        rectMode(CORNER);
        textAlign(LEFT, BASELINE);
    }
    
    void keyInput()
    {
        if (key == 'x' && keyPressed)
        {
            gameManager.gameState = 0;
        }
        keyCode = 'q';
    }
}