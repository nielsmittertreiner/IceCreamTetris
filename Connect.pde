class Connect
{
SQLConnection myConnection;
Table table;
  void connect()
  {
    Properties props = new Properties();
    props.setProperty("user", "nieropb1");
    props.setProperty("password", "80dF3T8.VrykZG");
    myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/znieropb1", props);

  }

void gettable()
{
    table = myConnection.getTable("user");
    table = myConnection.runQuery("SELECT * FROM user");
    // printTable(testTable);

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