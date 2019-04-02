PShape s;
int count = 0;
int xT;
int yT;
int i;
int c = 0;

class Fruit {
  float xPos, yPos;
  Fruit() {
  }

  void displayFruit(int x, int y) {
    s = createShape();
    s.beginShape();
    ellipseMode(CENTER);
    fill(224, 13, 2);
    ellipse(x - 4, y, 20, 25);
    ellipse(x + 4, y, 20, 25);
    fill(45, 133, 30);
    bezier(x, y - 10, x - 2, y - 5, x - 1, y - 25, x + 9, y - 20);
    bezier(x + 9, y - 20, x + 11, y - 30, x + 7, y - 8, x, y - 10);
    s.endShape(CLOSE);
    shape(s, x, y);
  }

  void detectCollision(int x, int y) {
    if (board.board.get(x).get(y) == board.s0) {
      board.createBody(board.bodycount);
      board.bodycount++;
    }
  }


  void createFruit() {
    if (c <= 0) {
      xT = (int)random(0, 16);
      yT = (int)random(0, 16);
      c++;
    }
    while (board.board.get(xT).get(yT) != (Object)0) {
      detectCollision(xT, yT);  
      generator();
    }
    board.list.get(xT).set(yT, board.f);
    board.f.displayFruit(100 + ((xT + 1) * (800/17)), 100 + ((yT + 1) * (800/17)));
  }

  void generator() {
    xT = (int)random(0, 16);
    yT = (int)random(0, 16);
  }
}
