import processing.sound.*;
import samuelal.squelized.*;
import java.util.Properties;

import java.sql.*;

// initialize game
Asset asset;
Achievement achievement; 
Profile profile;
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
Piece piece;
Gamestats gamestats;
// Particles particle;
IceCreamSystem iceCreamSystem;
RiverAnimation riverAnimation;
Connect connect;
// NameSelector nameselector;
int last;
int m;
SoundFile backgroundMusic;
float sessiontimer;
ParticleSystem particleSystem;



void initialize()
{
  asset = new Asset();
  connect = new Connect();
  grid = new Grid(20, 9, 80);
  mainMenu = new MainMenu();
  animalsystem = new AnimalSystem(grid);
  highscore = new Highscore();
  pauseMenu = new PauseMenu();
  credits = new Credits();
  endScreen = new EndScreen();
  achievement = new Achievement();
  profile = new Profile();
  gameManager = new GameManager();
  riverAnimation = new RiverAnimation();
  button = new Button();
  ui = new UI();
  gamestats = new Gamestats();
  // particle = new Particles();
  piece = new Piece();
  iceCreamSystem = new IceCreamSystem(grid); 
  endScreen = new EndScreen();
  particleSystem = new ParticleSystem(300,100);
 
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
  iceCreamSystem.resetTimer();
  asset.backgroundMusic.loop();
  asset.backgroundMusic.amp(0.05);
  highscore.setup();
  profile.setup();
  achievement.setup();
  gamestats.setup();
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
    gameManager.reset();
    break;
  case 1:
    // game
    gameManager.keyInput();
    // checks if grid is full and moves the animal.
   sessiontimer = millis();
    m = millis() - last;
    // movement Pieces
    
     if (gameManager.storm)
            {
              
                if (millis() > last + (gameManager.speeddifficulty/gameManager.stormSpeed)) {
                    last= millis();
                    piece.move(grid, 1, 0);// this.x += 80;
                }
            }
            else
            {
                if (millis() > last + gameManager.speeddifficulty) {
                    last= millis();
                    piece.move(grid, 1, 0);// this.x += 80;
                }  
            }
if(gameManager.stormTimer == gameManager.stormTimerCoolDown - 1 ||gameManager.storm)
{
  particleSystem.updateRain();
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
  case 6: 
    //profile
    profile.keyInput();
    break;
  case 7: 
    //achievements
    achievement.keyInput(); 
    break;
  case 8: 
    //gamestats
    gamestats.keyInput(); 
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
            grid.renderBox();
            ui.render();
            piece.renderBeam();
            grid.renderTiles();
            iceCreamSystem.render();
            piece.render();
            gameManager.checkAchievements();
            animalsystem.run();
            gameManager.checkRows();
            gameManager.checkStorm();
            gameManager.selectedButton = 0;
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
        case 6: 
            //Profile
            profile.render();
            break;
        case 7: 
            //Achievement;
            achievement.render();
            break;
        case 8: 
    //gamestats
    gamestats.render(); 
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