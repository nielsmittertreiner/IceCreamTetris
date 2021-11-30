class UI
{
  int textDistance = 100, textSize = 50;

  void draw()
  {
    textSize(textSize);
    fill(asset.white);
    text("SCORE: " + gameManager.score, textDistance, textSize);
    text("Press left to turn", 700, textSize);
  }
}
