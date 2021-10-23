class Animal
{

    PImage graphic = new PImage();
    int xAnimal, yAnimal;
    String[] filepaths = new String[5];
    int[] animalgridposition = new int[5];
    AnimalSystem animalsystem;
    
    
    Animal(int animal) 
    {
        filepaths[0] = "img/cow.png";
        filepaths[1] = "img/sheep.png";
        filepaths[2] = "img/horse.png";
        filepaths[3] = "img/chicken.png";
        filepaths[4] = "img/pig.png";
        
        
        graphic = loadImage(filepaths[animal]);

        animalgridposition[0] = 0;
        animalgridposition[1] = 2;
        animalgridposition[2] = 4;
        animalgridposition[3] = 6;
        animalgridposition[4] = 8;

        
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

