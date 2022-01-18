class Achievement
{

  int numberButtons = 1; 
  Button[] buttons;
  int buttonY = 550; 


  void setup()
  {

    buttons = new Button[numberButtons];

    for (int i = 0; i < numberButtons; i++)
    {
      buttons[i] = new Button();
    }
    buttons[0].text = "RETURN";
    buttons[0].link = 6;
    connect.getAchievements();
  }

  void render()
  {
    riverAnimation.draw(0, height, asset.blue);

    textAlign(CENTER); 
    textSize(75);
    fill(asset.white);
    text("ACHIEVEMENTS", width / 2, 100);

    for (int i = 0; i < numberButtons; i++)
    {
      button.draw(buttons[i].text, buttonY, buttonY, gameManager.selectedButton == i, i + 1, numberButtons);
    }

    connect.printAchievements();
  }


  void keyInput()
  {
    for (int i = 0; i < numberButtons; i++)
    {
      button.keyInput(buttons[i].link, i, numberButtons, gameManager.selectedButton == i);
    }
  }
}
