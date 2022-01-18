class Gamestats
{
  int numberButtons = 1; 
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
    buttons[0].text = "RETURN";

    buttons[0].link = 6;
    connect.getGamestats(gameManager.username);

    

  }

  void render()
  {
    riverAnimation.draw(0, height, asset.blue);
textAlign(CENTER);
textSize(80);
text("Last Game "+gameManager.username+" used:", width/2, height/4);
textSize(30);
text("Time\n (Seconds)" , 350, height/3);
text("Pieces" , 550, height/3);
text("Animals Crossed" , 750, height/3);
text("Storms" , 950, height/3);
text("Combos" , 1150, height/3);
textSize(80);
    connect.printGamestats();

    for (int i = 0; i < numberButtons; i++)
    {
      button.draw(buttons[i].text, buttonY-200, buttonDist, gameManager.selectedButton == i, i + 1, numberButtons);
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
