class Connect
{
  Properties props = new Properties();
  SQLConnection myConnection;
  Table table;
  Table table2;
  Table user;
  Table user2;
  Table timep;

  int highscorerows = 10;

  String userid;

  String id;

  void connect()
  {
    props.setProperty("user", "nieropb1");
    props.setProperty("password", "80dF3T8.VrykZG");
    myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/znieropb1", props);
  }

  void gettable()
  {
    table2 = myConnection.getTable("user");
    table2 = myConnection.runQuery("SELECT id FROM user;");    

    for (int i = 0; i< table2.getRowCount(); i++) 
    {
      TableRow row = table2.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) 
      {

        id = row.getString(j);
      }
    }

    table = myConnection.getTable("Score");
    table = myConnection.runQuery("SELECT (SELECT name FROM user WHERE id = userid), score FROM Score ORDER BY score DESC;");    

    timep = myConnection.getTable("user");
    timep = myConnection.runQuery("SELECT name, timesplayed FROM user ORDER BY timesplayed DESC;");
  }
  
  void UpdateDtb(String useR, int scorE)
  {
    user = myConnection.getTable("user");
    user = myConnection.runQuery("SELECT name FROM user WHERE name='" + useR + "'");

    println("users" +user.getRowCount());
    if (user.getRowCount() == 0)
    {
      addUser(useR);
      println("user toegevoegd");
    }

    getuserid(useR);

    println("userid = "+ userid);

    scoretodtb(userid, scorE);
  }

  void getuserid(String useR)
  {
    user2 = myConnection.getTable("user");
    user2 = myConnection.runQuery("SELECT id FROM user WHERE name='" + useR + "'");

    for (int i = 0; i< user2.getRowCount(); i++) {
      TableRow row = user2.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) {

        userid = row.getString(j);
      }
    }
  }

  void scoretodtb(String useR, int scorE)
  {
    myConnection.updateQuery("INSERT INTO Score (userid, score) VALUES (\""+ useR + "\","+ scorE +");");
  }

  void timesplayed()
  {
    myConnection.updateQuery("UPDATE user SET timesplayed = timesplayed + 1");
  }


  void addUser(String user)
  {
    myConnection.updateQuery("INSERT INTO user (name) VALUES (\""+ user + "\");");
  }

  void printTable()
  {
    text("Highscore", 100, 200);
    line(100, 210, 400, 210);
    textSize(32);
    fill(255);
    for (int i = 0; i < table.getRowCount(); i++) {
      TableRow row;
      if (i < 10) {
        row = table.getRow(i);

        for (int j = 0; j < row.getColumnCount(); j++) {

          text(row.getString(j), 100+ 200*j, 250+50*i);
        }
      }
    }
    noFill();
    textSize(50);

    text("Times Played", width - 400, 200);
    line(width - 400, 210, 1500, 210);

    textSize(32);
    fill(255);
    for (int i = 0; i < timep.getRowCount(); i++) {
      TableRow row;
      if (i < 10) {
        row = timep.getRow(i);


        for (int j = 0; j < row.getColumnCount(); j++) {

          text(row.getString(j), (width - 400) +  200*j, 250+50*i);
        }
      }
    }
  }
}
