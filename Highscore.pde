   
class Highscore
{
  int textSize = 50;

  int buttonDistance = 50;

// test

void setup()
{

  connect.gettable();


}


  void render()
  {
    riverAnimation.draw(0, height, asset.blue);
    connect.printTable(); 
  }

  void keyInput()
  {
    if (key == 'x' && keyPressed)
    {
      gameManager.gameState = 0;
    }
    keyCode = 'q';
  }
  //test
}
