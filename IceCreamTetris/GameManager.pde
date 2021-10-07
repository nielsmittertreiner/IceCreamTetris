class GameManager
{
  int score = 0, difficulty = 0;
  boolean paused;

  void setScore(int scoreAdded) {
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
    paused = false;
  }
}
