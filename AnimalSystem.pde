private int ANIMALS_USED = 5;
public int animalscount;

class AnimalSystem
{ 
    ArrayList<Animal> animals;
    
    Animal animaltemp;
    Grid grid;
    //Animalsystem Constructor fills in all the variables for the animals + makes the animals get the same x position as their grid row.
    AnimalSystem(Grid grid)
    {
        this.grid = grid;
        animals = new ArrayList<Animal>();   
        for (int i = 0; i < ANIMALS_USED; ++i) 
        {
            animaltemp = new Animal(i);
            animaltemp.xAnimal = grid.getRowPosition(i + 15);
            animaltemp.yAnimal = height - 100;
            animals.add(animaltemp);
        }
    }
    
    //checks if animal X is passed to the other side and returns true or false.
    public boolean checkpassed(int animal)
    { 
        //if the yAnimal of the image on the top right + the height of the image moves out of the screen return true.
        if (animals.get(calculateanimal(animal)).yAnimal + animals.get(calculateanimal(animal)).graphic.height <= 0)
        {
            return true;           
        }
        
        return false;    
    }
    
    //if yAnimal respawns on the bottom of the screen remain true while the yAnimal is not the height it supossed to be so it can move to that position.
    public boolean respawning(int animal)
    { while(animals.get(calculateanimal(animal)).yAnimal >= height - 100)
        {
            return true;           
        }
        return false;
        
        
    }

    //Checks if the animal image overlapps the icecreamimage if so returns true.
    public boolean checkoverlapp(int animal)
        { if (animals.get(calculateanimal(animal)).yAnimal < icecreamsystem.icecreams.get(calculateanimal(animal)).yIceCream) {
            return true;
        }
        return false;
        
    }
    
    // Takes an integer from isrowfull from icecreamtetris and grid and moves that specifick animal.
    void moveAnimal(int animal) 
    {
        animals.get(calculateanimal(animal)).yAnimal -= 3;
    }

    //if animalpassed == true respawn the animal puts the yAnimal on height + 100.
    void respawnanimal(int animal)
    {         animals.get(calculateanimal(animal)).yAnimal = height + 100;
    }
    
    // if the animal is respawned underneath the screen move it upwise to his position.
    void movetospawn(int animal)
    {
        animals.get(calculateanimal(animal)).yAnimal -= 2;
        
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
                println("can't calculate Animal");
                return - 1;
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