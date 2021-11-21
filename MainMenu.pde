class MainMenu
{
    int numberButtons = 3, selectedButton = 0;
    
    Button[] buttons;
    
    float speed = 1.05;
    float offset = 0;
    float offset2 = 0;
    PImage mainmenu;
     PImage water;
    PImage water2;
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
        mainmenu =loadImage("img/mainmenu.png");
           water = loadImage("img/water.jpg");   
        water2 = loadImage("img/water2.jpg");
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
                selectedButton = numberButtons - 1;
            }
        }
        if (key == 'x' && keyPressed)
        {
            switch(selectedButton)
            {
                case 0:
                    gameManager.gameState = 1;
                    break;

                case 2:
                    gameManager.gameState = 3;
                    break;
            }
            keyCode = 'q';
        }
    }
    void draw()
    {
        offset += speed;
        if (offset >= width)
        {
            offset = 0;
        }

        offset2 += speed * 3;
        if (offset2 >= width)
        {
            offset2 = 0;
        }
         tint(15,115,250, asset.opacity);
        image(water, offset, 0, width, height);
        image(water, offset - width, 0, width, height);

        tint(15,115,250, asset.opacity);
        image(water2, offset2, 0, width, height);
        image(water2, offset2 - width, 0, width, height);

        tint(255, 255);
       // image(mainmenu, 0, 0, width, height); 
      
        for (int i = 0; i < numberButtons; i++)
        {
            button.draw(selectedButton == i, buttons[i].text, i + 1, numberButtons + 1);
        }
    }
}