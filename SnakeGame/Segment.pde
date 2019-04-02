class Segment {
  int id;
  int x = 7;
  int y = 7;
  int mX = 7;
  int mY = 7;
  float xPos = 5600/17 + 100;
  float yPos = 5600/17 + 100;
  color c;
  float xSpeed = 0;
  float ySpeed = 0;
  String direction = "";



  Segment(int id) {
    this.id = id;
  }


  void displaySegment() {
    rectMode(CENTER);
    fill(18);
    rect(xPos, yPos, 50, 50);
    mX = board.xAr;
    mY = board.yAr;
    xPos = 100 + ((1 + mX) * (800/17));
    yPos = 100 + ((1 + mY) * (800/17));
  }
}
