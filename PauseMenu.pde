class PauseMenu
{
  int numberButtons = 3;

  Button[] buttons;

  void setup()
  {
    buttons = new Button[numberButtons];
    for (int i = 0; i < numberButtons; i++)
    {
      buttons[i] = new Button();
    }
    buttons[0].text = "RESUME";
    buttons[1].text = "MAIN MENU";
    buttons[2].text = "QUIT";


    buttons[0].link = 1;
    buttons[1].link = 0;
    buttons[2].link = -1;
  }

  void keyInput()
  {
    for (int i = 0; i < numberButtons; i++)
    {
      button.keyInput(buttons[i].link, i, numberButtons, gameManager.selectedButton == i);
    }
  }
  void render()
  {
    riverAnimation.draw(0, height, asset.blue);

    for (int i = 0; i < numberButtons; i++)
    {
      button.draw(buttons[i].text, 0, height, gameManager.selectedButton == i, i + 1, numberButtons);
    }
  }
}
