import processing.sound.*;
import samuelal.squelized.*;
import java.util.Properties;

// initialize game
Asset asset;
Highscore highscore;
MainMenu mainMenu;
PauseMenu pauseMenu;
EndScreen endScreen;
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
Connect connect;
PImage ground;
int groundColour;
int last;
int m;


SoundFile backgroundMusic;

void setup()
{
  size(1600, 900, P2D);
  asset = new Asset();
  connect = new Connect();
  
<<<<<<< HEAD
=======

    
    
>>>>>>> 79d8fb5 (Sound and database connection)
  asset.loadSound();
  ground = loadImage("img/ground.jpg");
  groundColour = asset.green;
  mainMenu = new MainMenu();
  highscore = new Highscore();
  pauseMenu = new PauseMenu();
  credits = new Credits();
<<<<<<< HEAD
  endScreen = new EndScreen();
  gameManager = new GameManager();
=======
  gameManager = new GameManager();
  // animalsystem = new AnimalSystem();
>>>>>>> 79d8fb5 (Sound and database connection)
  riverAnimation = new RiverAnimation();
  button = new Button();
  ui = new UI();
  grid = new Grid(20, 9, 80);
  animalsystem = new AnimalSystem(grid);
  currentPiece = new Piece(int(random(0, 8)));
  // nextPiece = new Piece(int(1));
  icecreamsystem = new IceCreamSystem(grid); 
<<<<<<< HEAD
  endScreen = new EndScreen();

  gameManager.setup();
  mainMenu.setup();
  pauseMenu.setup();
  credits.setup();
  endScreen.setup();
  riverAnimation.setup();
  icecreamsystem.resettimer();
  ui.setup();
=======


  mainMenu.setup();
  pauseMenu.setup();
  //credits.setup();
  riverAnimation.setup();
  icecreamsystem.resettimer();

>>>>>>> 79d8fb5 (Sound and database connection)
  asset.backgroundMusic.loop();
  asset.backgroundMusic.amp(0.05);
  
      connect.connect();
<<<<<<< HEAD


=======
>>>>>>> 79d8fb5 (Sound and database connection)
}

// update all game objects
void update()
{
<<<<<<< HEAD

    gameManager.update();
    switch(gameManager.gameState) 
    {
        case - 1:
            //quit
            exit();
            break;
        case 0:
            // main menu
            mainMenu.keyInput();
            break;
        case 1:
            // game
            gameManager.keyInput();
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
                last= millis();
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
        case 4:
        endScreen.keyInput();
        break;
        case 5:
        //highscore
        highscore.keyInput();
        break;
    }

=======
  //gameManager.keyInput();
  switch(gameManager.gameState) 
  {
    // case - 1:
    //quit
    //   exit();
    //   break;
  case 0:
    // main menu
    mainMenu.keyInput();
    break;
  case 1:
    // game
    gameManager.keyInput();
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
      last= millis();
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
>>>>>>> 79d8fb5 (Sound and database connection)
}


// render all objects to screen
void render()
<<<<<<< HEAD
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
            currentPiece.render();
            ui.draw();
            gameManager.draw();
            animalsystem.run();
            break;
        
        case 2:
            // pause menu
            pauseMenu.draw();
            break;
        
        case 3:
            // credits
            credits.draw();
            break;
        case 4: 
        //end Screen
         endScreen.draw();
         break;
                 case 5:
        //highscore
        highscore.draw();
        break;
    }        
=======
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
    currentPiece.render();
    icecreamsystem.draw();
    animalsystem.run();
    ui.draw();
    break;

  case 2:
    // pause menu
    highscore.draw();
    break;

  case 3:
    // credits
    credits.draw();
    break;
  }
>>>>>>> 79d8fb5 (Sound and database connection)
}

// update and render game loop
void draw()
{
<<<<<<< HEAD
    update();
    render();
}

void keyPressed()
{
    if (key== ESC)
    {   
        key = 'E';
    }
}

=======

  update();
  render();
}

>>>>>>> 79d8fb5 (Sound and database connection)
// test
