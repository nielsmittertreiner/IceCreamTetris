class Credits
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

        buttons[0].link = 0;
    }

  void draw()
  {
    riverAnimation.draw(0, height, asset.blue);

    textAlign(CENTER, CENTER);
    textSize(ui.textSize);
    fill(asset.white);
    text("CREDITS: \n \n Bas Nierop \n Joel Sarkoh \n Niels Mittertreiner \n Shun Yao Yu \n Steven Klören \n Timo van der Tiel", width / 2, height / 2);
 
        
        for (int i = 0; i < numberButtons; i++)
        {
            button.draw(buttons[i].text, buttonY, buttonY, gameManager.selectedButton == i,  i + 1, numberButtons);
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
