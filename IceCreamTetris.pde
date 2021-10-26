// initialize game
Asset asset;
MainMenu mainMenu;
PauseMenu pauseMenu;
Button button;
GameManager gameManager;
Grid grid;
UI ui;
AnimalSystem animalsystem;
Piece currentPiece;
Piece nextPiece;
IceCreamSystem icecreamsystem;
PImage ground;

void setup()
{
    size(1600, 900, P2D);
    ground = loadImage("img/ground.jpg");
    asset = new Asset();
    mainMenu = new MainMenu();
    pauseMenu = new PauseMenu();
    gameManager = new GameManager();
    // animalsystem = new AnimalSystem();
    button = new Button();
    ui = new UI();
    grid = new Grid(20, 9, 80);
<<<<<<< HEAD
    grid.setState(17,0,1);
    grid.setState(17,1,1);
    grid.setState(17,2,1);
    grid.setState(17,3,1);
    grid.setState(17,4,1);
    grid.setState(17,5,1);
    grid.setState(17,6,1);
    grid.setState(17,7,1);
    grid.setState(17,8,1);

    grid.setState(11,8,1);
    grid.setState(13,8,1);
    grid.setState(15,8,1);
    grid.setState(19,8,1);




=======
    grid.setState(0,0,1);
    grid.setState(1,1,1);
    grid.setState(1,2,1);
    grid.setState(1,3,1);
    grid.setState(1,4,1);
    grid.setState(1,5,1);
    grid.setState(1,6,1);
    grid.setState(1,7,1);
    grid.setState(1,8,1);
    
>>>>>>> 2e44aa1b3c8f94b01f26a4c8c5ac05eb7b62bf5b
    animalsystem = new AnimalSystem(grid);
    currentPiece = new Piece(int(random(0,7)));
    nextPiece = new Piece(int(random(0, 7)));
<<<<<<< HEAD

    // grid.addPiece(currentPiece, 10, 4);
=======
    icecreamsystem = new IceCreamSystem(grid); 
   
    
    //grid.addPiece(currentPiece, 10, 4);
    
    mainMenu.setup();
    pauseMenu.setup();
>>>>>>> 2e44aa1b3c8f94b01f26a4c8c5ac05eb7b62bf5b
}

// update all game objects
void update()
{
    ui.keyInput();
    //  main menu
    if (gameManager.gameState == 0)
    {
        mainMenu.keyInput();
    }
    // game
    else if (gameManager.gameState == 1) 
    {
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
    }
    // pause menu
    else
    {
        pauseMenu.keyInput();
    }
}

// render all objects to screen
void render()
{
<<<<<<< HEAD
    image(ground, 0, 0,width,height);
    grid.draw();
    animalsystem.draw();
    currentPiece.render();
=======
    // main menu
    if (gameManager.gameState == 0)
    {
        mainMenu.draw();
    }
    // game
    else if (gameManager.gameState == 1)
    {
        image(ground, 0, 0,width,height);
        grid.draw();
        animalsystem.run();
        currentPiece.render();
        ui.draw();
    }
    // pause menu
    else 
    {
        pauseMenu.draw();
    }
>>>>>>> 2e44aa1b3c8f94b01f26a4c8c5ac05eb7b62bf5b
}

// update and render game loop
void draw()
{
    update();
    render();
}
