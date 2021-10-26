class IceCream { 
    
    
    PImage graphic = new PImage();
    
    String[] filepaths = new String[5];
    int[] icecreamgridposition = new int[5];
    
    float iceCreamSize = 80, timeWidth = 15;
    float timePace = 60;
    int xIceCream, yIceCream;
    int xTimer = xIceCream, yTimer = yIceCream; 
    int m = millis();
    
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
        image(graphic, xIceCream, yIceCream, iceCreamSize,iceCreamSize);
        noStroke();
        fill(0,255, 0);
        rect(xIceCream, yTimer, timeWidth, iceCreamSize);
        fill(0);
        rect(xIceCream, yTimer, timeWidth, m / timePace);
    }
}