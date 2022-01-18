final int ANIMAL_SIZE = 75;
final int MOVEMENT_ANGLE = 10;
final int CYCLE_PERIOD = 200;

class Animal
{
  AnimalSystem animalsystem;
  int x;
  int y;
  float offset;

  PImage graphic = new PImage();

  String[] graphicPaths =
    {
    "img/elephant.png", 
    "img/hippo.png", 
    "img/lion.png", 
    "img/rabbit.png", 
    "img/deer.png", 
  };

  // constructor for the animals makes the filepaths and convertes them into a image.
  Animal(int animal) 
  {
    graphic = loadImage(graphicPaths[animal]);
    offset = randomGaussian();
  }

  void drawAnimal() 
  {
    if (offset == 1.0)
      offset = 0;
    else
      offset += TWO_PI / CYCLE_PERIOD;

    float angle = sin(offset) * MOVEMENT_ANGLE;

    pushMatrix();
    translate(x + (ANIMAL_SIZE / 2), y + ANIMAL_SIZE + (10 * cos(offset * 7)));
    rotate(radians(angle));
    image(graphic, -(ANIMAL_SIZE / 2), -(ANIMAL_SIZE / 2) - (ANIMAL_SIZE / 4), ANIMAL_SIZE, ANIMAL_SIZE);
    popMatrix();
  }

  void render()
  {
    fill(asset.white);
    drawAnimal();
  }
}
