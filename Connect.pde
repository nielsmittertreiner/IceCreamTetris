class Connect
{
  Properties props = new Properties();
  SQLConnection myConnection;

  String userid;

  String id;

Table table; 
Table timep;

  void connect()
  {
    props.setProperty("user", "nieropb1");
    props.setProperty("password", "80dF3T8.VrykZG");
    myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/znieropb1", props);
  }

  void gettable()
  {
    Table table2 = myConnection.getTable("User");
    table2 = myConnection.runQuery("SELECT id FROM User;");    

    for (int i = 0; i< table2.getRowCount(); i++) 
    {
      TableRow row = table2.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) 
      {
        id = row.getString(j);
      }
    }

     table = myConnection.getTable("Score");
     table = myConnection.runQuery("SELECT U.name, MAX(S.Score) as Score FROM User as U INNER JOIN Score as S ON S.userid = U.id GROUP BY U.id ORDER BY score DESC LIMIT 10");    
     timep = myConnection.getTable("User");
     timep = myConnection.runQuery("SELECT name, timesplayed FROM User ORDER BY timesplayed DESC LIMIT 10;");
  }


 void sessionUpdate(String useR, int piecesused,int crosscount,int stormcount,int combocount)
 {
   getuserid(useR);

   float timeplayed = sessiontimer / 1000;

   

   myConnection.updateQuery("INSERT INTO Session (userid, timeplayed, piecesused, crosscount, stormcount , combo) VALUES (\""+ userid + "\","+ timeplayed +","+ piecesused +","+ crosscount +", "+ stormcount +","+ combocount +");");

   println(userid);
   println(piecesused);
   println(crosscount);
   println(stormcount);
   println(combocount/202);

 }

  void UpdateDtb(String useR, int scorE)
  {
    Table user = myConnection.getTable("User");
     user = myConnection.runQuery("SELECT name FROM User WHERE name='" + useR + "'");

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
    Table user2 = myConnection.getTable("User");
     user2 = myConnection.runQuery("SELECT id FROM User WHERE name='" + useR + "'");

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

  void addUser(String user)
  {
    myConnection.updateQuery("INSERT INTO User (name) VALUES (\""+ user + "\");");
  }

  void printhighscore()
  {
    text("Highscore", 100, 200);
    line(100, 210, 400, 210);
    textSize(32);
    fill(255);
    for (int i = 0; i < table.getRowCount(); i++) {
        TableRow row = table.getRow(i);

        for (int j = 0; j < row.getColumnCount(); j++) {

          text(row.getString(j), 100+ 200*j, 250+50*i);
        }
      
    }
    noFill();
    textSize(50);

    text("Times Played", width - 400, 200);
    line(width - 400, 210, 1500, 210);

    textSize(32);
    fill(255);
    for (int i = 0; i < timep.getRowCount(); i++) {
        TableRow row = timep.getRow(i);


        for (int j = 0; j < row.getColumnCount(); j++) {

          text(row.getString(j), (width - 400) +  200*j, 250+50*i);
        }
      }
    }
  
}
