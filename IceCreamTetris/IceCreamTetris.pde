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
  if (gameManager.gameState == 1)
  {
    ui.keyImput();
    animal.update();
  }
}

// render all objects to screen
void render()
{
  background(128);
  if (gameManager.gameState == 0){
  ui.drawMenu();
  } else if (gameManager.gameState == 1) {  
    animal.draw();
    grid.draw();
    ui.drawGame();
  } else if (gameManager.gameState == -1) {
    ui.drawPaused();
  }
}

// update and render game loop
void draw()
{
  update();
  render();
}
