// initialize game
Asset asset;
MainMenu mainMenu;
PauseMenu pauseMenu;
Credits credits;
Button button;
GameManager gameManager;
Grid grid;
UI ui;
AnimalSystem animalsystem;
Piece currentPiece;
Piece nextPiece;
IceCreamSystem icecreamsystem;
RiverAnimation riverAnimation;
PImage ground;
int groundColour;
int last;
int m;

void setup()
{
    size(1600, 900, P2D);
    asset = new Asset();
    ground = loadImage("img/ground.jpg");
    groundColour = asset.green;
    mainMenu = new MainMenu();
    pauseMenu = new PauseMenu();
    credits = new Credits();
    gameManager = new GameManager();
    // animalsystem = new AnimalSystem();
    riverAnimation = new RiverAnimation();
    button = new Button();
    ui = new UI();
    grid = new Grid(20, 9, 80);
    animalsystem = new AnimalSystem(grid);
    currentPiece = new Piece(int(random(0,8)));
    // nextPiece = new Piece(int(1));
    icecreamsystem = new IceCreamSystem(grid); 

    mainMenu.setup();
    pauseMenu.setup();
    credits.setup();
    riverAnimation.setup();
    icecreamsystem.resettimer();
}

// update all game objects
void update()
{
    gameManager.update();
    gameManager.keyInput();
    switch(gameManager.gameState) 
    {
        case -1:
            //quit
            exit();
            break;
        case 0:
            // main menu
            mainMenu.keyInput();
            break;
        case 1:
            // game
            // checks if grid is full and moves the animal.
            for (int i = 15; i < 20; ++i) 
            { 
                if (grid.isRowFull(i)) 
                {
                    animalsystem.moveAnimal(i);    
                }
                
                if (animalsystem.checkpassed(i)) 
                {
                    grid.removeRow(i);
                    animalsystem.respawnanimal(i);  
                    animalsystem.checkoverlapp(i);
                }  
                if (animalsystem.respawning(i))
                {
                    animalsystem.movetospawn(i);
                }    
            }
            for (int i = 0; i < 15; ++i) 
            { 
                if (grid.isRowFull(i)) 
                {
                    grid.removeRow(i);
                }

            }
        
        m = millis() - last;
        // movement Pieces
        if (millis() > last + gameManager.speeddifficulty) {
            last = millis();
            currentPiece.move(grid, 1, 0);// this.x += 80;
        }   

        case 2:
            // pause menu
            pauseMenu.keyInput();
            break;
        
        case 3:
            //credits
            credits.keyInput();
            break;
    }
}

// render all objects to screen
void render()
{
    switch(gameManager.gameState)
    {
        case 0:
            // main menu
            mainMenu.draw();
            break;
        case 1:
            // game
            image(ground, 0, 0, width, height);
            fill(groundColour, asset.opacity);
            rect(0, 0, width, height);
            grid.draw();
            icecreamsystem.draw();
            animalsystem.run();
            currentPiece.render();
            ui.draw();
            break;
        
        case 2:
            // pause menu
            pauseMenu.draw();
            break;
        
        case 3:
            // credits
            credits.draw();
            break;
    }        
}

// update and render game loop
void draw()
{
    
    update();
    render();
}

// test
            
