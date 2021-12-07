class RiverAnimation
{
  float speed = 1.05;
  float offset = 0;
  float offset2 = 0;

  PImage water;
  PImage water2;

  void setup()
  {
    water = loadImage("img/water.jpg");   
    water2 = loadImage("img/water2.jpg");
  }

  void draw(int top, int bottom, color watercolor)
  {
    if(gameManager.storm){
      offset += speed * gameManager.stormSpeed;
    }
    else{
      offset += speed;
    }
    if (offset >= width)
    {
      offset = 0;
    }

    offset2 += speed * 3;
    if (offset2 >= width)
    {
      offset2 = 0;
    }

    tint(watercolor, asset.opacity);
    image(water, offset, top, width, bottom);
    image(water, offset - width, top, width, bottom);

    tint(watercolor, asset.opacity);
    image(water2, offset2, top, width, bottom);
    image(water2, offset2 - width, top, width, bottom);

    tint(255, 255);
  }
}
