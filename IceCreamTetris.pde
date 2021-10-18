// initialize game

Asset asset;
MainMenu mainMenu;
PauseMenu pauseMenu;
GameManager gameManager;
Grid grid;
UI ui;
Animal animal;
Button button;

void setup()
{
    size(1067, 600, P2D);
    asset = new Asset();
    mainMenu = new MainMenu();
    pauseMenu = new PauseMenu();
    gameManager = new GameManager();
    ui = new UI();
    grid = new Grid(25, 15, 50);
    grid.setState(1, 1, 1);
    grid.setState(5, 5, 1);
    grid.setState(10, 10, 1);
    animal = new Animal();
    button = new Button();

    mainMenu.setup();
    pauseMenu.setup();
}

// update all game objects
void update()
{
    if (gameManager.gameState == 0)
    {
        mainMenu.keyInput();
    }
    else if (gameManager.gameState == 1) {
        ui.keyInput();
        animal.update();
    }
    else
    {
        pauseMenu.keyInput();
    }
}

// render all objects to screen
void render()
{
    if (gameManager.gameState == 0)
    {
        mainMenu.draw();
    }
    else if (gameManager.gameState == 1)
    {  
        background(asset.grey);
        animal.draw();
        grid.draw();
        ui.draw();
    }
    else
    {  
        pauseMenu.draw();     
    }
}

// update and rendergame loop
void draw()
{
    update();
    render();
}
