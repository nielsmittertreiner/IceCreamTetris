class Connect
{
  Properties props = new Properties();
  SQLConnection myConnection;
  Table table;
  Table table2;
  Table user;
  Table user2;
  Table timep;
  Table achievement;


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

void getAchievements(String useR)
{ 
   getuserid(useR);

  achievement = myConnection.getTable("Behaald");
  achievement = myConnection.runQuery("SELECT icon, name, beschrijving FROM Achievement WHERE id = ANY(SELECT achievementid FROM Behaald WHERE userid = '"+ userid +"' GROUP BY achievementid)"); 
}

 void sessionUpdate(String useR, int piecesused,int crosscount,int stormcount,int combocount)
 {
   getuserid(useR);

   float timeplayed = sessiontimer / 1000;

   

   myConnection.updateQuery("INSERT INTO Session (userid, timeplayed, piecesused, crosscount, stormcount , combo) VALUES (\""+ userid + "\","+ timeplayed +","+ piecesused +","+ crosscount +", "+ stormcount +","+ combocount +");");
 }


void printBehaald()
{

  for (int i = 0; i< achievement.getRowCount(); i++) 
    {
      TableRow row = achievement.getRow(i);
      for (int j = 1; j < row.getColumnCount(); j++) 
      {
if (row.getString(0).equals("500p")) {
  image(asset.p500, 250, 210+50*i,50,50);
}
if (row.getString(0).equals("1000p")) {
  image(asset.p1000, 250, 210+50*i,50,50);
}
if (row.getString(0).equals("2r")) {
  image(asset.r2, 250, 210+50*i,50,50);
}
        text(row.getString(j), 100+ 300 *j, 250+50*i);
      }
    }
}
  void UpdateDtb(String useR, int scorE)
  {
    Table user = myConnection.getTable("User");
     user = myConnection.runQuery("SELECT name FROM User WHERE name='" + useR + "'");

    if (user.getRowCount() == 0)
    {
      addUser(useR);
    }

    getuserid(useR);

    scoretodtb(userid, scorE);
    achievementstodtb(userid);

    profile.setup();

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

void achievementstodtb(String useRid)
{
  Table achievement1 = myConnection.runQuery("SELECT count(*) FROM Behaald WHERE userid = \""+ useRid + "\" AND achievementid = 1");
  Table achievement2 = myConnection.runQuery("SELECT count(*) FROM Behaald WHERE userid = \""+ useRid + "\" AND achievementid = 2");
  Table achievement3 = myConnection.runQuery("SELECT count(*) FROM Behaald WHERE userid = \""+ useRid + "\" AND achievementid = 3");

String ach1 = "0";
String ach2 = "0";
String ach3 = "0";

 for (int i = 0; i< achievement1.getRowCount(); i++) {
      TableRow row = achievement1.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) {

        ach1 = row.getString(j);
      }
    }
    for (int i = 0; i< achievement2.getRowCount(); i++) {
      TableRow row = achievement2.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) {

        ach2 = row.getString(j);
      }
    }
    for (int i = 0; i< achievement3.getRowCount(); i++) {
      TableRow row = achievement3.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) {

        ach3 = row.getString(j);
      }
    }

if (gameManager.p500 && ach1.equals("0")) 
{
  myConnection.updateQuery("INSERT INTO Behaald (userid,achievementid) VALUES (\""+ useRid + "\",1);");
}
 if (gameManager.p1000 && ach2.equals("0")) 
{

  myConnection.updateQuery("INSERT INTO Behaald (userid,achievementid) VALUES (\""+ useRid + "\",2);");
}
 if (gameManager.r2 && ach3.equals("0")) 
{
  myConnection.updateQuery("INSERT INTO Behaald (userid,achievementid) VALUES (\""+ useRid + "\",3);");
}
}

  void timesplayed()
  {
    myConnection.updateQuery("UPDATE User SET timesplayed = timesplayed + 1");
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