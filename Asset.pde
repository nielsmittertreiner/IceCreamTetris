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

  int yellow = #FFFF00;

  int opacity = 150;

  SoundFile backgroundMusic;
  SoundFile pop;
  SoundFile animalMove;
  SoundFile thunder; 

  int groundColour;

  PImage ground;
  PImage cloud;
  PImage p500;
  PImage p1000;
  PImage r2;
  PImage textCloud;
  PImage textCloud1;
  PImage textCloud2;
  PImage water;
  PImage water2;

  void loadAssets() 
  {
    backgroundMusic = new SoundFile(IceCreamTetris.this, "music/backgroundmusic.mp3");
    pop = new SoundFile(IceCreamTetris.this, "soundeffects/pop.mp3");
    animalMove = new SoundFile(IceCreamTetris.this, "soundeffects/collect.mp3");
    thunder = new SoundFile(IceCreamTetris.this, "soundeffects/thunder.mp3"); 
    ground = loadImage("img/ground.jpg");
    cloud = loadImage("img/cloud.png");
    p500 =loadImage("img/500p.png");
    p1000= loadImage("img/1000p.png");
    r2 = loadImage("img/2r.png");
    textCloud = loadImage("img/textCloud.png");
    textCloud1 = loadImage("img/textCloud1.png");
    textCloud2 = loadImage("img/textCloud2.png");
    water = loadImage("img/water.jpg");   
    water2 = loadImage("img/water2.jpg");

  }

  void drawBackground() {

    noStroke();
    image(ground, 0, 0, width, height);
    if (gameManager.stormTimer == gameManager.stormTimerCoolDown - 1 || gameManager.storm) 
    {
      fill(black, opacity);
    } 
    else
    {
      fill(green, opacity);
    }
    rect(0, 0, width, height);
  }
}
