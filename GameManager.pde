class GameManager
{
  //-1 = paused, 0 = starting menu, 1 = game
  int gameState = 0;
  int score = 0, difficulty = 0;

  void addScore(int scoreAdded) {
    score += scoreAdded;
    if (score < 0) {
      score = 0;
    }
  }

  void setDifficulty(int difficultyAdded) {
    difficulty += difficultyAdded;
  }

  void reset() {
    difficulty = 0;
    score = 0;
    gameState = 0;
  }
}