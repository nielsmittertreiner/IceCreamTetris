class EndScreen
{
    int numberButtons = 1;
    Button[] buttons;
    void setup()
    {
        buttons = new Button[numberButtons];
        for (int i = 0; i < numberButtons; i++)
        {
            buttons[i] = new Button();
        }
        buttons[0].text = "RESTART";
        buttons[0].link = 0;
    
       
      
    }
void keyInput()
{
      for (int i = 0; i < numberButtons; i++)
        {
            button.keyInput(buttons[i].link, i, numberButtons, gameManager.selectedButton == i);
            gameManager.reset();
        }
}
    void draw()
    {
      riverAnimation.draw(0, height, asset.blue);
        
        fill(asset.white);
        textSize(100);
        text("GAME OVER",width/3,height/4);
        textSize(80);
        text("SCORE: " + gameManager.score, width/3+80, height/4+100);
        
        textSize(80);
        text("player: "/*+key+key+key+key*/,width/3+80,height/4+200);
            
         for (int i = 0; i < numberButtons; i++)
        {
           button.draw(buttons[i].text, 0, height+100, gameManager.selectedButton == i,  i + 1, numberButtons);
        }
    }
}