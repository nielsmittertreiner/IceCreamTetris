class Profile
{
  int numberButtons = 3; 
  Button[] buttons;
  int buttonY = 650; 
  int buttonDist = 300;

  void setup()
  {

    buttons = new Button[numberButtons];

    for (int i = 0; i < numberButtons; i++)
    {
      buttons[i] = new Button();
    }
    buttons[0].text = "STATS";
    buttons[1].text = "ACHIEVEMENTS";
    buttons[2].text = "RETURN";
    
    buttons[0].link = 8;
    buttons[1].link = 7;
    buttons[2].link = 0;

    connect.getBehaald(gameManager.username);
    connect.getprofileStats(gameManager.username);
  }

  void render()
  {
    riverAnimation.draw(0, height, asset.blue);
    textAlign(CENTER); 
    textSize(75);
    fill(asset.white);
    text("PROFILE", width / 2, 100);
    text("Player:"+ gameManager.username, width / 2, 200);

    textSize(42);
    text("Games Played:", 170, 300);
    text("Highscore:", 150, 500);
    connect.printProfileStats();
    text("Reached Achievements:", 1100, 350);
    connect.printBehaald();

    for (int i = 0; i < numberButtons; i++)
    {
      button.draw(buttons[i].text, buttonY-100, buttonDist, gameManager.selectedButton == i, i + 1, numberButtons);
    }
  }


  void keyInput()
  {
    for (int i = 0; i < numberButtons; i++)
    {
      button.keyInput(buttons[i].link, i, numberButtons, gameManager.selectedButton == i);
    }
  }
}
