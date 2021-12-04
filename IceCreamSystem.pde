int icecreamcount;

class IceCreamSystem
{ 
  ArrayList<IceCream> icecreams;

  float iceCreamSize = 90;
  float timePace = 75;
  float timeStop = iceCreamSize * timePace;
  float timePlus = 900;
  boolean time = true; 

  IceCream icecreamtemp;
  Grid grid;
  // construcor for the icecreams and timers and fills them with the right positions an gets the same xposition as the grid row.
  IceCreamSystem(Grid grid)
  {
    this.grid = grid;

    //puts icecreams in the Arraylist with position.
    icecreams = new ArrayList<IceCream>();   
    for (int i = 0; i < 5; ++i) 
    {
      icecreamtemp = new IceCream(i);
      icecreamtemp.xIceCream = grid.getRowPosition(i + 15);
      icecreamtemp.xTimer = grid.getRowPosition(i + 15);
      icecreamtemp.yIceCream = 0;
      icecreamtemp.yTimer = 0;
      icecreams.add(icecreamtemp);
    }
  }

  // Resets the timer, used for respawning the whole icecream. and by starting a level.
  void resetTimer()
  {
    for (int i = 0; i < 5; ++i) 
    { 
      icecreams.get(i).m = 0;
    }
  }

  void resetIcecream()
  {
     for (int i = 0; i < 5; ++i) 
    { 
      icecreams.get(i).yIceCream = 0;
      icecreams.get(i).yTimer = 0;

    }

  }

  //While the yIcecream is less then 0 so if the icecream is above the screen return true.
  public boolean respawning(int icecream)
  { 
    while (icecreams.get(calculateicecream(icecream)).yIceCream < 0)
    {
      return true;
    }
    return false;
  }


  //Calculates the score by the size of the whole timer - the time past. max 90 min 0.  
  int getscore(int icecream)
  {
    icecream = int(icecreams.get(calculateicecream(icecream)).iceCreamSize - (icecreams.get(calculateicecream(icecream)).m / icecreams.get(calculateicecream(icecream)).timePace));
    return icecream;
  }

  //calculates the value of the icecreams.
  int calculateicecream(int icecream)
  {
    switch(icecream) 
    {
    case 15:
      return  0;
    case 16:
      return  1;	
    case 17:
      return  2;	
    case 18:
      return  3;	
    case 19:
      return  4;	  
    default :
      //println("can't calculate icecream");
      return - 1;
    }
  }

  //Respawns the icecream and the timer and puts the timer on 0.
  void respawnIceCream(int icecream) 
  {
    icecreams.get(calculateicecream(icecream)).yIceCream = -375; 
    icecreams.get(calculateicecream(icecream)).yTimer = -375; 
    icecreams.get(calculateicecream(icecream)).m = 0;
  }


  // despawns the icecreams and timer when the timer hits 0. 
  void despawnIceCream(int icecream) {

    icecreams.get(calculateicecream(icecream)).xIceCream = -375; 
    icecreams.get(calculateicecream(icecream)).xTimer = -375;
  }

  //If boolean is true makes the icecream move to the right location.
  void movetospawn(int icecream)
  {
    icecreams.get(calculateicecream(icecream)).yIceCream += 2;
    icecreams.get(calculateicecream(icecream)).yTimer += 2;
  }


  void draw() 
  {
    //draws the icecreams + timers.
    for (icecreamcount = 0; icecreamcount < 5; icecreamcount++) 
    {
      IceCream icecream = icecreams.get(icecreamcount);
      icecream.draw();
    }  
    // checks if a row is full outside of the icecreams and animals, if so then the icecreams gets more time. 
    for (int i = 0; i < 15; ++i) {

      if (grid.isRowFull(i))
      { //println("false");
        for (int j = 15; j < 20; ++j) {
          icecreams.get(calculateicecream(j)).m -= timePlus;
        //  println("true");
        }
      }
    }
    for (int i = 15; i < 20; ++i) 
    {    
      // checks if a row is full with an icecream and timer, if so then the timer stops. 
      if (grid.isRowFull(i))
      {
         icecreams.get(calculateicecream(i)).m --; 
      }
      // checks if overlapp = true, if so add points to the score, gets more time for the other icecreams and then respawns the ice cream. 
      if (animalsystem.checkoverlapp(i)) 
      {
        gameManager.addScore(getscore(i));
      
        for (int j = 15; j < 20; ++j) {
          icecreams.get(calculateicecream(j)).m -= timePlus;
        }

        respawnIceCream(i);
      }       
      // if respawned it is placed above the screen so then move tot the right location.
      if (respawning(i)) 
      {
        movetospawn(i);
      } 
      //makes the timers count down.
      if (time) 
      {
         icecreams.get(calculateicecream(i)).m ++;
      }
      // timer never goes over its max time. 
       if (icecreams.get(calculateicecream(i)).m < 0){

           icecreams.get(calculateicecream(i)).m = 0;

      }
      //if the timer hits the bottom it stops.
      if (icecreams.get(calculateicecream(i)).m > timeStop) 
      { 
          icecreams.get(calculateicecream(i)).m --; 

        //when the timer hits 0 remove 1 heart. 
          gameManager.removeHealth();
        //  despawnIceCream(i);

          respawnIceCream(i);
          movetospawn(i);
      }
    }
  }
}   
