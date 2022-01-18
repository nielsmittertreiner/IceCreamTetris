class UI
{
  int textDistance = 5, textSize = 42;

  int startTimer = 0;
  int gridHeight = grid.grid.length * grid.cellSize;

  void render()
  {
    textSize(textSize);
    fill(asset.white);
    text("SCORE: " + gameManager.score, textDistance, textSize);


    // Draw animation
    if (gameManager.stormTimer == gameManager.stormTimerCoolDown - 1 || gameManager.storm) {

      riverAnimation.draw(grid.boxY, gridHeight, asset.grey);

      startTimer++;

      if (startTimer == 10 || startTimer == 20 || startTimer == 30 || startTimer == 200 || startTimer == 210 || startTimer == 220 || startTimer == 400 || startTimer == 410 || startTimer == 420) {

        riverAnimation.draw(grid.boxY, gridHeight, asset.white);
        asset.thunder.play();
      }

      if (startTimer == 15 || startTimer == 25 || startTimer == 35 || startTimer == 205 || startTimer == 215 || startTimer == 225 || startTimer == 405 || startTimer == 415 || startTimer == 425) {
        riverAnimation.draw(grid.boxY, gridHeight, asset.grey);
      }
    } 
    else
    {
      startTimer = 0; 
      riverAnimation.draw(grid.boxY, gridHeight, asset.blue);
    }
  }
}
