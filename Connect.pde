class Connect
{
  Properties props = new Properties();
  SQLConnection myConnection;

  Table getuserid;
  Table highScores;
  Table user;
  Table user2;
  Table timep;
  Table behaald;
  Table achievement;
  Table session;
  Table highScore;
  Table gamestats;

  String userid;
  String id;

  //Stores all properties to connect with the database.
  void connect()
  {
    props.setProperty("user", "nieropb1");
    props.setProperty("password", "80dF3T8.VrykZG");
    myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/znieropb1", props);
  }

  //Returns the userid from a username.
  void getuserid(String useR)
  {
    Table user2 = myConnection.getTable("User");
    user2 = myConnection.runQuery("SELECT id FROM User WHERE name='"+ useR + "'");

    for (int i = 0; i< user2.getRowCount(); i++) {
      TableRow row = user2.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) {

        userid = row.getString(j);
      }
    }
  }

  //Select the top 10 highscores from the score table and group by the user id so 1 user can only have 1 highscore.
  void getHighscores()
  {
    highScores = myConnection.getTable("Score");
    highScores = myConnection.runQuery("SELECT U.name, MAX(S.Score) as Score FROM User as U INNER JOIN Score as S ON S.userid = U.id GROUP BY U.id ORDER BY score DESC LIMIT 10");    
  }

  //Select all the achievements that are reached by a player.
  void getBehaald(String useR)
  { 
    getuserid(useR);

    behaald = myConnection.getTable("Behaald");
    behaald = myConnection.runQuery("SELECT icon, name, beschrijving FROM Achievement WHERE id = ANY(SELECT achievementid FROM Behaald WHERE userid = '"+ userid +"' GROUP BY achievementid)");
  }

  //Select all the gamestats of the last game a player played.
  void getGameStats(String useR)
  { 
    getuserid(useR);

    gamestats = myConnection.getTable("Session");
    gamestats = myConnection.runQuery("SELECT timeplayed,piecesused,crosscount,stormcount,combo From Session WHERE sessionid = (SELECT MAX(sessionid)FROM Session WHERE userid = \""+ userid + "\" );");
  }

  //Select the number of games a player played and his/her highscore.
  void getProfileStats(String useR)
  {
    getuserid(useR);

    session = myConnection.getTable("Session");
    session = myConnection.runQuery("SELECT count(*) FROM Session WHERE userid = '"+userid+"'");

    highScore = myConnection.getTable("Score");
    highScore = myConnection.runQuery("SELECT MAX(score) FROM Score WHERE userid = '"+userid+"'");
  }

  //Select all the achievements that are in the database.
  void getAchievements()
  {
    achievement = myConnection.getTable("Achievement");
    achievement = myConnection.runQuery("SELECT icon, name, beschrijving FROM Achievement");
  }

  //Updates the database, it looks if the user who is inserted already exists if not it adds the user to the database with the score and the achievements. Then it loads the setup of the profile calss
  //so it is up to date.
    void UpdateDtb(String useR, int scorE)
  {
    Table user = myConnection.getTable("User");
    user = myConnection.runQuery("SELECT name FROM User WHERE name='"+ useR +"'");

    if (user.getRowCount() == 0)
    {
      addUser(useR);
    }

    getuserid(useR);

    scoreTodtb(userid, scorE);
    achievementsTodtb(userid);

    profile.setup();
  }

  // Adds user to database.
  void addUser(String user)
  {
    myConnection.updateQuery("INSERT INTO User (name) VALUES (\""+ user + "\");");
  }

    //Adds a score to the database.
  void scoreTodtb(String useR, int scorE)
  {
    myConnection.updateQuery("INSERT INTO Score (userid, score) VALUES (\""+ useR + "\","+ scorE +");");
  }

  //Adds a session to the database and calculates the time played to seconds and calculates the comobocount.
  void sessionUpdate(String useR, int piecesused, int crosscount, int stormcount, int combocount)
  {
    getuserid(useR);
    combocount = (combocount/202)/2;

    float timeplayed = sessiontimer / 1000;

    myConnection.updateQuery("INSERT INTO Session (userid, timeplayed, piecesused, crosscount, stormcount , combo) VALUES (\""+ userid + "\","+ timeplayed +","+ piecesused +","+ crosscount +", "+ stormcount +","+ combocount +");");
  }

  //Adds the reached achievements to the database.
  void achievementsTodtb(String useRid)
  {
    if (gameManager.p500) 
    {
      myConnection.updateQuery("INSERT INTO Behaald (userid,achievementid) VALUES (\""+ useRid + "\",1);");
    }
    if (gameManager.p1000) 
    {

      myConnection.updateQuery("INSERT INTO Behaald (userid,achievementid) VALUES (\""+ useRid + "\",2);");
    }
    if (gameManager.r2 ) 
    {
      myConnection.updateQuery("INSERT INTO Behaald (userid,achievementid) VALUES (\""+ useRid + "\",3);");
    }
  }

  //Uses getProfilestats() to print the profilestats.
  void printProfileStats()
  {   
    for (int i = 0; i< session.getRowCount(); i++) 
    {
      TableRow row = session.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) 
      {
        text(row.getString(j), 350, 300);
      }
    }
    for (int i = 0; i< highScore.getRowCount(); i++) 
    {
      TableRow row = highScore.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) 
      {
        text(row.getString(j), 350, 500);
      }
    }
  }

  //Uses getGamestats() to print the gamestats
