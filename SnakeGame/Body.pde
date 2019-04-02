class Body {
  int id;
  int x, y;
  String dir = "";
  Body[] t = board.bodies;
  Segment o = board.s0;
  float xPos = 5600/17 + 100;
  float yPos = 5600/17 + 100;

  public Body(int id) {
    this.id = id;
  }

  void display() {
    rectMode(CENTER);
    fill(18);
    rect(xPos, yPos, 40, 40);
  }
  void mover(int i) {
    xPos = 100 + ((1 + x) * (800/17));
    yPos = 100 + ((1 + y) * (800/17));
    try {
      try {
        if (board.dir.get(x).get(y).get(0) == "r") {
          x += 1;
          y = y;
          dir = "right";
          board.tuple.get(x).set(y, t[i]);
          board.tuple.get(x - 1).set(y, 0);

          if (id == board.bodycount - 1) {
            //board.dir.get(x - 1).get(y).set(0, "");
          }
        } else if (board.dir.get(x).get(y).get(0) == "l") {
          x -= 1;
          y = y;
          dir = "left";

          board.tuple.get(x).set(y, t[i]);
          board.tuple.get(x + 1).set(y, 0);

          if (id == board.bodycount - 1) {
            // board.dir.get(x + 1).get(y).set(0, "");
          }
        } else if (board.dir.get(x).get(y).get(0) == "d") {
          x = x;
          y += 1;
          dir = "down";

          board.tuple.get(x).set(y, t[i]);
          board.tuple.get(x).set(y - 1, 0);

          if (id == board.bodycount - 1) {
            //board.dir.get(x).get(y - 1).set(0, "");
          }
        } else if (board.dir.get(x).get(y).get(0) == "u") {
          x = x;
          y -= 1;
          dir = "up";

          board.tuple.get(x).set(y, t[i]);
          board.tuple.get(x).set(y + 1, 0);
          if (id == board.bodycount - 1) {
            //board.dir.get(x).get(y + 1).set(0, "");
          }
        }
      } 
      catch (IndexOutOfBoundsException d) {
      }
    } 
    catch (ArrayIndexOutOfBoundsException e) {
    }
  }
}
