class Credits
{
<<<<<<< HEAD
    int textSize = 50;
    int buttonY = 540;
    
    int numberButtons = 1;
    
    Button[] buttons;
    
    void setup()
    {
        buttons = new Button[numberButtons];
        for (int i = 0; i < numberButtons; i++)
        {
            buttons[i] = new Button();
        }
        buttons[0].text = "RETURN";
    }
    
    void draw()
    {
        background(asset.darkBlue); 
        
        textAlign(CENTER, CENTER);
        textSize(textSize);
        fill(asset.white);
        text("CREDITS: \n \n Bas Nierop \n Joel Sarkoh \n Niels Mittertreiner \n Shun Yao Yu \n Steven Klören \n Timo van der Tiel", width / 2, height / 2);
        
        for (int i = 0; i < numberButtons; i++)
        {
            button.draw(buttons[i].text, buttonY, buttonY, gameManager.selectedButton == i,  i + 1, numberButtons);
        }
    }
    
    void keyInput()
    {
        for (int i = 0; i < numberButtons; i++)
        {
            button.keyInput(buttons[i].link, i, numberButtons, gameManager.selectedButton == i);
        } 
=======
  int textSize = 50;

  int buttonDistance = 50;




  void draw()
  {
    riverAnimation.draw(0, height, asset.blue);

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
>>>>>>> 79d8fb5 (Sound and database connection)
    }
    keyCode = 'q';
  }
}
