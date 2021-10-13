// initialize game

Asset asset;
GameManager gameManager;
Grid grid;
UI ui;
AnimalSystem animalsystem;
Animal animal;

void setup()
{
    size(1067, 600, P2D);
    asset = new Asset();
    gameManager = new GameManager();
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
    animalsystem = new AnimalSystem();
    
}

// update all game objects
void update()
{
    ui.keyPressed();
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
    
    grid.draw();
    animalsystem.run();
}


// update and render game loop
    {
    background(128);
    if (gameManager.gameState == 0) {
        ui.drawMenu();
    } else if (gameManager.gameState == 1) {  
        animal.draw();
        grid.draw();
        ui.drawGame();
        } else if (gameManager.gameState == -1) {
        ui.drawPaused();
        }
    }

// update and rendergame loop
void draw()
    {
    update();
    render();
    }
