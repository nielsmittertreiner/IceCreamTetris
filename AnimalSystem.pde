final int ANIMAL_COUNT = 5;


class AnimalSystem
{ ArrayList<Animal> animals;
    
    
    AnimalSystem()
    {
        Animal animaltemp;
        animals = new ArrayList<Animal>();   
        for (int i = 0; i < ANIMAL_COUNT; ++i) 
        {
            animaltemp = new Animal(i);
            animaltemp.xAnimal = i * 100 + 50;
            animals.add(animaltemp);
        }
    }
    
    void run()
    {
        for (int i = 0; i < animals.size(); ++i) 
        {
            Animal animal = animals.get(i);  
            animal.update();
            animal.draw();
        }
    }
    
    
    
    
    
    
    
    
}