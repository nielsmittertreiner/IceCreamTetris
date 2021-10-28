int icecreamcount;

class IceCreamSystem
{ 
    ArrayList<IceCream> icecreams;

    float iceCreamSize = 90;
    float timePace = 5;
    float timeStop = iceCreamSize * timePace;
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
    void resettimer()
    {
        for (int i = 0; i < 5; ++i) 
        { 
            icecreams.get(i).m = 0;
        }
    }
 
    //While the yIcecream is less then 0 so if the icecream is above the screen return true.
    public boolean respawning(int icecream)
    { while(icecreams.get(calculateiceceream(icecream)).yIceCream < 0)
        {
            return true;           
        }
        return false;    
    }

    
    //Calculates the score by the size of the whole timer - the time past. max 80 min 0.  
    int getscore(int icecream)
    {
      icecream = int(icecreams.get(calculateiceceream(icecream)).iceCreamSize - (icecreams.get(calculateiceceream(icecream)).m / icecreams.get(calculateiceceream(icecream)).timePace));
      return icecream;
    }

    //calculates the value of the icecreams.
    int calculateiceceream(int icecream)
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
                println("can't calculate icecream");
                return - 1;
        }
    }
 
    //Respawns the icecream and the timer and puts the timer on 0.
    void respawnIceCream(int icecream) 
    {
        icecreams.get(calculateiceceream(icecream)).yIceCream = -100; 
        icecreams.get(calculateiceceream(icecream)).yTimer = -100; 
        icecreams.get(calculateiceceream(icecream)).m = 0;
        
    }

    //If boolean is true makes the icecream move to the right location.
    void movetospawn(int icecream)
    {
        icecreams.get(calculateiceceream(icecream)).yIceCream += 2;
        icecreams.get(calculateiceceream(icecream)).yTimer += 2; 
        
    }

    void draw() 
    {
        //draws the icecreams + timers.
        for (icecreamcount = 0; icecreamcount < 5; icecreamcount++) 
        {
            IceCream icecream = icecreams.get(icecreamcount);
            icecream.draw();    
        }  
        // checks if overlapp = true and adds points to the score and then respawns the ice cream. 
        for (int i = 15; i < 20; ++i) 
        {    
            if (animalsystem.checkoverlapp(i)) 
            {
                gameManager.addScore(getscore(i));
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
                icecreams.get(calculateiceceream(i)).m ++;
            }
            //if the timer hits the bottom it stops.
            if (icecreams.get(calculateiceceream(i)).m > timeStop) 
            { 
                icecreams.get(calculateiceceream(i)).m --; 
            } 
            
        }    
    } 

}   