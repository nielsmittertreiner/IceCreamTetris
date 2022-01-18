class ParticleSystem
{
    // array lists for the particlessystems rain and wineffect
ArrayList<Rain> droplets;
ArrayList<WinEffect> confetti;


// creating variables for the systems
PVector dropletSize;
int rainCount;
int winEffectCount;

// making the constructor
ParticleSystem(int rainCount,int winEffectCount)
{
    
    droplets = new ArrayList<Rain>();
    this.rainCount = rainCount;
    for (int i = 0; i < this.rainCount; ++i) {
        droplets.add(new Rain(new PVector(random(0,width),0)));
    }
    
    confetti = new ArrayList<WinEffect>();
    this.rainCount = rainCount;
    for (int i = 0; i < winEffectCount; ++i) {
         confetti.add(new WinEffect(new PVector(1000,500)));
    
    }
        

}
//updating the rain
void updateRain()
{
    for (int i = 0; i < droplets.size()-1; ++i) {
        Rain rain = droplets.get(i);
        rain.updateRain();
        if(rain.pos.y >= height)
        {
            droplets.remove(i);
            droplets.add(new Rain(new PVector(random(0,width),0)));
        }
    }

}
// rendering the rain
void renderRain()
{
    for (int i = 0; i < droplets.size()-1; ++i) {
        Rain rain = droplets.get(i);
        rain.renderRain();
    }

}
//updating the wineffect
void updateWinEffect(int animal)
{
for (int i = 0; i < confetti.size()-1; ++i) 
    {
        WinEffect winEffect = confetti.get(i);
        winEffect.updateWinEffect();
        for (int j = 0; j < 5; ++j) 
    { 
      if (grid.isRowFull(j+15)) 
      {
        if(winEffect.pos.y <= 300)
        {
            confetti.remove(i);
            confetti.add(new WinEffect(new PVector(615+j*40,400)));
        }
    }
}
    }
    }
// rendering the winEffect
void renderWinEffect(int animal)
{
for (int i = 0; i < confetti.size()-1; ++i) {
        WinEffect winEffect = confetti.get(i);
        winEffect.renderWinEffect(animal);
    }


}

}