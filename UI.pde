class UI
{
<<<<<<< HEAD
  int textDistance = 100, textSize = 50;


  void draw()
  {
    textSize(textSize);
    fill(asset.white);
    text("SCORE: " + gameManager.score, textDistance, textSize);
    text("Press left to turn", 700, textSize);
  }
}
=======
    int textDistance = 5, textSize = 50;
    
    PImage heart = new PImage();
    float xHearts;
    int yHearts = 815;
    int heartsSize = 80;



    void setup(){

     heart = loadImage("img/heart.png");

    }

    void draw()
    {
        textSize(textSize);
        fill(asset.white);
        text("SCORE: " + gameManager.score, textDistance, textSize);

      for (int i = 0; i < gameManager.health; ++i) {

          noFill();
          image(heart,xHearts + i * 100, yHearts, heartsSize, heartsSize);

      }

      if (gameManager.health == 0){

        gameManager.gameState = 4;

        for (int i = 0; i < 1; i++)
        {
            gameManager.reset();
                           
        }
      }
    }
}
>>>>>>> 94c093f843cad80576ed245c89557758c2a5883c
