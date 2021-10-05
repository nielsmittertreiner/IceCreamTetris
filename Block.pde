PShape [] shapes= new PShape[4];



class Shapes {


  Shapes() { 
    noStroke();
    shapes[0] = createShape();
    shapes[0].beginShape();
    shapes[0].noStroke();
    shapes[0].fill(126, 69, 8);
    shapes[0].vertex(0, 0);
    shapes[0].vertex(225, 0);
    shapes[0].vertex(225, 75);
    shapes[0].vertex(75, 75);
    shapes[0].vertex(75, 150);
    shapes[0].vertex(0, 150);
    shapes[0].endShape(CLOSE);

    shapes[1] = createShape();
    shapes[1].beginShape();
    shapes[1].noStroke();
    shapes[1].fill(126, 69, 8);
    shapes[1].vertex(0, 0);
    shapes[1].vertex(150, 0);
    shapes[1].vertex(150, 75);
    shapes[1].vertex(0, 75);
    shapes[1].endShape(CLOSE);

    shapes[2] = createShape();
    shapes[2].beginShape();
    shapes[2].noStroke();
    shapes[2].fill(126, 69, 8);
    shapes[2].vertex(0, 0);
    shapes[2].vertex(75, 0);
    shapes[2].vertex(75, 75);
    shapes[2].vertex(0, 75);
    shapes[2].endShape(CLOSE);

    shapes[3] = createShape();
    shapes[3].beginShape();
    shapes[3].noStroke();
    shapes[3].fill(126, 69, 8);
    shapes[3].vertex(0, 0);
    shapes[3].vertex(75, 0);
    shapes[3].vertex(75, 75);
    shapes[3].vertex(150, 75);
    shapes[3].vertex(150, 150);
    shapes[3].vertex(-75, 150);
    shapes[3].vertex(-75, 75);
    shapes[3].vertex(0, 75);
    shapes[3].endShape(CLOSE);
  }
  void update() {
  }

  void draw() {

    
  }
}
