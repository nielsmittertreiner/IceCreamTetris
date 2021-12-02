   
class Highscore
{
  int numberButtons = 1;
    int buttonY = 550;

    Button[] buttons;

    void setup()
    {
        buttons = new Button[numberButtons];
        for (int i = 0; i < numberButtons; i++)
        {
            buttons[i] = new Button();
        }
        buttons[0].text = "RETURN";

void setup()
{

  connect.gettable();


}


  void render()
  {
    riverAnimation.draw(0, height, asset.blue);
    connect.printTable(); 

    for (int i = 0; i < numberButtons; i++)
        {
            button.draw(buttons[i].text, 0, height, gameManager.selectedButton == i,  i + 1, numberButtons);
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
