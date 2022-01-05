class UI
{
  int textDistance = 5, textSize = 42;

  PImage heart = new PImage();
  float xHearts;
  int yHearts = 815;
  int heartsSize = 80;

  void setup() 
  {
    heart = loadImage("img/heart.png");
  }

  void render()
  {
    textSize(textSize);
    fill(asset.white);
    text("SCORE: " + gameManager.score, textDistance, textSize);
  }
}
