class IceCreamSystem
{ ArrayList<IceCream> icecreams;
    
    float iceCreamSize = 80, timeWidth = 15;
    float timePace = 250;
    float timeStop = iceCreamSize * timePace;
    int xIceCream, yIceCream;
    int xTimer = xIceCream, yTimer = yIceCream; 
    boolean time; 
    boolean stop; 
    int icecreamcount;
    
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
            icecreamtemp.xIceCream = grid.getRowPosition(i + 15);
            icecreamtemp.yIceCream = 0;
            icecreams.add(icecreamtemp);
        }
        
        
        
        
        
}
    
    
void draw() {
        // draws icecreams with the timebar next to eachother by 5. 
        for (icecreamcount = 0; icecreamcount < 5; icecreamcount++) 
        {
            IceCream icecream = icecreams.get(icecreamcount);
            icecream.draw(); 
            
            noStroke();
            fill(0);
            rect(icecreams.get(icecreamcount).xIceCream + icecreamcount * xTimer, yTimer, timeWidth, iceCreamSize);
            
            // if the timebar reaches 0 it will stop and make a rectangle that is the same color as the background of the game. 
               time = true;
            
            if (time) {
             noStroke();
             fill(0, 255, 0);
             rect(icecreams.get(icecreamcount).xIceCream + icecreamcount * xTimer , yTimer, timeWidth, m / timePace);
                m++;
            }
                
               stop = true;
            if (m > timeStop) { 
                m--;
                    
                }
        }      

}      
             void respawnIceCream(int icecream) {
                icecreams.get(icecream).yIceCream = 0; 
                rect(icecreams.get(icecreamcount).xIceCream + icecreamcount * xTimer , yTimer, timeWidth, m / timePace);
   
              }
               
              

}                           