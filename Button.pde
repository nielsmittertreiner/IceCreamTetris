class Button
{
    String text;
    int buttonWidth = 300, buttonHeight = 60;
    
    void draw(boolean selected, String text, int number, int total)
    {
        float x = width / 2, y = (height / total) * number;
        rectMode(CENTER);
        fill(asset.red);
        if (selected)
        {
            stroke(asset.white);
        }
        else
        {
            stroke(asset.grey);
        }
        rect(x, y, buttonWidth, buttonHeight);

        textSize(ui.textSize);
        textAlign(CENTER, CENTER);
        if (selected)
        {
            fill(asset.white);
        }
        else
        {
            fill(asset.grey);
        }
        text(text, x, y - ui.textSize/10);

        rectMode(CORNER);
        textAlign(LEFT, BASELINE);
    }
    
}