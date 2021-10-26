 class IceCream { 


  PImage iceCream[] = new PImage[5];
  int xIceCream, yIceCream = 5; 
  float iceCreamSize = 80, timeWidth = 15;
  float timePace = 250;
  float timeStop = iceCreamSize * timePace;
  int xTimer = xIceCream, yTimer = yIceCream; 
  boolean time; 
  boolean stop; 

  int[] icecreamgridposition = new int[5];

  int m = millis();

  IceCream(int iceCream){


      // filepaths[0] = "img/ijsje.png";
      // filepaths[1] = "img/ijsje.png";
      // filepaths[2] = "img/ijsje.png";
      // filepaths[3] = "img/ijsje.png";
      // filepaths[4] = "img/ijsje.png";

   //graphic = loadImage(filepaths[iceCream]);
  
  icecreamgridposition[0] = 100;
  icecreamgridposition[1] = 200;
  icecreamgridposition[2] = 300;
  icecreamgridposition[3] = 400;
  icecreamgridposition[4] = 500;
  
  xIceCream = icecreamgridposition[iceCream];
  


  }
   

  void update() {
  }

  void draw() {
 // draws my icecream and the timebar next to eachother by 5. 
    for (int i = 0; i < 5; ++i) {
      image(iceCream[i], 660 + i * xIceCream, yIceCream, iceCreamSize, iceCreamSize);
      noStroke();
      fill(0);
      rect(725 + i * xTimer, yTimer, timeWidth, iceCreamSize);

// if the timebar reaches 0 it will stop and make a rectangle that is the same color as the background of the game. 
time = true;

if (time) {
noStroke();
fill(0, 255, 0);
rect(725 + i * xTimer , yTimer, timeWidth, m / timePace);
m++;
}

stop = true;
if (m > timeStop) { 
m--;

}

}
}

/*void respawnIceCream(int icecream){
 // iceCream.get(iceCream).yIceCream = height - 10; 
*/

}