class WinEffect
{
    //creating variables WinEffect
    PVector pos;
    PVector velocity;
    PVector acceleration;
    PVector winEffectSize;
    // giving the variables values in the constructor
WinEffect(PVector vector)
{
    float vx = random(-2,2);
    float vy = random(-3,-2);
    pos = vector.copy();
    velocity = new PVector (vx,vy);
    acceleration = new PVector(0,0);
    winEffectSize = new PVector(random(5,10),random(5,10));
}
//adding the variables to each other
void updateWinEffect()
{
    velocity.add(acceleration);
    pos.add(velocity);
    acceleration.mult(0);
}
// rendering the WinEffect
void renderWinEffect(int animal)
{
    pushMatrix();
    fill(random(0,255),random(0,255),random(0,255));
    translate(pos.x,pos.y);
    rect(pos.x,pos.y,winEffectSize.x,winEffectSize.y);
    popMatrix();
}
}