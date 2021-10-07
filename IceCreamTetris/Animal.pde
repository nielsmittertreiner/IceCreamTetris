class Animal
{
    PImage[] animals = new PImage[5];
    int xAnimal = 100, yAnimal = 500;
    int space = 100;
    
    Animal() {
        animals[0] = loadImage("img/cow.png");   
        animals[1] = loadImage("img/sheep.png");   
        animals[2] = loadImage("img/cow.png");   
        animals[3] = loadImage("img/cow.png");   
        animals[4] = loadImage("img/cow.png");  
        
    }
    
    
    
    void update() {
        
    }
    
    void draw() {
        background(0);
        for (int i = 0; i < animals.length; ++i) {
            drawAnimal(i,i);   
        }
        
        
    }
    
    void drawAnimal(int animal,int count) {
        image(animals[animal], xAnimal + count * space, yAnimal);
        
    }
}
