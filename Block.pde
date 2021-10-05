PShape [] shapes= new PShape[4];



class Shapes {


  Shapes() { 
    noStroke();
    shapes[0] = createShape();
    shapes[0].beginShape();
    shapes[0].noStroke();
    shapes[0].fill(126, 69, 8);
    shapes[0].vertex(0, 0);
    shapes[0].vertex(200, 0);
    shapes[0].vertex(200, 50);
    shapes[0].vertex(50, 50);
    shapes[0].vertex(50, 100);
    shapes[0].vertex(0, 100);
    shapes[0].endShape(CLOSE);

    shapes[1] = createShape();
    shapes[1].beginShape();
    shapes[1].noStroke();
    shapes[1].fill(126, 69, 8);
    shapes[1].vertex(0, 0);
    shapes[1].vertex(150, 0);
    shapes[1].vertex(150, 50);
    shapes[1].vertex(0, 50);
    shapes[1].endShape(CLOSE);

    shapes[2] = createShape();
    shapes[2].beginShape();
    shapes[2].noStroke();
    shapes[2].fill(126, 69, 8);
    shapes[2].vertex(0, 0);
    shapes[2].vertex(50, 0);
    shapes[2].vertex(50, 50);
    shapes[2].vertex(0, 50);
    shapes[2].endShape(CLOSE);

    shapes[3] = createShape();
    shapes[3].beginShape();
    shapes[3].noStroke();
    shapes[3].fill(126, 69, 8);
    shapes[3].vertex(0, 0);
    shapes[3].vertex(50, 0);
    shapes[3].vertex(50, 50);
    shapes[3].vertex(100, 50);
    shapes[3].vertex(100, 100);
    shapes[3].vertex(-50, 100);
    shapes[3].vertex(-50, 50);
    shapes[3].vertex(0, 50);
    shapes[3].endShape(CLOSE);
  }
  void update() {
  }

  void draw() {

    shape(shapes[0], 0, 0);
    shape(shapes[1], 210, 210);
    shape(shapes[2], 400, 350);
    shape(shapes[3], 410,0);
  }
}
