class Rain
{
  //creating variables Rain
    PVector pos;
    PVector velocity;
    PVector acceleration;
    PVector dropletSize;
// giving the variables values in the constructor
    Rain(PVector vector)
    {
        float vy = random(10,20);
        pos = vector.copy();
        velocity = new PVector(0,vy);
        acceleration = new PVector(0,0);
        dropletSize = new PVector(random(2,5),random(10,25));
    }
//adding the variables to each other
    void updateRain()
    {
    velocity.add(acceleration);
    pos.add(velocity);
    acceleration.mult(0);
    }
// rendering the WinEffect
    void renderRain()
    {
    pushMatrix();
    fill(asset.blue);
    translate(pos.x,pos.y);
    ellipse(pos.x,pos.y,dropletSize.x,dropletSize.y);
    popMatrix();

    }
}