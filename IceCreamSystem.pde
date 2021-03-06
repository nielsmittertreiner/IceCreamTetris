class IceCreamSystem
{ 
  ArrayList<IceCream> iceCreams;
  
  final int ICECREAM_USED = 5, BEGIN_ICECREAM = 15, END_ICECREAM = 20;
  float iceCreamSize = 90;
  float timePace = 45;
  float timeStop = iceCreamSize * timePace;
  float timePlus = 900, timePlus2 = 600; 
  boolean time; 
  int maxScore = 100, iceCreamPlace = -375, reset = 0, iceCreamPace = 2;

  IceCream iceCreamTemp;
  Grid grid;
  // construcor for the icecreams and timers and fills them with the right positions an gets the same xposition as the grid row.
  IceCreamSystem(Grid grid) 	
  {
    this.grid = grid;

    //puts icecreams in the Arraylist with position.
    iceCreams = new ArrayList<IceCream>();   
    for (int i = 0; i < ICECREAM_USED; ++i) 
    {
      iceCreamTemp = new IceCream(i);
      iceCreamTemp.xIceCream = grid.getRowPosition(i + 15);
      iceCreamTemp.xTimer = grid.getRowPosition(i + 15);
      iceCreamTemp.yIceCream = 0;
      iceCreamTemp.yTimer = 0;
      iceCreams.add(iceCreamTemp);
    }
  }

  // Resets the timer, used for respawning the whole icecream. and by starting a level.
  void resetTimer()
  {
    for (int i = 0; i < ICECREAM_USED; ++i) 
    { 
      iceCreams.get(i).m = reset;
    }
  }

  void resetIcecream()
  {
    for (int i = 0; i < ICECREAM_USED; ++i) 
    { 
      iceCreams.get(i).yIceCream = reset;
      iceCreams.get(i).yTimer = reset;
    }
  }

  //While the yIcecream is less then 0 so if the icecream is above the screen return true.
  public boolean respawning(int icecream)
  { 
    while (iceCreams.get(calculateIcecream(icecream)).yIceCream < 0)
    {
    time = false;
      return true;
    }
    time = true;
    return false;
  }


  //Calculates the score by maxScore - the time past. max 100 min 0.  
  int getScore(int icecream)
  {
    icecream = int(maxScore - (iceCreams.get(calculateIcecream(icecream)).m / iceCreams.get(calculateIcecream(icecream)).timePace));
    return icecream;
  }

  //calculates the value of the icecreams.
  int calculateIcecream(int icecream)
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
      return - 1;
    }
  }

  //Respawns the icecream and the timer and puts the timer on 0.
  void respawnIceCream(int icecream) 
  {
    iceCreams.get(calculateIcecream(icecream)).yIceCream = iceCreamPlace; 
    iceCreams.get(calculateIcecream(icecream)).yTimer = iceCreamPlace; 
    iceCreams.get(calculateIcecream(icecream)).m = reset; 
  }


  //If boolean is true makes the icecream move to the right location.
  void moveToSpawn(int icecream)
  {
    iceCreams.get(calculateIcecream(icecream)).yIceCream += iceCreamPace;
    iceCreams.get(calculateIcecream(icecream)).yTimer += iceCreamPace;
  }

// checks if a row is full outside of the icecreams and animals, if so then the icecreams gets more time. 
 void timeExtra()
 {

   for (int i = BEGIN_ICECREAM; i < END_ICECREAM; ++i) 
   {
       iceCreams.get(calculateIcecream(i)).m -= timePlus;      
   }

 }
 // checks if animal checkoverlapp with the icecream, if so then the icecream gets more time. 
 void timeExtra2()
 {
     for (int j = BEGIN_ICECREAM; j < END_ICECREAM; ++j) 
     {
      iceCreams.get(calculateIcecream(j)).m -= timePlus2;     
     }
 }

  void render() 
  {
    //draws the icecreams + timers.
    for (int i = 0; i < ICECREAM_USED; i++) 
    {
      IceCream icecream = iceCreams.get(i);
      icecream.draw();
    }  
        
    
    for (int i = BEGIN_ICECREAM; i < END_ICECREAM; ++i) 
    {    
      // checks if a row is full with an icecream and timer, if so then the timer stops. 
      if (grid.isRowFull(i))
      {
        iceCreams.get(calculateIcecream(i)).m --;
      }
      // checks if overlapp = true, if so add points to the score, gets more time for the other icecreams and then respawns the ice cream. 
      if (animalsystem.checkoverlapp(i)) 
      { 
        gameManager.addScore(getScore(i));
        
        timeExtra2();

        respawnIceCream(i);

      }

      // if the icecream is respawned, it is placed above the screen so then move to the right location.
      if (respawning(i)) 
      {
        moveToSpawn(i);
      } 
      // if boolean time is true. make the timers count down.
      if (time) 
      {
        iceCreams.get(calculateIcecream(i)).m ++;
      }
      // timer never goes over its max time. 
      if (iceCreams.get(calculateIcecream(i)).m < 0)
      {

        iceCreams.get(calculateIcecream(i)).m = reset;

      }
      //if the timer hits the bottom it stops.
      if (iceCreams.get(calculateIcecream(i)).m > timeStop) 
      { 
        iceCreams.get(calculateIcecream(i)).m --; 
        
      }
    }
  }
}   
