class IceCreamSystem
{ ArrayList<IceCream> icecreams;

  float iceCreamSize = 80, timeWidth = 15;
  float timePace = 250;
  float timeStop = iceCreamSize * timePace;
  int xIceCream, yIceCream;
  int xTimer = xIceCream, yTimer = yIceCream; 
  boolean time; 
  boolean stop; 

  int m = millis();

  IceCream icecreamtemp;
  Grid grid;

      IceCreamSystem(Grid grid)
      {

 
         this.grid = grid;

        //puts icecreams in the Arraylist with position.
        icecreams = new ArrayList<IceCream>();   
        for (int i = 0; i < 5; ++i) 
        {
            icecreamtemp = new IceCream(i);
            icecreamtemp.xIceCream = grid.getRowPosition(i);
            icecreamtemp.yIceCream = height + 100;
            icecreams.add(icecreamtemp);
        }





 }


void draw() {
 // draws the timebar next to eachother by 5. 

    for (int i = 0; i < 5; ++i) {
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

/*
 void respawnIceCream(int icecream){
 IceCream.get(IceCream).yIceCream = height - 10; 

}
*/
}