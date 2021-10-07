class UI
{
  int textDistance = 5, textSize = 50;

  void pause() {
    if (keyCode == BACKSPACE && keyPressed) {
      gameManager.paused = !gameManager.paused;
      keyCode = TAB;
    }
  }

  void keyImput() {
    //add 2 to Score by pressing m, take 2 away by pressing l
    if (key == 'm' && keyPressed) {
      gameManager.setScore(2);
      key = 'q';
    } 
    if (key == 'l' && keyPressed) {
      gameManager.setScore(-2);
      key = 'q';
    }

    //up the difficulty by pressing d
    if (key == 'd'&& keyPressed) {
      gameManager.setDifficulty(1);
      key = 'q';
    }

    //reset both by pressing r
    if (key == 'r'&& keyPressed) {
      gameManager.reset();
      key = 'q';
    }
  }
  void draw() {
    textSize(textSize);
    fill(asset.red);
    text("SCORE: " + gameManager.score, textDistance, textSize);
    if (gameManager.paused) {
      fill(asset.white);
      text("-PAUSED-", textDistance, 2*textSize);
    }
  }
}
