class MainMenu
{
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
        buttons[1].link = -1;
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
    }
}