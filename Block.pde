
class Shapes {

  int[][] tilePyramide = {
    {0, 0, 1}, 
    {0, 1, 1}, 
    {0, 0, 1}, };
  int[][] tileSnake = {
    {1, 1, 0}, 
    {0, 1, 0}, 
    {0, 1, 1}, };
  int[][] tileLShape = {
    {1, 1, 1}, 
    {0, 0, 1}, 
    {0, 0, 0} };
  int[][] tilePlus = {
    {0, 1, 0}, 
    {1, 1, 1}, 
    {0, 1, 0}, };
  int[][] tileSqaure ={
    {0, 0, 0}, 
    {0, 1, 0}, 
    {0, 0, 0} };
  int[][] tileRectangle={
    {0, 0, 0}, 
    {0, 1, 0}, 
    {0, 0, 0} };

  int tileSize;
  Shapes() {


    tileSize = 75;
  }
  void draw() {
   // noStroke();
   // fill(183, 121, 6);
    //for (int x=0; x<3; x++) {
      //for (int y=0; y<3; y++) {
       // if (tilePyramide[x][y] ==1) {
       //   rect(x*tileSize, y*tileSize, tileSize, tileSize);
        }
       // if (tilePlus[x][y] ==1) {
         // rect(x*tileSize+500, y*tileSize+500, tileSize, tileSize);
        } 
      //  if (tileLShape[x][y] ==1) {
        //  rect(x*tileSize+500, y*tileSize, tileSize, tileSize);
        }    
      //  if (tileSqaure[x][y] ==1) {
       //   rect(x*tileSize+600, y*tileSize, tileSize, tileSize);
        }   
      //  if (tileSnake[x][y] ==1) {
      //    rect(x*tileSize+600, y*tileSize+300, tileSize, tileSize);
        }
      }
    }
  }
}
