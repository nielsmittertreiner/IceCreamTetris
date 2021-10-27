class Animal
{
    PImage graphic = new PImage();
    int xAnimal, yAnimal;
    String[] filepaths = new String[5];
    AnimalSystem animalsystem;
    
    // constructor for the animals makes the filepaths and convertes them into a image.
    Animal(int animal) 
    {
        filepaths[0] = "img/cow.png";
        filepaths[1] = "img/sheep.png";
        filepaths[2] = "img/horse.png";
        filepaths[3] = "img/chicken.png";
        filepaths[4] = "img/pig.png";
        
        graphic = loadImage(filepaths[animal]);
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

