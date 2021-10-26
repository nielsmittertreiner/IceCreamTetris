class IceCreamSystem
{ ArrayList<IceCream> icecreams;
    
    
    int icecreamcount;
    float iceCreamSize = 80;
    float timePace = 100;
    boolean time; 
    boolean stop; 
    float timeStop = iceCreamSize * timePace;
    
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
            icecreamtemp.xIceCream = grid.getRowPosition(i + 15);
            icecreamtemp.xTimer = grid.getRowPosition(i + 15);
            icecreamtemp.yIceCream = 0;
            icecreamtemp.yTimer = 0;
            icecreams.add(icecreamtemp);
        }
        
        
        
        
        
    }
    
    void resettimer()
    {for (int i = 0; i < 5; ++i) {
            
            icecreams.get(i).m = 0;
        }
    }
    
    void draw() {
        // draws icecreams with the timebar next to eachother by 5. 
        for (icecreamcount = 0; icecreamcount < 5; icecreamcount++) 
            {
            
            IceCream icecream = icecreams.get(icecreamcount);
            icecream.draw(); 
            
            
            // if the timebar reaches 0 it will stop and make a rectangle that is the same color as the background of the game. 
            
            
        }   
        for (int i = 15; i < 20; ++i) {    
            if (animalsystem.checkoverlapp(i)) {
                gameManager.addScore(getscore(i));
                respawnIceCream(i);
                
                
            }       
            if (respawning(i)) {
                movetospawn(i);
                
            } 
            
        }
        
        for (int i = 15; i < 20; ++i) {
            time = true;
            
            if (time) {
                icecreams.get(calculateiceceream(i)).m ++;
            }
            stop = true;
            
            if (icecreams.get(calculateiceceream(i)).m > timeStop) { 
                icecreams.get(calculateiceceream(i)).m --;
                
            } 
      }
        
    }   
    int getscore(int icecream)
    {
      icecream = int(icecreams.get(calculateiceceream(icecream)).iceCreamSize - (icecreams.get(calculateiceceream(icecream)).m / icecreams.get(calculateiceceream(icecream)).timePace));
      return icecream;

      

    }
    int calculateiceceream(int icecream)
    {
        switch(icecream) {
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
    
    public boolean respawning(int icecream)
    { while(icecreams.get(calculateiceceream(icecream)).yIceCream < 0)
        {
            return true;           
        }
        return false;
        
        
    }
    
    
    
    void respawnIceCream(int icecream) {
        icecreams.get(calculateiceceream(icecream)).yIceCream = -100; 
        icecreams.get(calculateiceceream(icecream)).yTimer = -100; 
        icecreams.get(calculateiceceream(icecream)).m = 0;
        
    }
    void movetospawn(int icecream)
    {
        icecreams.get(calculateiceceream(icecream)).yIceCream += 2;
        icecreams.get(calculateiceceream(icecream)).yTimer += 2; 
        
    }
}   