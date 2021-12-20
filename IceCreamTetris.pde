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
Particles particle;
IceCreamSystem icecreamsystem;
RiverAnimation riverAnimation;
Connect connect;
// NameSelector nameselector;
int last;
int m;
SoundFile backgroundMusic;



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
  gameManager = new GameManager();
  riverAnimation = new RiverAnimation();
  button = new Button();
  ui = new UI();
  particle = new Particles();
  currentPiece = new Piece(int(random(0, gameManager.pieceAmount)));
  nextPiece = new Piece(int(random(0,gameManager.pieceAmount)));
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
  particle.setup();
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
        gameManager.spawnpiece = false;
        animalsystem.moveAnimal(i);
        
      }

      if (animalsystem.checkpassed(i)) 
      {
        // grid.removeRow(i);
        grid.pushRow(i);
        animalsystem.respawnanimal(i);  
        animalsystem.checkoverlapp(i);
      }  
      if (animalsystem.respawning(i))
      {
        animalsystem.movetospawn(i);
        gameManager.spawnpiece = true;
      }
    }
    for (int i = 0; i < 15; ++i) 
    { 
      if (grid.isRowFull(i)) 
      {
        gameManager.changeSpeedDifficulty();
        icecreamsystem.timeExtra();
        gameManager.addScore(15); 
        grid.removeRow(i);
        grid.pushRow(i);

      }
    }

    m = millis() - last;
    // movement Pieces
     if (gameManager.storm)
            {
                if (millis() > last + (gameManager.speeddifficulty/gameManager.stormSpeed)) {
                    last= millis();
                    currentPiece.move(grid, 1, 0);// this.x += 80;
                }
            }
            else
            {
                if (millis() > last + gameManager.speeddifficulty) {
                    last= millis();
                    currentPiece.move(grid, 1, 0);// this.x += 80;
                }  
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
    //achievements
 //   achievement.keyInput(); 
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
            currentPiece.renderBeam();
            grid.renderTiles();
            icecreamsystem.render();
            currentPiece.render();
            if (gameManager.stormTimer == gameManager.stormTimerCoolDown - 1 || gameManager.storm){
              image(asset.cloud, width/2, 10, 100,100);
            }
            //nextPiece.renderPreview();
            ui.render();
            animalsystem.run();
            gameManager.selectedButton = 0;
            for (int i = 15; i < 20; ++i) 
    { 
      if (grid.isRowFull(i)) 
      { 
        particle.render(i);
      }
    }
      if (gameManager.score >= 500 && gameManager.score < 600) {
               gameManager.show = true;
               image(particle.textWolk,700,500, 500,500);
           }
           if (gameManager.score >= 1000 && gameManager.score < 1100) {
             gameManager.show = true;
             image(particle.textWolk2, 700, 500, 500, 500);
           }
           for (int i = 0; i < 20; ++i) 
           {
             
            if (grid.isRowFull(i) &&  grid.isRowFull(i-1)) 
             {
             gameManager.show = true;
             image(particle.textWolk1, 700, 500, 500, 500);
            }
           }
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
