class Asset
{
  int darkRed = #731d0b;
  int red = #FF1212;

  int lightBlue = #39cedb;
  int blue = #216cb8;
  int darkBlue = #322f64;

  int green = #648c30; 
  int lightGreen = #32CE5D;

  int white = #f7fbf8; 
  int grey = #808b80;
  int black = #1d1f1e;

  int orange = #F5BC00;

  int opacity = 150;

  SoundFile backgroundMusic;
  SoundFile pop;
  SoundFile animalMove;

  int groundColour;

  PImage ground;
  PImage cloud;

  void loadAssets() 
  {
    backgroundMusic = new SoundFile(IceCreamTetris.this, "music/backgroundmusic.mp3");
    pop = new SoundFile(IceCreamTetris.this, "soundeffects/pop.mp3");
    animalMove = new SoundFile(IceCreamTetris.this, "soundeffects/collect.mp3");
    ground = loadImage("img/ground.jpg");
    cloud = loadImage("img/cloud.png");

  }

  void drawBackground() {

    image(ground, 0, 0, width, height);
    fill(green, opacity);
    rect(0, 0, width, height);
  }
}
