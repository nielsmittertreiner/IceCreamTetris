// initialize game

Asset asset;
GameManager gameManager;
Grid grid;
UI ui;
Animal animal;

void setup()
{
  size(1067, 600, P2D);
  asset = new Asset();
  gameManager = new GameManager();
  ui = new UI();
  grid = new Grid(50, 50, 10);
  grid.setState(1, 1, 1);
  animal = new Animal();
}

// update all game objects
void update()
{
  ui.pause();
  if (!gameManager.paused)
  {
    ui.keyImput();
    animal.update();
  }
}

// render all objects to screen
void render()
{
  background(128);
  animal.draw();
  grid.draw();
  ui.draw();
}

// update and render game loop
void draw()
{
  update();
  render();
}
