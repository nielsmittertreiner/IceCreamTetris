class RiverAnimation
{
  float speed = 1.1;
  float speedDifference = 3;
  float offset = 0;
  float offset2 = 0;

  void draw(int top, int bottom, color watercolor)
  {
    if(gameManager.storm)
    {
      offset += speed * gameManager.stormSpeed * 2;
    }
    else
    {
      offset += speed;
    }

    if (offset >= width)
    {
      offset = 0;
    }

    offset2 += speed * speedDifference;
    if (offset2 >= width)
    {
      offset2 = 0;
    }

    tint(watercolor, 255);

    image(asset.water, offset, top, width, bottom);
    image(asset.water, offset - width, top, width, bottom);

    tint(watercolor, asset.opacity);

    image(asset.water2, offset2, top, width, bottom);
    image(asset.water2, offset2 - width, top, width, bottom);

    tint(255, 255);
  }
}
