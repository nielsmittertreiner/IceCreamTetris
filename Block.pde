
class Shapes {

  int[][] tilePyramide = {
    {0, 0, 1}, 
    {0, 1, 1}, 
    {0, 0, 1}, };
    int[][] tileStair = {
    {0, 0, 0}, 
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
    {0, 1, 0}, 
    {0, 1, 0}, 
    {0, 1, 0} };

  int tileSize;
  Shapes() {


    tileSize = 75;
  }
  void draw() {
 //   noStroke();
   // fill(183, 121, 6);
   // for (int x=0; x<3; x++) {
    //  for (int y=0; y<3; y++) {
        // tweede difulcultie
      //  if (tilePyramide[x][y] ==1) {
      //    rect(x*tileSize, y*tileSize, tileSize, tileSize);
        }// derde difulcultie
     //   if (tilePlus[x][y] ==1) {
      //    rect(x*tileSize+500, y*tileSize+500, tileSize, tileSize);
        } // tweede difulcultie
     //   if (tileLShape[x][y] ==1) {
      //    rect(x*tileSize+500, y*tileSize, tileSize, tileSize);
        }    // eerste difulcultie
     //   if (tileSqaure[x][y] ==1) {
     //     rect(x*tileSize+600, y*tileSize, tileSize, tileSize);
        }   // derde difulcultie
     //   if (tileSnake[x][y] ==1) {
     //     rect(x*tileSize+600, y*tileSize+300, tileSize, tileSize);
        } // eerste difulcultie
     //   if (tileStair[x][y] ==1) {
      //    rect(x*tileSize+300, y*tileSize+300, tileSize, tileSize);
        } // eerste difulcultie
     //   if (tileRectangle[x][y] ==1) {
      //    rect(x*tileSize+0, y*tileSize+300, tileSize, tileSize);
        }
      }
    }
  }
}
 
