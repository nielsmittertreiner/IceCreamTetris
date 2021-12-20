class Profile
{

int numberButtons = 2; 
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
    buttons[0].text = "ACHIEVEMENT";
    buttons[1].text = "RETURN";

    buttons[0].link = 7;
    buttons[1].link = 0;

}

void render()
{
  riverAnimation.draw(0, height, asset.blue);

  textAlign(CENTER); 
  textSize(75);
  fill(asset.white);
  text("PROFILE", width / 2, 100);

    for (int i = 0; i < numberButtons; i++)
    {
      button.draw(buttons[i].text, buttonY, buttonDist, gameManager.selectedButton == i, i + 1, numberButtons);
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