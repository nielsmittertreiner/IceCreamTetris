class Animal
{
    
    PImage graphic = new PImage();
    int xAnimal, yAnimal;
    String[] filepaths = new String[5];
    AnimalSystem animalsystem;
    
    Animal(int animal) 
    {
        filepaths[0] = "img/cow.png";
        filepaths[1] = "img/sheep.png";
        filepaths[2] = "img/horse.png";
        filepaths[3] = "img/chicken.png";
        filepaths[4] = "img/pig.png";
        
        graphic = loadImage(filepaths[animal]);
    }
    
    void update() 
    {    
    }
    
    void draw() 
    {
        fill(255);
        drawAnimal();      
    }
    
    void drawAnimal() 
    {
        image(graphic, xAnimal, yAnimal, 75,75);
    }
}

