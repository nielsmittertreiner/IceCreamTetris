private int ANIMALS_USED = 5;
private int SPACE = 100;
private int HEIGHT = 50;
public int animalscount;
public boolean animalpassed;


class AnimalSystem
{ ArrayList<Animal> animals;
    
    
    
    AnimalSystem()
    {
        Animal animaltemp;
        //puts animals in the Arraylist with position.
        animals = new ArrayList<Animal>();   
        for (int i = 0; i < ANIMALS_USED; ++i) 
        {
            animaltemp = new Animal(i);
            animaltemp.xAnimal = i * SPACE + HEIGHT;
            animals.add(animaltemp);
        }
    }
    
    // Takes an integer from isrowfull from icecreamtetris and grid and moves that specifick animal.
    void moveAnimal(int animal) {
        animals.get(animal).yAnimal -= 5;
        
        
    }
    
    
    void update() {
        
    }
    
    
    void run()
    {
        //Draws the animals from animal.pde with the right count.
        for (animalscount = 0; animalscount < ANIMALS_USED; animalscount++) 
        {
            Animal animal = animals.get(animalscount);
            animal.update();
            animal.draw();
            // resets the animal after it disappears from the screen and gives it a value that it has passed the gap.
            if (animal.yAnimal + animal.graphic.height <= 0) {
                animal.yAnimal = 500;
                animalpassed = true;
                
            }
            animalpassed = false;
        }
    }
    
    
    
    
    
    
    
    
}