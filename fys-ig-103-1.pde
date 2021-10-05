// initialize game

GameManager gameManager;
UI ui;

void setup()
{
  size(1067, 600, P2D);
  background(0);
  gameManager = new GameManager();
  ui = new UI();
}

// update all game objects
void update()
{
  ui.keyPressed();
}

// render all objects to screen
void render()
{
}

// update and render game loop
void draw()
{
  update();
  render();
}
