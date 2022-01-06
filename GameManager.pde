class GameManager
{
  //-1 = paused, 0 = starting menu, 1 = game
  int gameState = 0;
  int score = 0, difficulty = 0;
  int speeddifficulty = 600;
  int selectedButton;
  boolean storm = false;
  float stormSpeed = 2;
  int stormTimer = 0;
  int stormTimerDuration, stormTimerDurationMin = 1, stormTimerDurationMax = 3;
  int stormTimerCoolDown, stormTimerCoolDownMin = 8, stormTimerCoolDownMax = 12;
  char usedKey = ' ';
  int timer = 0, timerTotal = 15;
  int pieceAmount = 8;
  boolean spawnpiece = true;
  boolean show =false;

  boolean updated = false;
  
//Achievements
  boolean p500 = false;
  boolean p1000 = false;
  boolean r2 = false;

String username;

  void update()
  {   
    if(gameState == 5 && updated == false )

    {
      connect.gettable();
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
      currentPiece.move(grid, 0, 1);// currentPiece.y+=80;
      changeFit();
    } 

    // going Up
    if (usedKey == 'U')
    {

      currentPiece.move(grid, 0, -1);// currentPiece.y -= 80;   
      changeFit();
    } 


    // going forward
    if (usedKey == 'R')
    {
      if (currentPiece.x >= 160)
      {
        currentPiece.move(grid, 1, 0);// currentPiece.x+=80;
      }
    }
    if (usedKey == 'L')
    { 
      currentPiece.rotation = (currentPiece.rotation + 1) % 4;        
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
               image(particle.textWolk,700,500, 500,500);
           }
           if (score >= 1000 && score < 1100) {
             show = true;
             p1000 = true;
             image(particle.textWolk2, 700, 500, 500, 500);
           }
           for (int i = 0; i < 20; ++i) 
           {
             
            if (grid.isRowFull(i) &&  grid.isRowFull(i-1)) 
             {
             show = true;
             r2 = true;
             image(particle.textWolk1, 700, 500, 500, 500);
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
    if (currentPiece.type == 0) 
    {   
      if (currentPiece.rotation == 0)
      {
        if (currentPiece.y < 90)
        {
          currentPiece.y = 90;
        }
      }
      if (currentPiece.rotation == 1 || currentPiece.rotation == 2 || currentPiece.rotation == 3)
      {
        if (currentPiece.y < 170)
        {
          currentPiece.y = 170;
        }
      }

      if (currentPiece.rotation == 0 || currentPiece.rotation == 1 || currentPiece.rotation == 3)
      {
        if (currentPiece.y > 650)
        {
          currentPiece.y = 650;
        }
      }
      if (currentPiece.rotation == 2)
      {
        if (currentPiece.y > 730)
        {
          currentPiece.y = 730;
        }
      }
    }

    if (currentPiece.type == 1) 
    {

      if (currentPiece.rotation == 0 || currentPiece.rotation == 2)
      {
        if (currentPiece.y < 90)
        {
          currentPiece.y = 90;
        }
      }
      if (currentPiece.rotation == 1 || currentPiece.rotation == 3)
      {
        if (currentPiece.y < 170)
        {
          currentPiece.y = 170;
        }
      }

      if (currentPiece.y > 650)
      {
        currentPiece.y = 650;
      }
    }

    if (currentPiece.type ==  2) 
    {

      if (currentPiece.rotation == 0 || currentPiece.rotation == 2)
      {
        if (currentPiece.y < 90)
        {
          currentPiece.y = 90;
        }
      }
      if (currentPiece.rotation == 1 || currentPiece.rotation == 3)
      {
        if (currentPiece.y < 170)
        {
          currentPiece.y = 170;
        }
      }

      if (currentPiece.y > 650)
      {
        currentPiece.y = 650;
      }
    }

    if (currentPiece.type == 3) 
    {

      if (currentPiece.rotation ==  0)
      {
        if (currentPiece.y < 90)
        {
          currentPiece.y = 90;
        }
      }
      if (currentPiece.rotation == 1  || currentPiece.rotation == 2 || currentPiece.rotation == 3)
      {
        if (currentPiece.y < 170)
        {
          currentPiece.y = 170;
        }
      }

      if (currentPiece.rotation == 0 || currentPiece.rotation == 1 || currentPiece.rotation == 3)
      {
        if (currentPiece.y > 650)
        {
          currentPiece.y = 650;
        }
      }
      if (currentPiece.rotation == 2)
      {
        if (currentPiece.y > 730) {
          currentPiece.y = 730;
        }
      }
    }

    if (currentPiece.type == 4) 
    {

      if (currentPiece.rotation == 0  || currentPiece.rotation == 2)
      {
        if (currentPiece.y < 90)
        {
          currentPiece.y = 90;
        }
      }
      if (currentPiece.rotation == 1 || currentPiece.rotation == 3)
      {
        if (currentPiece.y < 170)
        {
          currentPiece.y = 170;
        }
      }

      if (currentPiece.rotation == 1 || currentPiece.rotation == 3)
      {
        if (currentPiece.y > 650)
        {
          currentPiece.y = 650;
        }
      }
      if (currentPiece.rotation == 0 || currentPiece.rotation == 2)
      {
        if (currentPiece.y > 730) {
          currentPiece.y = 730;
        }
      }
    }

    if (currentPiece.type == 8) 
    {
      if (currentPiece.y < 170)
      {
        currentPiece.y = 170;
      }
      if (currentPiece.y > 650)
      {
        currentPiece.y = 650;
      }
    }

    if (currentPiece.type == 5) 
    {
      if (currentPiece.y < 90)
      {
        currentPiece.y = 90;
      }
      if (currentPiece.y > 650)
      {
        currentPiece.y = 650;
      }
    }

    if (currentPiece.type == 6) 
    {
      if (currentPiece.y < 90)
      {
        currentPiece.y = 90;
      }
      if (currentPiece.y > 650)
      {
        currentPiece.y = 650;
      }
    }
   if (currentPiece.type == 7) 
    {

      if (currentPiece.rotation ==  2)
      {
        if (currentPiece.y < 90)
        {
          currentPiece.y = 90;
        }
      }
      if (currentPiece.rotation == 1  || currentPiece.rotation == 0 || currentPiece.rotation == 3)
      {
        if (currentPiece.y < 170)
        {
          currentPiece.y = 170;
        }
      }

      if (currentPiece.rotation == 2 || currentPiece.rotation == 1 || currentPiece.rotation == 3)
      {
        if (currentPiece.y > 650)
        {
          currentPiece.y = 650;
        }
      }
      if (currentPiece.rotation == 0)
      {
        if (currentPiece.y > 730) {
          currentPiece.y = 730;
        }
      }
    }
  }

  void resetStorm()
  {
      stormTimer = 0;
      stormTimerDuration = int(random(stormTimerDurationMin, stormTimerDurationMax + 1));
      stormTimerCoolDown = int(random(stormTimerCoolDownMin, stormTimerCoolDownMax + 1));
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

    p500 = false;
    p1000 = false;
    r2 = false;
    

    for (int i = 0; i < 20; ++i) {
      grid.removeRow(i);
    }
  }
}


// test
