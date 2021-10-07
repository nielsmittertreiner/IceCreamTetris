class UI
{
  int textDistance = 5, textSize = 50;

  void pause() {
    if (keyCode == BACKSPACE && keyPressed) {
      gameManager.gameState *= -1;
      keyCode = TAB;
    } else if (keyCode == ENTER && gameManager.gameState == 0){
      gameManager.gameState = 1;
    }
  }

  void keyImput() {
    //add 2 to Score by pressing m, take 2 away by pressing l
    if (key == 'm' && keyPressed) {
      gameManager.addScore(2);
      key = 'q';
    } 
    if (key == 'l' && keyPressed) {
      gameManager.addScore(-2);
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
  void drawGame() {
    textSize(textSize);
    fill(asset.red);
    text("SCORE: " + gameManager.score, textDistance, textSize);
  }
  void drawPaused() {
    textSize(textSize);
    fill(asset.red);
    text("SCORE: " + gameManager.score, textDistance, textSize);
    fill(asset.white);
    text("-PAUSED-", textDistance, 2*textSize);
  }
  void drawMenu() {
    textSize(textSize);
    fill(asset.white);
    text("press enter to play", textDistance, textSize);
  }
}
