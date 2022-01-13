class Particles
{
    PImage textWolk;
    PImage textWolk1;
    PImage textWolk2;
    final int PARTICAL_COUNT = 25 , PARTICLES_PER_FRAME=2;
    final int DRUPPELS_COUNT = 300;
    float[] winParticlesX = new float[PARTICAL_COUNT];
    float[] winParticlesY = new float[PARTICAL_COUNT];
    float[] winParticlesSize = new float[PARTICAL_COUNT];
    float[] winParticlesR = new float[PARTICAL_COUNT];
    float[] winParticlesG = new float[PARTICAL_COUNT];
    float[] winParticlesB = new float[PARTICAL_COUNT];
    float[] xVelocity = new float[PARTICAL_COUNT];

    float[] druppelX = new float[DRUPPELS_COUNT];
    float[] druppelY = new float[DRUPPELS_COUNT];
    float[] druppelSize = new float[DRUPPELS_COUNT];
    float[] druppelSizes = new float[DRUPPELS_COUNT];
    float druppelVy = 20;
    float yVelocity = -5;

    boolean part = false;
    
    
    void setup() 
    {
        textWolk = loadImage("img/textWolk.png");
        textWolk1 = loadImage("img/textWolk1.png");
        textWolk2 = loadImage("img/textWolk2.png");
        for (int i = 0; i <DRUPPELS_COUNT ; ++i) {
            druppelX[i] = random(0,width);
           druppelY[i] = random(0,height);
            druppelSize[i] = random(10,25);
            druppelSizes[i] = random(2,5);
        }
    }

void stormrender()
{
    if (gameManager.stormTimer == gameManager.stormTimerCoolDown - 1 || gameManager.storm){
              image(asset.cloud, width/2, 10, 100,100);
              for (int i = 0; i < DRUPPELS_COUNT; ++i) {
                fill(asset.blue);
              ellipse(druppelX[i],druppelY[i],druppelSizes[i],druppelSize[i]);
              druppelY[i] += druppelVy;
               if (druppelY[i]>= 900) {
              druppelX[i] = random(0,width);
              druppelY[i] = random(0,height/2);
              druppelSize[i] = random(10,25);
            }
              }
            }
}

    void winrender(int p) 
    {
        
    for (int iParticle=0; iParticle <PARTICAL_COUNT; iParticle++) {
             winParticlesY[iParticle] += yVelocity ;
             winParticlesX[iParticle] += xVelocity[iParticle];
        if( winParticlesY[iParticle] <= animalsystem.getypos(p)-250)
            {
            winParticlesX[iParticle] = grid.getRowPosition(p)+random(-20,20) + 30;
            winParticlesY[iParticle] =  random(animalsystem.getypos(p)-200, animalsystem.getypos(p));
            winParticlesSize[iParticle] = random(5, 10);
            winParticlesR[iParticle] = random(0,255);
            winParticlesG[iParticle] = random(0,255);
            winParticlesB[iParticle] = random(0,255);
            xVelocity[iParticle] = random(-3,3);
            }
        
        
    fill( winParticlesR[iParticle], winParticlesG[iParticle], winParticlesB[iParticle]);
        rect(winParticlesX[iParticle], winParticlesY[iParticle], winParticlesSize[iParticle], winParticlesSize[iParticle]);
            }
        }
}