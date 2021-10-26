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
int groundColour;

void setup()
{
    size(1600, 900, P2D);
    asset = new Asset();
    ground = loadImage("img/ground.jpg");
    groundColour = asset.green;
    mainMenu = new MainMenu();
    pauseMenu = new PauseMenu();
    gameManager = new GameManager();
    // animalsystem = new AnimalSystem();
    button = new Button();
    ui = new UI();
    grid = new Grid(20, 9, 80);
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
    
    
    
    
    animalsystem = new AnimalSystem(grid);
    currentPiece = new Piece(int(random(0,7)));
    nextPiece = new Piece(int(random(0, 7)));
    icecreamsystem = new IceCreamSystem(grid); 
    
    
    //grid.addPiece(currentPiece, 10, 4);
    
    mainMenu.setup();
    pauseMenu.setup();
}

// update all game objects
void update()
{
    ui.keyInput();
    switch(gameManager.gameState) {
        case 0:
            // main menu
            mainMenu.keyInput();
            
        case 1:
            // game
            // checks if grid is full and moves the animal.
            for (int i = 15; i < 20; ++i) { 
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
        break;
        // pausemenu
        case 2:
            pauseMenu.keyInput();
            break;
        
    }
}

// render all objects to screen
void render()
    {
    switch(gameManager.gameState) {
        case 0:
            // main menu
            mainMenu.draw();
            break;
        case 1:
            // game
            image(ground, 0, 0, width, height);
            fill(groundColour, 150);
            rect(0, 0, width, height);
            grid.draw();
            animalsystem.run();
            currentPiece.render();
            ui.draw();
            break;
        
        case 2:
            // pausemenu
            pauseMenu.draw();
            break;
    }
    
}

// update and render game loop
void draw()
    {
    update();
    render();
}

