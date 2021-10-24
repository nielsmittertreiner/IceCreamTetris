private int ANIMALS_USED = 5;
public int animalscount;



class AnimalSystem
{ ArrayList<Animal> animals;
    
    Animal animaltemp;
    
    AnimalSystem()
    {
        
        //puts animals in the Arraylist with position.
        animals = new ArrayList<Animal>();   
        for (int i = 0; i < ANIMALS_USED; ++i) 
        {
            animaltemp = new Animal(i);
            animaltemp.yAnimal = height - 100;
            animals.add(animaltemp);
        }
    }
    
    public boolean checkpassed(int animal)
    {
        
        // resets the animal after it disappears from the screen and gives it a value that it has passed the gap.
        if (animals.get(animal).yAnimal + animals.get(animal).graphic.height <= 0) {
            return true;           
        }


        return false;
        
            
        
        
        
    }
    
    
    // Takes an integer from isrowfull from icecreamtetris and grid and moves that specifick animal.
    void moveAnimal(int animal) 
    {
        animals.get(animal).yAnimal -= 5;
        
    }
    
    
    void respawnanimal(int animal)

    {   
        animals.get(animal).yAnimal = height - 100;

    }

    
    
    void update()   
    {
    }
    
    
    void run()
    {
        //Draws the animals from animal.pde with the right count.
        for (animalscount = 0; animalscount < ANIMALS_USED; animalscount++) 
        {
            Animal animal = animals.get(animalscount);
            animal.draw();
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
}