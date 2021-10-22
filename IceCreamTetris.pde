// initialize game

Asset asset;
GameManager gameManager;
Grid grid;
UI ui;
AnimalSystem animalsystem;
void setup()
{
    size(1067, 600, P2D);
    asset = new Asset();
    gameManager = new GameManager();
    ui = new UI();
    grid = new Grid(9, 5, 100);
    grid.setState(2, 0, 1);
    grid.setState(2, 1, 1);
    grid.setState(2, 2, 1);
    grid.setState(2, 3, 1);
    grid.setState(2, 4, 1);
    
    animalsystem = new AnimalSystem();
    
}

// update all game objects
void update()
{
    // ui.keyPressed();
    ui.pause();

    // checks if grid is full and moves the animal.
    for (int i = 0; i < 5; ++i) { 
        if (grid.isRowFull(i)) 
        {
            animalsystem.moveAnimal(i);    
        }
        if (animalsystem.checkpassed(i) == true) 
        {
                grid.removeRow(i);
    animalsystem.respawnanimal(i); 
    
            } 
    
}
animalsystem.update();
    if (gameManager.gameState == 1)
        {
        ui.keyImput();
        // animal.update();
    }
}

// render all objects to screen
void render()
{
    background(100,100,100);
    grid.draw();
    animalsystem.run();
}


// update and render game loop
// {
// background(128);
// if (gameManager.gameState == 0) {
//     ui.drawMenu();
// } else if (gameManager.gameState == 1) {  
//     animal.draw();
//     grid.draw();
//     ui.drawGame();
//     } else if (gameManager.gameState == -1) {
//     ui.drawPaused();
//     }
// }

// update and rendergame loop
void draw()
    {
    update();
    render();
}
