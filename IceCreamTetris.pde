// initialize game

Asset asset;
MainMenu mainMenu;
PauseMenu pauseMenu;
GameManager gameManager;
Grid grid;
UI ui;
AnimalSystem animalsystem;
Button button;

void setup()
{
    size(1067, 600, P2D);
    asset = new Asset();
    mainMenu = new MainMenu();
    pauseMenu = new PauseMenu();
    gameManager = new GameManager();
    animalsystem = new AnimalSystem();
    button = new Button();
    ui = new UI();
    grid = new Grid(25, 15, 50);
    grid.setState(5, 1, 1);
    grid.setState(5, 2, 1);
    grid.setState(5, 3, 1);
    grid.setState(5, 4, 1);
    grid.setState(5, 5, 1);
    grid.setState(5, 6, 1);
    grid.setState(5, 7, 1);
    grid.setState(5, 8, 1);
    grid.setState(5, 9, 1);
    grid.setState(5, 10, 1);
    grid.setState(5, 11, 1);
    grid.setState(5, 12, 1);
    grid.setState(5, 13, 1);
    grid.setState(5, 14, 1);
    grid.setState(10, 10, 1);
    
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
        grid.draw();
        animalsystem.run();
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
