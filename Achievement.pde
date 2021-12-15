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
    }



}