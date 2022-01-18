class GameManager
{
  //-1 = paused, 0 = starting menu, 1 = game
  int gameState = 0;
  int score = 0, difficulty = 0;
  int speeddifficulty = 600;
  int selectedButton;
  boolean storm = false;
  float stormSpeed = 2.5;
  int stormTimer = 0;
  int stormTimerDuration, stormTimerDurationMin = 1, stormTimerDurationMax = 3;
  int stormTimerCoolDown, stormTimerCoolDownMin = 8, stormTimerCoolDownMax = 12;
  char usedKey = ' ';
  int timer = 0, timerTotal = 15;
  int pieceAmount = 8;
  boolean spawnpiece = true;
  boolean show =false;
  boolean combo = false;

  boolean updated = false;
  
//Achievements
  boolean p500 = false;
  boolean p1000 = false;
  boolean r2 = false;

String username;

  int piecesused = 0;
  int crosscount = 0;
  int stormcount = 0;
  int combocount = 0;


  void update()
  {   
    if(gameState == 5 && updated == false )

    {
      connect.getHighscores();
      updated = true;
    }
    if (gameState != 5) 
    {
      updated = false;
    }

    timer++;

    if (keyPressed && timer > timerTotal)
    {
      timer = 0;
      if (key == CODED)
      {
        if (keyCode == UP)
        {
          usedKey = 'U';
        } else if (keyCode == DOWN)
        {
          usedKey = 'D';
        } else if (keyCode == LEFT)
        {
          usedKey = 'L';
        } else if (keyCode == RIGHT)
        {
          usedKey = 'R';
        }
      } else
      {
        usedKey = key;
      }
    } else if (keyPressed & keyCode == RIGHT & gameState == 1)
    {   
      usedKey = 'R';
    } else
    {
      usedKey = 0;
    }


  }

  void keyInput()
  {
    // going Down
    if (usedKey == 'D')
    {
      piece.move(grid, 0, 1);// piece.y+=80;
      changeFit();
    } 

    // going Up
    if (usedKey == 'U')
    {

      piece.move(grid, 0, -1);// piece.y -= 80;   
      changeFit();
    } 


    // going forward
    if (usedKey == 'R')
    {
      if (piece.x >= 160)
      {
        piece.move(grid, 1, 0);// piece.x+=80;
      }
    }
    if (usedKey == 'L')
    { 
      piece.rotation = (piece.rotation + 1) % 4;        
      changeFit();
    }

    //add 2 to Score by pressing m, take 2 away by pressing l
    if (usedKey == 'm')
    {
      gameManager.addScore(50);
    } 
    if (usedKey == 'l')
    {
      gameManager.addScore( -5);
    }

    //up the difficulty by pressing d
    if (gameManager.usedKey == 'd') 
    {
      //gameManager.setDifficulty(1);
    }

    //reset both by pressing r
    if (gameManager.usedKey == 'r')
    {
      gameManager.reset();
    }

    //pause game
    if (gameManager.usedKey == 'E')
    {
      gameManager.gameState = 2;
    }
    if (gameManager.usedKey == 'y')
    {
      gameManager.reset();
      gameManager.gameState = 4;
    }
  }

  void checkrows()
  {
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
        spawnpiece = true;
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



  }

  void addScore(int scoreAdded)
  {
    score += scoreAdded;
    if (score < 0)
    {
      score = 0;
    }
    if (score > 1000 && pieceAmount == 8) {
      pieceAmount +=1;
    }
    changeSpeedDifficulty();
  }
  void checkAchievements(){

     if (score >= 500 && score < 600) {
              show = true;
              p500 = true;
               image(asset.textWolk,700,500, 500,500);
           }
           if (score >= 1000 && score < 1100) {
             show = true;
             p1000 = true;
             image(asset.textWolk2, 700, 500, 500, 500);
           }
           for (int i = 0; i < 20; ++i) 
           {
             
            if (grid.isRowFull(i) &&  grid.isRowFull(i-1)) 
             {
             show = true;
             r2 = true;
             image(asset.textWolk1, 700, 500, 500, 500);
            }
           }
  }

  void changeSpeedDifficulty()
  {
    if (speeddifficulty >= 200)
    {
      speeddifficulty -= (score / 50);
      println(speeddifficulty);
    } else
    {
      println("MaximumDifficultyspeed reached!");
    }
  }


  void changeFit()
  {
    if (piece.type == 0) 
    {   
      if (piece.rotation == 0)
      {
        if (piece.y < 90)
        {
          piece.y = 90;
        }
      }
      if (piece.rotation == 1 || piece.rotation == 2 || piece.rotation == 3)
      {
        if (piece.y < 170)
        {
          piece.y = 170;
        }
      }

      if (piece.rotation == 0 || piece.rotation == 1 || piece.rotation == 3)
      {
        if (piece.y > 650)
        {
          piece.y = 650;
        }
      }
      if (piece.rotation == 2)
      {
        if (piece.y > 730)
        {
          piece.y = 730;
        }
      }
    }

    if (piece.type == 1) 
    {

      if (piece.rotation == 0 || piece.rotation == 2)
      {
        if (piece.y < 90)
        {
          piece.y = 90;
        }
      }
      if (piece.rotation == 1 || piece.rotation == 3)
      {
        if (piece.y < 170)
        {
          piece.y = 170;
        }
      }

      if (piece.y > 650)
      {
        piece.y = 650;
      }
    }

    if (piece.type ==  2) 
    {

      if (piece.rotation == 0 || piece.rotation == 2)
      {
        if (piece.y < 90)
        {
          piece.y = 90;
        }
      }
      if (piece.rotation == 1 || piece.rotation == 3)
      {
        if (piece.y < 170)
        {
          piece.y = 170;
        }
      }

      if (piece.y > 650)
      {
        piece.y = 650;
      }
    }

    if (piece.type == 3) 
    {

      if (piece.rotation ==  0)
      {
        if (piece.y < 90)
        {
          piece.y = 90;
        }
      }
      if (piece.rotation == 1  || piece.rotation == 2 || piece.rotation == 3)
      {
        if (piece.y < 170)
        {
          piece.y = 170;
        }
      }

      if (piece.rotation == 0 || piece.rotation == 1 || piece.rotation == 3)
      {
        if (piece.y > 650)
        {
          piece.y = 650;
        }
      }
      if (piece.rotation == 2)
      {
        if (piece.y > 730) {
          piece.y = 730;
        }
      }
    }

    if (piece.type == 4) 
    {

      if (piece.rotation == 0  || piece.rotation == 2)
      {
        if (piece.y < 90)
        {
          piece.y = 90;
        }
      }
      if (piece.rotation == 1 || piece.rotation == 3)
      {
        if (piece.y < 170)
        {
          piece.y = 170;
        }
      }

      if (piece.rotation == 1 || piece.rotation == 3)
      {
        if (piece.y > 650)
        {
          piece.y = 650;
        }
      }
      if (piece.rotation == 0 || piece.rotation == 2)
      {
        if (piece.y > 730) {
          piece.y = 730;
        }
      }
    }

    if (piece.type == 8) 
    {
      if (piece.y < 170)
      {
        piece.y = 170;
      }
      if (piece.y > 650)
      {
        piece.y = 650;
      }
    }

    if (piece.type == 5) 
    {
      if (piece.y < 90)
      {
        piece.y = 90;
      }
      if (piece.y > 650)
      {
        piece.y = 650;
      }
    }

    if (piece.type == 6) 
    {
      if (piece.y < 90)
      {
        piece.y = 90;
      }
      if (piece.y > 650)
      {
        piece.y = 650;
      }
    }
   if (piece.type == 7) 
    {

      if (piece.rotation ==  2)
      {
        if (piece.y < 90)
        {
          piece.y = 90;
        }
      }
      if (piece.rotation == 1  || piece.rotation == 0 || piece.rotation == 3)
      {
        if (piece.y < 170)
        {
          piece.y = 170;
        }
      }

      if (piece.rotation == 2 || piece.rotation == 1 || piece.rotation == 3)
      {
        if (piece.y > 650)
        {
          piece.y = 650;
        }
      }
      if (piece.rotation == 0)
      {
        if (piece.y > 730) {
          piece.y = 730;
        }
      }
    }
  }

  void resetStorm()
  {
      stormTimer = 0;
      stormTimerDuration = int(random(stormTimerDurationMin, stormTimerDurationMax + 1));
      stormTimerCoolDown = int(random(stormTimerCoolDownMin, stormTimerCoolDownMax + 1));
      stormcount +=1;
  }

  void updateStorm()
  {


      stormTimer++;
      if (stormTimer >= stormTimerCoolDown)
      {
        storm = true;
      }
      else
      {
        storm = false;
      }
      if (stormTimer >= stormTimerCoolDown + stormTimerDuration)
      {
        resetStorm();
      }
      println(stormTimer, stormTimerCoolDown, stormTimerDuration, storm);
  }



  void reset()
  {
    speeddifficulty = 600; 
    difficulty = 0;
    score = 0;
    pieceAmount = 8;
    icecreamsystem.resetTimer();
    icecreamsystem.resetIcecream();
    animalsystem.resetAnimal();
    gameManager.resetStorm();

  piecesused = 0;
  crosscount = 0;
  stormcount = 0;
  combocount = 0;

    p500 = false;
    p1000 = false;
    r2 = false;
    

    for (int i = 0; i < 20; ++i) {
      grid.removeRow(i);
    }
  }
}


// test
