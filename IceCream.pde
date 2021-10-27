class IceCream { 
    
    
    PImage graphic = new PImage();
    
    String[] filepaths = new String[5];
    int[] icecreamgridposition = new int[5];
    
    float iceCreamSize = 80, timeWidth = 15;
    float timePace = 5;
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
        image(graphic, xIceCream, yIceCream, iceCreamSize,iceCreamSize);
        noStroke();
        fill(#1A27FF);
        rect(xIceCream, yTimer, timeWidth, iceCreamSize);

        changeColor = true;
        if (m > timeStop / 1.25){

        noStroke();
        fill(#F52100);
        rect(xIceCream, yTimer, timeWidth, iceCreamSize);
        
        } else if (m > timeStop / 1.75){
        noStroke();
        fill(#F5BC00);
        rect(xIceCream, yTimer, timeWidth, iceCreamSize);
        
        } else if (m > timeStop / 3){
        noStroke();
        fill(#00F52E);
        rect(xIceCream, yTimer, timeWidth, iceCreamSize);
        
        } else if (m > timeStop / 5){
        noStroke();
        fill(#00E2F5);
        rect(xIceCream, yTimer, timeWidth, iceCreamSize);
        }
        noStroke();
        fill(0);
        rect(xIceCream, yTimer, timeWidth, m / timePace);
    }
}