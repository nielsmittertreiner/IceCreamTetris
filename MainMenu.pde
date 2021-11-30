class MainMenu
{
<<<<<<< HEAD
    int numberButtons = 3;
    
    Button[] buttons;
    
    float speed = 1.05;
    float offset = 0;
    float offset2 = 0;
   
    void setup()
    {
        buttons = new Button[numberButtons];
        for (int i = 0; i < numberButtons; i++)
        {
            buttons[i] = new Button();
        }
        buttons[0].text = "PLAY";
        buttons[1].text = "HIGHSCORE";
        buttons[2].text = "CREDITS";

        buttons[0].link = 1;
        buttons[1].link = 5;
        buttons[2].link = 3;
    }
    
    void keyInput()
    {
        for (int i = 0; i < numberButtons; i++)
        {
            button.keyInput(buttons[i].link, i, numberButtons, gameManager.selectedButton == i);          
        }
    }
    void draw()
    {
        riverAnimation.draw(0, height, asset.blue);
      
        for (int i = 0; i < numberButtons; i++)
        {
            button.draw(buttons[i].text, 0, height, gameManager.selectedButton == i,  i + 1, numberButtons);
        }
        gameManager.reset();
    }
}
=======
  int numberButtons = 3, selectedButton = 0;
  Button[] buttons;

  float speed = 1.05;
  float offset = 0;
  float offset2 = 0;

  PImage water;
  PImage water2;
  void setup()
  {
    buttons = new Button[numberButtons];
    for (int i = 0; i < numberButtons; i++)
    {
      buttons[i] = new Button();
    }
    buttons[0].text = "PLAY";
    buttons[1].text = "HIGHSCORE";
    buttons[2].text = "CREDITS";
  }

  void keyInput()
  {
    if (keyCode == DOWN && keyPressed)
    {
      selectedButton += 1;
      keyCode = TAB;
      if (selectedButton == numberButtons)
      {
        selectedButton = 0;
      }
    }
    if (keyCode == UP && keyPressed)
    {
      selectedButton -= 1;
      keyCode = TAB;
      if (selectedButton == -1)
      {
        selectedButton = numberButtons - 1;
      }
    }
    if (key == 'x' && keyPressed)
      switch(selectedButton)
    {
    case 0:
      gameManager.gameState = 1;
      break;
      
     case 1:
     gameManager.gameState = 2;
      break;

    case 2:
      gameManager.gameState = 3;
      break;
    }
    keyCode = 'q';
  }

  void draw()
  {
    riverAnimation.draw(0, height, asset.blue);
    textSize(20);
    text("press X",width/2,100);
    for (int i = 0; i < numberButtons; i++)
    {
      button.draw(selectedButton == i, buttons[i].text, i + 1, numberButtons + 1);
    }
    
  }
}
>>>>>>> 79d8fb5 (Sound and database connection)
