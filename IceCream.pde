class IceCream { 
    
    
    PImage graphic = new PImage();
    
    String[] filepaths = new String[5];
    int[] icecreamgridposition = new int[5];
    IceCreamSystem icecreamsystem;
    
    
    
    float iceCreamSize = 80, timeWidth = 15;
    float timePace = 100;
    int xIceCream, yIceCream;
    int xTimer = xIceCream, yTimer = yIceCream; 
    int m = millis();
    
    IceCream(int icecream) {
        
        
        for (int i = 0; i < 5; ++i) {
            
            filepaths[i] = "img/ijsje.png";
        }
        
        graphic = loadImage(filepaths[icecream]);
        
        
        
}
    
    
    void draw() {
        
        drawIceCream();
        
}
    
    
    void update() {
}
    
    
    void drawIceCream() {      
        noFill();
        image(graphic, xIceCream, yIceCream, iceCreamSize,iceCreamSize);
        noStroke();
        fill(0,255, 0);
        rect(xIceCream, yTimer, timeWidth, iceCreamSize);
        fill(0);
        rect(xIceCream, yTimer, timeWidth, m / timePace);
    }
}