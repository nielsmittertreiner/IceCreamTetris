class UI
{
  int textDistance = 5, textSize = 50;

  PImage heart = new PImage();
  float xHearts;
  int yHearts = 815;
  int heartsSize = 80;



  void setup() {

    heart = loadImage("img/heart.png");
  }

  void render()
  {
    textSize(textSize);
    fill(asset.white);
    text("SCORE: " + gameManager.score, textDistance, textSize);

    //draws 5 hearts. 
    for (int i = 0; i < gameManager.health; ++i) {

      noFill();
      image(heart, xHearts + i * 100, yHearts, heartsSize, heartsSize);
    }
    // if the hearts is zero then its game over.
    if (gameManager.health == 0 && gameManager.gameState == 1) {

      gameManager.gameState = 4;

      //if you press restart it will reset. 
      for (int i = 0; i < 1; i++)
      {
        gameManager.reset();
      }
    }
  }
}
