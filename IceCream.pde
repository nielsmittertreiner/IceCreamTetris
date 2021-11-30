class IceCream { 


  PImage graphic = new PImage();

  String[] filepaths = new String[5];


  float iceCreamSize = 90, timeWidth = 15;
  float timePace = 75;
  float timeStop = iceCreamSize * timePace;
  int xIceCream, yIceCream;
  int xTimer = xIceCream, yTimer = yIceCream; 
  int m = millis();


  boolean changeColor;
  IceCreamSystem icecreamsystem;




  // constructor for the icecreams but instead of the animals it is 5 times the same picture so fills the filepath with a for loop.
  IceCream(int icecream) 
  {
    for (int i = 0; i < 5; ++i) 
    {

      filepaths[i] = "img/ijsje.png";
    }

    graphic = loadImage(filepaths[icecream]);
  }

  void draw() 
  {
    drawIceCream();
  }

  // Draws the icecream plus the timer.
  void drawIceCream() 
  {      
    noFill();
    image(graphic, xIceCream, yIceCream, iceCreamSize, iceCreamSize);

    noStroke();
    fill(asset.white);
    rect(xIceCream, yTimer, timeWidth, iceCreamSize);

    //change the color of the timers.
    changeColor = true;
    if (m > timeStop / 1.25) {

      noStroke();
      fill(asset.red);
      rect(xIceCream, yTimer, timeWidth, iceCreamSize);
    } else if (m > timeStop / 1.75) {
      noStroke();
      fill(asset.orange);
      rect(xIceCream, yTimer, timeWidth, iceCreamSize);
    } else if (m > timeStop / 3) {
      noStroke();
      fill(asset.lightGreen);
      rect(xIceCream, yTimer, timeWidth, iceCreamSize);
    } else if (m > timeStop / 5) {
      noStroke();
      fill(asset.lightBlue);
      rect(xIceCream, yTimer, timeWidth, iceCreamSize);
    }

    noStroke();
    fill(0);
    rect(xIceCream, yTimer, timeWidth, m / timePace);
  }
}
