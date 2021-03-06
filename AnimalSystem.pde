class AnimalSystem
{
  final int ANIMALS_USED = 5;
  int animalSpeed = 5;
  int animalRespawnspeed = 2;

  ArrayList<Animal> animals;

  Animal animalTemp;
  Grid grid;

  //Animalsystem Constructor fills in all the variables for the animals + makes the animals get the same x position as their grid row.
  AnimalSystem(Grid grid)
  {
    this.grid = grid;
    animals = new ArrayList<Animal>();   
    for (int i = 0; i < ANIMALS_USED; ++i) 
    {
      animalTemp = new Animal(i);
      animalTemp.x = grid.getRowPosition(i + 15);
      animalTemp.y = height - 100;
      animals.add(animalTemp);
    }
  }

  //Checks if animal X is passed to the other side and returns true or false.
  public boolean checkpassed(int animal)
  { 
    //If the y of the image on the top right + the height of the image moves out of the screen return true.
    if (animals.get(calculateanimal(animal)).y + animals.get(calculateanimal(animal)).graphic.height <= 0)
    {
      gameManager.crosscount +=1;
      return true;
    }

    return false;
  }

  //If y respawns on the bottom of the screen remain true while the y is not the height it supossed to be so it can move to that position.
  public boolean respawning(int animal)
  { 
    while (animals.get(calculateanimal(animal)).y >= height - 100)
    {
      return true;
    }
    return false;
  }

  //Checks if the animal image overlapps the icecreamimage if so returns true.
  public boolean checkoverlapp(int animal)
  { 
    if (animals.get(calculateanimal(animal)).y < iceCreamSystem.iceCreams.get(calculateanimal(animal)).yIceCream) {
      asset.animalMove.play();
      return true;
    }
    return false;
  }

  //Resets the animals when you restart the game. 
  void resetAnimal() {

    for (int i = 0; i < 5; ++i) 
    { 
      animals.get(i).y = height - 100;
    }
  }

  //Int (function) that returns the y posision of the specific animal.
  int getypos(int animal)
  {
    return animals.get(calculateanimal(animal)).y;
  }

  // Takes an integer from isrowfull from icecreamtetris and grid and moves that specifick animal.
  void moveAnimal(int animal) 
  {
    animals.get(calculateanimal(animal)).y -= animalSpeed;
  }

  //if animalpassed == true respawn the animal puts the y on height + 100.
  void respawnanimal(int animal)
  {         
    animals.get(calculateanimal(animal)).y = height + 100;
  }

  // if the animal is respawned underneath the screen move it upwise to his position.
  void movetospawn(int animal)
  {
    animals.get(calculateanimal(animal)).y -= animalRespawnspeed;
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
      return - 1;
    }
  }

  void run()
  {
    //Draws the animals from animal.pde with the right count.
    for (int animalsCount = 0; animalsCount < ANIMALS_USED; animalsCount++) 
    {
      Animal animal = animals.get(animalsCount);
      animal.render();
    }
  }
}
