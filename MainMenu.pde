class MainMenu
{
    int numberButtons = 3, selectedButton = 0;
    
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
                selectedButton = numberButtons -1;
            }
        }
        if (key == 'x' && keyPressed && selectedButton == 0)
        {
            gameManager.gameState = 1;
            keyCode = 'q';
        }
    }
    void draw()
    {
        background(asset.darkBlue); 
        for (int i = 0; i < numberButtons; i++)
        {
            button.draw(selectedButton == i, buttons[i].text, i + 1, numberButtons + 1);
        }
    }
}