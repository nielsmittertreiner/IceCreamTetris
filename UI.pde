class UI
{
    int textDistance = 5, textSize = 50;
    
    void draw()
    {
        textSize(textSize);
        fill(asset.white);
        text("SCORE: " + gameManager.score, textDistance, textSize);
    }
}