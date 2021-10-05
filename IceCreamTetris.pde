// initialize game

GameManager gameManager;
UI ui;
Animal animal;

void setup()
{
  size(1067, 600, P2D);
  background(0);
  gameManager = new GameManager();
  ui = new UI();
  animal = new Animal();
  
}

// update all game objects
void update()
{
  ui.keyPressed();
  animal.update();
}

// render all objects to screen
void render()
{
  animal.draw();
}

// update and render game loop
void draw()
{
  update();
  render();
}
