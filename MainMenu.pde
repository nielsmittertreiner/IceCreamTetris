class MainMenu
{
  int numberButtons = 4;

  Button[] buttons;

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
    buttons[3].text = "QUIT";

    buttons[0].link = 1;
    buttons[1].link = 5;
    buttons[2].link = 3;
    buttons[3].link = -1;
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
    gameManager.reset();
  }
}
