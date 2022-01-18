class EndScreen
{
  int numberButtons = 1;

  Button[] buttons;

  final int LETTERCOUNT = 6;

  int buttonY = 550;

  int[] L = new int[LETTERCOUNT];

  int x = width/3+100;
  int y = height/4+200;
  int w = 50;
  int h = 10;

  int timer = 60, timerTotal = 60;

  int row = 0;

  String[] letters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " "};



  void setup()
  {
    buttons = new Button[numberButtons];
    for (int i = 0; i < numberButtons; i++)
    {
      buttons[i] = new Button();
    }
    buttons[0].text = "ADD";

    buttons[0].link = 0;
  }

  void keyInput()
  {

    timer++;

    if (keyPressed && timer > timerTotal) {


      if (gameManager.usedKey == 'R') {     
        row ++;
        if (row >=  LETTERCOUNT) {
          row = LETTERCOUNT - 1;
        }
      } else if (gameManager.usedKey == 'L') {
        println(row);
        row--;
        if (row <=  0) {
          row = 0;
        }
      }

      for (int i = 0; i < LETTERCOUNT; i++)
      {

        if (gameManager.usedKey == 'U' && row == i) {
          L[i]++;
          if (L[i] >= 37) {
            L[i] = 0;
          }
        } else if (gameManager.usedKey == 'D' && row == i) {
          L[i]--;
          if (L[i] <= -1) {
            L[i] = 36;
          }
        }
      }

      //The Nameslector makes 6 arrays and adds them all to a username. After that it uses that username to update functions in the connect class.
      if (gameManager.usedKey == 'x' )
      {
        String a= letters[L[0]];
        String b= letters[L[1]];
        String c= letters[L[2]];
        String d= letters[L[3]];
        String e= letters[L[4]];
        String f=  letters[L[5]];

        gameManager.username=  a + b + c + d + e + f;

        connect.UpdateDtb(gameManager.username, gameManager.score);
        connect.sessionUpdate(gameManager.username, gameManager.piecesused, gameManager.crosscount, gameManager.stormcount, gameManager.combocount);
        connect.getGameStats(gameManager.username);
        connect.getProfileStats(gameManager.username);
      }


      for (int i = 0; i < numberButtons; i++)
      {
        button.keyInput(buttons[i].link, i, numberButtons, gameManager.selectedButton == i);
      }
    }
  }

  void render()
  {
    gameManager.selectedButton = 0;
    riverAnimation.draw(0, height, asset.blue);

    fill(asset.white);
    textSize(100);
    text("GAME OVER", width / 3, height / 4);
    textSize(80);
    text("SCORE: " + gameManager.score, width / 3 + 80, height / 4 + 100);
    textSize(80);
    text("player: ", width/3-200, height/4+200);
    fill(asset.yellow);
    rect(x + row * 100, y+20,w,h);
    fill(asset.black);
    for (int i = 0; i < LETTERCOUNT; i++) {
      text(letters[L[i]], x + i * 100, y);
    }

    for (int i = 0; i < numberButtons; i++)
    {
      button.draw(buttons[i].text, 400, 600, gameManager.selectedButton == i, i + 1, numberButtons);
    }
  }
}
