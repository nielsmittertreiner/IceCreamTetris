class MainMenu
{
    int numberButtons = 3;
    
    Button[] buttons;
    
    float speed = 1.05;
    float offset = 0;
    float offset2 = 0;
   
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

        buttons[0].link = 1;
        buttons[1].link = -1;
        buttons[2].link = 3;
      
        water = loadImage("img/water.jpg");   
        water2 = loadImage("img/water2.jpg");
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
         tint(asset.blue, asset.opacity);
        image(water, offset, 0, width, height);
        image(water, offset - width, 0, width, height);

        tint(asset.blue, asset.opacity);
        image(water2, offset2, 0, width, height);
        image(water2, offset2 - width, 0, width, height);

        tint(255, 255);
      
        for (int i = 0; i < numberButtons; i++)
        {
            button.draw(buttons[i].text, 0, height, gameManager.selectedButton == i,  i + 1, numberButtons);
        }
    }
}