class UI
{
  void keyPressed() {
    //add 2 to highscore by pressing w, take 2 away by pressing s
    if (key == 'w') {
      gameManager.setHighscore(2);
      key = 'q';
    } else if (key == 's') {
      gameManager.setHighscore(-2);
      key = 'q';
    }

    //up the difficulty by pressing space
    if (key == ' ') {
      gameManager.setDifficulty(1);
      key = 'q';
    }

    //reset both by pressing r
    if (key == 'r') {
      gameManager.reset();
      key = 'q';
    }

    println("highscore " + gameManager.highscore + ", difficulty " + gameManager.difficulty);
  }
}
