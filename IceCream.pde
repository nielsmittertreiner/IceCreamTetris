 class IceCream { 


  PImage iceCream[] = new PImage[5];
  int xIceCream = 75, yIceCream = 5; 
  float iceCreamSize = 60, timeWidth = 15;
  float tempo = 250;
  float timeStop = iceCreamSize * tempo;
  int xTimer = xIceCream, yTimer = yIceCream; 
  boolean time; 
  boolean stop; 

 // int[] icecreamgridposition = new int[5];

  int m = millis();

  void setup() {}

  IceCream(){

    for (int i = 0; i < iceCream.length; ++i) {
    
    iceCream[i] = loadImage("img/ijsje.png");
  /*  
  icecreamgridposition[0] = 0;
  icecreamgridposition[1] = 2;
  icecreamgridposition[2] = 4;
  icecreamgridposition[3] = 6;
  icecreamgridposition[4] = 8;
*/

}    

  }
   

  void update() {
  }

  void draw() {

    for (int i = 0; i < 5; ++i) {
      image(iceCream[i], 675 + i * xIceCream, yIceCream, iceCreamSize, iceCreamSize);
      noStroke();
      fill(255);
      rect(725 + i * xTimer, yTimer, timeWidth, iceCreamSize);

time = true;

if (time) {
noStroke();
fill(100);
rect(725 + i * xTimer , yTimer, timeWidth, m / tempo);
m++;
}

stop = true;
if (m > timeStop) { 

noStroke();
fill(100);
rect(725 + i * xTimer, yTimer, timeWidth, iceCreamSize);
m--;

}

}
}

/*void respawnIceCream(int icecream){
 // iceCream.get(iceCream).yIceCream = height - 10; 
*/

}