class Animal
{
    PImage graphic = new PImage();
    int xAnimal, yAnimal;
    String[] filepaths = new String[5];
    AnimalSystem animalsystem;
    
    // constructor for the animals makes the filepaths and convertes them into a image.
    Animal(int animal) 
    {
        filepaths[0] = "img/elephant.png";
        filepaths[1] = "img/hippo.png";
        filepaths[2] = "img/lion.png";
        filepaths[3] = "img/rabbit.png";
        filepaths[4] = "img/deer.png";
        
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

