class Credits
{
    int textSize = 50;
    
    int buttonDistance = 50;

    
    
    void draw()
    {
        background(asset.darkBlue); 
        
        textAlign(CENTER, CENTER);
        textSize(textSize);
        fill(asset.white);
        text("CREDITS: \n \n Bas Nierop \n Joel Sarkoh \n Niels Mittertreiner \n Shun Yao Yu \n Steven Klören \n Timo van der Tiel", width / 2, height / 2);
        
      
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