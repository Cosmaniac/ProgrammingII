Board board = new Board();

void setup() {
  background(116, 147, 216);
  size(1000, 1000);
}

void draw() {
  background(85, 175, 210);
  board.display();
  board.initGame();
  noStroke();
}