void printGameStats()
{

  for (int i = 0; i< gamestats.getRowCount(); i++) 
    {
      TableRow row = gamestats.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) 
      {
        text(row.getString(j), 350+ j * 200, height/2);
      }
    }

}

  //Uses getAchievements() and looks at the first column value and assignes a picture to it.
  void printAchievements()
  {
    for (int i = 0; i< achievement.getRowCount(); i++) 
    {
      TableRow row = achievement.getRow(i);
      for (int j = 1; j < row.getColumnCount(); j++) 
      {
        if (row.getString(0).equals("500p")) {
          image(asset.p500, 250, 210+50*i, 50, 50);
        }
        if (row.getString(0).equals("1000p")) {
          image(asset.p1000, 250, 210+50*i, 50, 50);
        }
        if (row.getString(0).equals("2r")) {
          image(asset.r2, 250, 210+50*i, 50, 50);
        }
        text(row.getString(j), 300 + 300*j, 250+50*i);
      }
    }
  }

  //Uses getBehaald() and prints all the achievement that are reached by the player also looks at the first collumn and assinges a picture to it.
  void printBehaald()
  {

    for (int i = 0; i< behaald.getRowCount(); i++) 
    {
      TableRow row = behaald.getRow(i);
      for (int j = 1; j < row.getColumnCount(); j++) 
      {
        if (row.getString(0).equals("500p")) {
          image(asset.p500, 650, 360+50*i, 50, 50);
        }
        if (row.getString(0).equals("1000p")) {
          image(asset.p1000, 650, 360+50*i, 50, 50);
        }
        if (row.getString(0).equals("2r")) {
          image(asset.r2, 650, 360+50*i, 50, 50);
        }
        text(row.getString(j), 430 + 400 * j, 400+50*i);
      }
    }
  }

  //Uses getHighscores() and prints the top 10 highscores grouped by player id.
  void printHighscores()
  {
    text("Highscore", 650, 200);
    line(650, 210, 950, 210);
    textSize(32);
    fill(asset.white);
    for (int i = 0; i < highScores.getRowCount(); i++) {
      TableRow row = highScores.getRow(i);

      for (int j = 0; j < row.getColumnCount(); j++) {

        text(row.getString(j), 650+ 200*j, 250+50*i);
      }
    }
  }
}
