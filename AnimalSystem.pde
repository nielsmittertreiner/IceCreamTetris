private int ANIMALS_USED = 5;
public int animalscount;

class AnimalSystem
{ ArrayList<Animal> animals;
    
    Animal animaltemp;
    Grid grid;
    
    AnimalSystem(Grid grid)
    {
        this.grid = grid;
        
        //puts animals in the Arraylist with position.
        animals = new ArrayList<Animal>();   
        for (int i = 0; i < ANIMALS_USED; ++i) 
        {
            animaltemp = new Animal(i);
            animaltemp.xAnimal = grid.getRowPosition(i + 15);
            animaltemp.yAnimal = height - 100;
            animals.add(animaltemp);
        }
    }
    
    //checks if animal X is passed to the other side and returns true or false
    public boolean checkpassed(int animal)
    { 
        // resets the animal after it disappears from the screen and gives it a value that it has passed the gap.
        if (animals.get(calculateanimal(animal)).yAnimal + animals.get(calculateanimal(animal)).graphic.height <= 0)
        {
            return true;           
        }
        
        return false;    
    }

        public boolean respawning(int animal)
    {        if (animals.get(calculateanimal(animal)).yAnimal + animals.get(calculateanimal(animal)).graphic.height < height - 500)
        {
            return true;           
        }
        return false;


    }

    // Takes an integer from isrowfull from icecreamtetris and grid and moves that specifick animal.
    void moveAnimal(int animal) 
    {
        animals.get(calculateanimal(animal)).yAnimal -= 5;
    }
    //if animalpassed == true respawn the animal puts the yAnimal on height - 100
    void respawnanimal(int animal)
    {         animals.get(calculateanimal(animal)).yAnimal = height +100;
    }

    void movetospawn(int animal)
    {
        println("movetospawn doet het");
        while (animals.get(calculateanimal(animal)).yAnimal < height - 100) {
            println("While loop doet het");
            animals.get(calculateanimal(animal)).yAnimal -=1;
        }

    }
    // changes the value of animal to the grid x position.
    int calculateanimal(int animal)
    {
        switch(animal) {
        case 15:
                return  0;
        case 16:
                return  1;	
        case 17:
                return  2;	
        case 18:
                return  3;	
        case 19:
                return  4;	  
        default :
            println("cant calculate Animal");
            return -1;
        }
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