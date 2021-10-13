
class Shapes {

  int[][] tilePyramide = {
    {0, 0, 1}, 
    {0, 1, 1}, 
    {0, 0, 1}, };
  int[][] tileCShape = {
    {1, 1, 1}, 
    {1, 0, 1}, 
    {0, 0, 0}, };
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
  Shapes()
  {
    tileSize = 75;
  } 
/*
  void keyPressed() {  
    if (keyCode >= KEY_LIMIT) return; //safety: if keycode exceeds limit, exit function ('return').
    keysPressed[keyCode] = true; // set its boolean to true
     if (keyPressed) {
      if (key== 'a') {
        tileChozen[0][0] = tileCurrent[2][0];
        tileChozen[0][1] = tileCurrent[1][0];
        tileChozen[0][2] = tileCurrent[0][0];
        tileChozen[1][0] = tileCurrent[2][1];
        tileChozen[1][1] = tileCurrent[1][1];
        tileChozen[1][2] = tileCurrent[0][1];
        tileChozen[2][0] = tileCurrent[2][2];
        tileChozen[2][1] = tileCurrent[1][2];
        tileChozen[2][2] = tileCurrent[0][2];
        key = 'k';
      }
    }
    if (keyPressed) {
      if (key== 'a') {
        tilePyramide[0][0] = 0;
        tilePyramide[0][1] = 0;
        tilePyramide[0][2] = 0;
        tilePyramide[1][0] = 0;
        tilePyramide[1][1] = 1;
        tilePyramide[1][2] = 0;
        tilePyramide[2][0] = 1;
        tilePyramide[2][1] = 1;
        tilePyramide[2][2] = 1;
        key = 'k';
      }
    }
    if (keyPressed) {
      if (key== 'b') {
        tilePyramide[0][0] = 1;
        tilePyramide[0][1] = 0;
        tilePyramide[0][2] = 0;
        tilePyramide[1][0] = 1;
        tilePyramide[1][1] = 1;
        tilePyramide[1][2] = 0;
        tilePyramide[2][0] = 1;
        tilePyramide[2][1] = 0;
        tilePyramide[2][2] = 0;
        key = 'k';
      }
    }
    if (keyPressed) {
      if (key== 'x') {
        tilePyramide[0][0] = 0;
        tilePyramide[0][1] = 0;
        tilePyramide[0][2] = 1;
        tilePyramide[1][0] = 0;
        tilePyramide[1][1] = 1;
        tilePyramide[1][2] = 1;
        tilePyramide[2][0] = 0;
        tilePyramide[2][1] = 0;
        tilePyramide[2][2] = 1;
        key = 'k';
      }
    }
    if (keyPressed) {
      if (key== 'y') {
        tilePyramide[0][0] = 1;
        tilePyramide[0][1] = 1;
        tilePyramide[0][2] = 1;
        tilePyramide[1][0] = 0;
        tilePyramide[1][1] = 1;
        tilePyramide[1][2] = 0;
        tilePyramide[2][0] = 0;
        tilePyramide[2][1] = 0;
        tilePyramide[2][2] = 0;
        key = 'k';
      }
    }
  }

  void keyReleased() {
    if (keyCode >= KEY_LIMIT) return;
    keysPressed[keyCode] = false;*/
  void draw()
  {
      
  }
}
 
