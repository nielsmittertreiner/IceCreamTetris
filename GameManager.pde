class GameManager
{
  int highscore = 0, difficulty = 0;

  void setHighscore(int highscoreAdded) {
    highscore += highscoreAdded;
    if (highscore < 0) {
      highscore = 0;
    }
  }

  void setDifficulty(int difficultyAdded) {
    difficulty += difficultyAdded;
  }

  void reset() {
    difficulty = 0;
    highscore = 0;
  }
}
