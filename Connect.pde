import java.sql.*;


class Connect
{


  Properties props = new Properties();
  SQLConnection myConnection;
  Table table;
  Table table2;
  Table user;
  Table user2;

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


    table = myConnection.getTable("Score");
    table = myConnection.runQuery("SELECT userid , score FROM Score");    


  }
  
  
  
  
  
  
  
  void UpdateDtb(String useR,int scorE)
  {

        user = myConnection.getTable("user");
    user = myConnection.runQuery("SELECT name FROM user WHERE name='" + useR + "'");


   
  // String query = "SELECT COUNT(name) FROM user WHERE name='" + useR + "'";
  //  ResultSet rs = myConnection.execute(query);
  //  int rowCount = rs.last() ? rs.getRow() : 0;
    
    println("users" +user.getRowCount());
    if(user.getRowCount() == 0)
    {
    addUser(useR);
    println("user toegevoegd");
    }

      getuserid(useR);



      println("userid = "+ userid);
      
    
    scoretodtb(userid,scorE);        




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

  void scoretodtb(String useR,int scorE)
  {
    // table = myConnection.getTable("Score");

    myConnection.updateQuery("INSERT INTO Score (userid, score) VALUES (\""+ useR + "\","+ scorE +");");
  }


  void addUser(String user)
  {

    myConnection.updateQuery("INSERT INTO user (name) VALUES (\""+ user + "\");");
  }

  void printTable()
  {
    textSize(32);
    fill(255);
    for (int i = 0; i< table.getRowCount(); i++) {
      TableRow row = table.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) {

        text(row.getString(j), 100+ 100*j, 250+50*i);
      }
    }
  }
}
