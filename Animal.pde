class Animal
{
    PImage graphic = new PImage();
    int xAnimal, yAnimal = 500;
    int yVel = 0;
    int space = 100;
    int xPath = xAnimal;
    String[] filepaths = new String[5];
    AnimalSystem animalsystem;
    Grid grid;
    
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
        if (mouseX >= xAnimal && mouseX <= xAnimal +graphic.width) {
            yAnimal -= 1;
            //println("Noooo");
        }
        else
        {
            yAnimal = yAnimal;
            
            //println("Yeees");
        }  
    }
    
    // boolean checkPass() {
    
    
    //     if (grid.isRowFull(5)) 
    //         {
    //         return true;
    //     }
    
    //     return false;
// }
    
    
    
    // void moveAnimal() 
    //  {
    
    //  if (checkPass() == true) 
    //  {
    //  yAnimal -= 1;
    //  }
    //  else
    //  {
    //  yAnimal = yAnimal;
    
    //  }
//     }
    
    void draw() 
    {
        
        fill(255);
        drawAnimal();      
        
        
    }
    
    void drawAnimal() 
    {
        image(graphic, xAnimal, yAnimal);
        fill(255,255,255,20);
        rect(xPath ,0,30,height); 
        // moveAnimal();   
    }
}

