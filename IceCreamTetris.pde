// initialize game

GameManager gameManager;
Grid grid;
UI ui;

void setup()
{
  size(1067, 600, P2D);
  gameManager = new GameManager();
  ui = new UI();
  grid = new Grid(50, 50, 10);
  grid.setState(1, 1, 1);
}

// update all game objects
void update()
{
  ui.keyPressed();
}

// render all objects to screen
void render()
{
  background(128);
  grid.draw();
}

// update and render game loop
void draw()
{
  update();
  render();
}
