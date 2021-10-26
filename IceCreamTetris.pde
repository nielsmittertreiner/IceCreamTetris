// initialize game
Asset asset;
MainMenu mainMenu;
PauseMenu pauseMenu;
GameManager gameManager;
Grid grid;
UI ui;
AnimalSystem animalsystem;
Piece currentPiece;
Piece nextPiece;
PImage ground;

void setup()
{
    size(1600, 900, P2D);
    ground = loadImage("img/ground.jpg");
    asset = new Asset();
    mainMenu = new MainMenu();
    pauseMenu = new PauseMenu();
    gameManager = new GameManager();
    animalsystem = new AnimalSystem();
    button = new Button();
    ui = new UI();
    grid = new Grid(20, 9, 80);
    grid.setState(1,0,1);
    grid.setState(1,1,1);
    grid.setState(1,2,1);
    grid.setState(1,3,1);
    grid.setState(1,4,1);
    grid.setState(1,5,1);
    grid.setState(1,6,1);
    grid.setState(1,7,1);
    grid.setState(1,8,1);

    animalsystem = new AnimalSystem(grid);
    currentPiece = new Piece(int(random(0, 7)));
    nextPiece = new Piece(int(random(0, 7)));

    grid.addPiece(currentPiece, 10, 4);
}

// update all game objects
void update()
{
    //ui.keyPressed();
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


    if (gameManager.gameState == 1)
    {
        ui.keyImput();
        
    }
// animalsystem.update();
}

// render all objects to screen
void render()
{
    image(ground, 0, 0,width,height);
    grid.draw();
    animalsystem.run();
    currentPiece.render();
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

// update and render game loop
void draw()
{
    update();
    render();
}
