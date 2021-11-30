class PauseMenu
{
  int numberButtons = 2, selectedButton = 0;

  Button[] buttons;

  void setup()
  {
    buttons = new Button[numberButtons];
    for (int i = 0; i < numberButtons; i++)
    {
      buttons[i] = new Button();
    }
    buttons[0].text = "RESUME";
    buttons[1].text = "QUIT";
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
    {
      if (selectedButton == 0)
      {
        gameManager.gameState = 1;
        keyCode = 'q';
      } else
      {
        exit();
      }
    }
  }
  void draw()
  {
    riverAnimation.draw(0, height, asset.blue);
    for (int i = 0; i < numberButtons; i++)
    {
      button.draw(selectedButton == i, buttons[i].text, i + 1, numberButtons + 1);
    }
  }
} 
