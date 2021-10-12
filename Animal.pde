class Animal
{
    PImage[] animals = new PImage[5];
    int xAnimal = 100, yAnimal = 500;
    int yVel = 1;
    int space = 100;
    int blockX, blockY;
    int xPath = xAnimal;
    int animalCount = 4;
    boolean pass = false;
    
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
    }
    
    void draw() {

        fill(255);
        AnimalBlock();
        for (int i = 0; i < animalCount; ++i) {
            drawAnimal(i,i); 
            checkPass(0 ,i); 
        }
        
        
    }
    
    void checkPass( int x, int count) {
        if ( x == 1) {
            pass = true;
        }
        else{
            pass = false;
        }
    }

    void drawAnimal(int animal,int count) {
                moveAnimal();
        image(animals[animal], xAnimal + count * space, yAnimal);
        fill(255,255,255,20);
        rect(xPath + count * space,0,30,height); 
        
    }
    
    void moveAnimal() {
        if (pass == true) {
            yAnimal -= yVel;
        }
        if (pass == false) {
            yAnimal = yAnimal;
            
        }
    }
    
    void AnimalBlock() {
        rect(blockX,blockY,50,50);
        
        
    }
}

