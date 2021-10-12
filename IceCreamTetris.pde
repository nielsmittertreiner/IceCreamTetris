// initialize game

GameManager gameManager;
Grid grid;
UI ui;
Animal animal;

void setup()
{
    size(1067, 600, P2D);
    gameManager = new GameManager();
    ui = new UI();
    grid = new Grid(25, 15, 50);
    grid.setState(1, 1, 1);
    grid.setState(5, 5, 1);
    grid.setState(10, 10, 1);
    animal = new Animal();
}

// update all game objects
void update()
{
    ui.keyPressed();
    animal.update();
}

// render all objects to screen
void render()
{
    background(128);
    animal.draw();
    grid.draw();
}

// update and render game loop
void draw()
{
    update();
    render();
}
