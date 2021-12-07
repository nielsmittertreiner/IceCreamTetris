import processing.sound.*;
import samuelal.squelized.*;
import java.util.Properties;

import java.sql.*;

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
// NameSelector nameselector;
int last;
int m;


SoundFile backgroundMusic;

void initialize()
{asset = new Asset();
  connect = new Connect();
  mainMenu = new MainMenu();
  highscore = new Highscore();
  pauseMenu = new PauseMenu();
  credits = new Credits();
  endScreen = new EndScreen();
  gameManager = new GameManager();
  riverAnimation = new RiverAnimation();
  button = new Button();
  ui = new UI();
  grid = new Grid(20, 9, 80);
  animalsystem = new AnimalSystem(grid);
  currentPiece = new Piece(int(random(0, 8)));
  nextPiece = new Piece(int(random(0, 8)));
  icecreamsystem = new IceCreamSystem(grid); 
  endScreen = new EndScreen();
//   nameselector = new NameSelector();

}


void setup()
{
  size(1600, 900, P2D);

  initialize();
  
  
  connect.connect();
  asset.loadAssets();
  mainMenu.setup();
  pauseMenu.setup();
  endScreen.setup();
  credits.setup();
  riverAnimation.setup();
  icecreamsystem.resetTimer();
  ui.setup();
  asset.backgroundMusic.loop();
  asset.backgroundMusic.amp(0.05);
  highscore.setup();
//   nameselector.setup();
}

// update all game objects
void update()
{

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
                   
                
                grid.pushRows(i);
            
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
                     icecreamsystem.timeExtra();
                     grid.removeRow(i);
                     grid.pushRows(i);
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

}


// render all objects to screen
void render()
{
    switch(gameManager.gameState)
    {
        case 0:
            // main menu
            mainMenu.render();
            break;
        case 1:
            // game
            asset.drawBackground();
            grid.render();
            icecreamsystem.render();
            currentPiece.render();
            //nextPiece.renderPreview();
            ui.render();

            animalsystem.run();
            break;
        
        case 2:
            // pause menu
            pauseMenu.render();
            break;
        
        case 3:
            // credits
            credits.render();
            break;
        case 4: 
        //end Screen
         endScreen.render();
         break;
        case 5:
        //highscore
        highscore.render();
        break;
    }        
}

// update and render game loop
void draw()
{
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

// test
