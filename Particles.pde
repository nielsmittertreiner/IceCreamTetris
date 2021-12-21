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
    void render(int p) {
        
    for (int iParticle=0; iParticle <PARTICAL_COUNT; iParticle++) {

        if(PARTICAL_COUNT +PARTICLES_PER_FRAME > PARTICAL_COUNT)
        {
        winParticlesY[iParticle] += yVelocity;
        winParticlesX[iParticle] += xVelocity[iParticle];
            if( winParticlesY[iParticle] <=height-300)
            {
               for (int i = 0; i < ANIMALS_USED; ++i) 
    {
            winParticlesX[iParticle] = grid.getRowPosition(p)+random(-20,20) + 25;
            winParticlesY[iParticle] = random(height-200, height-100);
            winParticlesSize[iParticle] = random(5, 10);
            winParticlesR[iParticle] = random(0,255);
            winParticlesG[iParticle] = random(0,255);
            winParticlesB[iParticle] = random(0,255);
            xVelocity[iParticle] = random(-3,3);
            }
            }
        }
        
    fill( winParticlesR[iParticle], winParticlesG[iParticle], winParticlesB[iParticle]);
        rect(winParticlesX[iParticle], winParticlesY[iParticle], winParticlesSize[iParticle], winParticlesSize[iParticle]);
            }
        }
}