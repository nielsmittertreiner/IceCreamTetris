class Animal
{
    PImage[] animals = new PImage[5];
    int xAnimal = 100, yAnimal = 500;
    int space = 100;
    int blockX, blockY;
    int xPath = xAnimal;
    
    Animal() {
        animals[0] = loadImage("img/cow.png");   
        animals[1] = loadImage("img/sheep.png");   
        animals[2] = loadImage("img/chicken.png");   
        animals[3] = loadImage("img/pig.png");   
        animals[4] = loadImage("img/horse.png");  
        
    }
    
    
    
    void update() {
        blockX = mouseX - 25;
        blockY = mouseY - 25;
        for (int i = 0; i < animals.length; ++i) {
            checkPass(i); 
        }
        
    }
    
    void draw() {
        background(0);
        fill(255);
        AnimalBlock();
        for (int i = 0; i < animals.length; ++i) {
            drawAnimal(i,i);  
        }

        
        
    }
    
    
    void checkPass(int count) {
   

        }
        
        
        
        
    
    void drawAnimal(int animal,int count) {
        image(animals[animal], xAnimal + count * space, yAnimal);
        fill(255,255,255,20);
        rect(xPath + count * space,0,30,height); 
        
    }
    void moveAnimal() {
        yAnimal -= 5;
        
    }
    
    void AnimalBlock() {
        rect(blockX,blockY,50,50);
        
        
    }
}
