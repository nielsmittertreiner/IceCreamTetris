class EndScreen
{
   float speed = 1.05;
    float offset = 0;
    float offset2 = 0;
    PImage water;
    PImage water2;
    int numberButtons = 1,selectedButton = 0;
    Button[] buttons;
    void setup()
    {
        buttons = new Button[numberButtons];
        for (int i = 0; i < numberButtons; i++)
        {
            buttons[i] = new Button();
        }
        buttons[0].text = "RESTART";
        
    
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
            if (selectedButton == 0 )
            {
                gameManager.gameState = 0;
                keyCode = 'q';
            }
            else
            {
                exit();
            }
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

        tint(15,215,250, asset.opacity);
        image(water2, offset2, 0, width, height);
        image(water2, offset2 - width, 0, width, height);

        tint(255, 255);
        
        fill(asset.white);
        textSize(100);
        text("GAME OVER",width/3,height/4);
        textSize(80);
        fill(asset.white);
        text("SCORE: " + gameManager.score, width/3+80, height/4+100);
        
        textSize(80);
        fill(asset.white);
        text("player: "/*+key+key+key+key*/,width/3+80,height/4+200);
            
         for (int i = 0; i < numberButtons; i++)
        {
            button.draw(selectedButton == i, buttons[i].text,width/3+80, height/4+300);
        }
    }
}