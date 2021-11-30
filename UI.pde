class UI
{
    int textDistance = 5, textSize = 50;
    
    PImage heart = new PImage();
    float xHearts;
    int yHearts = 815;
    int heartsSize = 80;



    void setup(){

     heart = loadImage("img/Hearts.png");

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