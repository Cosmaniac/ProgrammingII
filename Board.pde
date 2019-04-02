class Board { //<>// //<>// //<>// //<>//
  Body[] bodies = new Body[255];
  int xAr = 7;
  int yAr = 7;
  int xF = (int)random(0, 16);
  int yF = (int)random(0, 16);
  int xSpeed = 0;
  int ySpeed = 0;
  int xCatch, yCatch;
  int mils;
  boolean valid = true;
  boolean up = false;
  boolean down = false;
  boolean right = false;
  boolean left = false;
  boolean still = false;
  String moved = "";
  int count = 0;
  int i = 0;
  boolean pause = false;
  int bodycount = 0;
  Segment s0 = new Segment(0);
  Fruit f = new Fruit();
  ArrayList<ArrayList<Object>> board = new ArrayList<ArrayList<Object>>(16);
  ArrayList<ArrayList<Object>> list = new ArrayList<ArrayList<Object>>(16);
  ArrayList<ArrayList<Object>> tuple = new ArrayList<ArrayList<Object>>(16);
  ArrayList<ArrayList<ArrayList<String>>> dir = new ArrayList<ArrayList<ArrayList<String>>>(16);



  public Board() {
    /*for (int i = 0; i < 255; i++) {
     bodies[i] = ;
     }*/
    for (int i = 0; i < 16; i++) {
      board.add(new ArrayList<Object>(16));
      list.add(new ArrayList<Object>(16));
      tuple.add(new ArrayList<Object>(16));
      dir.add(new ArrayList<ArrayList<String>>(16));
    }

    for (int i = 0; i < 16; i++) {
      for (int j = 0; j < 16; j++) {
        board.get(i).add(j, 0);
        list.get(i).add(new ArrayList<Object>(16));
        tuple.get(i).add(new ArrayList<Object>(16));
        dir.get(i).add(new ArrayList<String>(1));
        dir.get(i).get(j).add("");
      }
    }
    board.get(7).set(7, s0);
  }
  void initGame() {
    s0.displaySegment();
    for (Body b : bodies) {
      try {
        b.display();
      } 
      catch (NullPointerException e) {
      }
    }
    f.createFruit();
    moveHead();
    /*for (int i = 0; i < bodycount; i++) {
     bodies[i].move(i);
     bodies[i].display();
     }*/


    /*if (bodycount >= 1) {
     b.moveHead(s0, b);
     b.display();
     }*/
  }

  void createBody(int l) {
    bodies[l] = new Body(l);
    if (l == 0) {
      try {
        if (s0.direction == "right") {
          /*if (s0.x - 1 < 0) {
           bodies[l].x = 15;
           bodies[l].y = s0.y;
           bodies[l].direction = "right";
           tuple.get(bodies[l].x).set(bodies[l].y, bodies[i]);
           } else {*/
          bodies[l].x = s0.x;
          bodies[l].y = s0.y;
          //bodies[l].direction = "right";
          tuple.get(bodies[l].x).set(bodies[l].y, bodies[l]);
        } else if (s0.direction == "left") {
          /*if (s0.x + 1 > 15) {
           bodies[l].x = 0;
           bodies[l].y = s0.y;
           bodies[i].direction = "left";
           tuple.get(bodies[l].x).set(bodies[l].y, bodies[i]);
           } else {*/
          bodies[l].x = s0.x;
          bodies[l].y = s0.y;
          //bodies[i].direction = "left";
          tuple.get(bodies[l].x).set(bodies[l].y, bodies[l]);
        } else if (s0.direction == "down") {
          /*if (s0.y - 1 < 0) {
           bodies[l].x = s0.x;
           bodies[l].y = 15;
           bodies[l].direction = "down";
           tuple.get(bodies[l].x).set(bodies[l].y, bodies[i]);
           } else {*/
          bodies[l].x = s0.x;
          bodies[l].y = s0.y;
          //bodies[l].direction = "down";
          tuple.get(bodies[l].x).set(bodies[l].y, bodies[l]);
        } else if (s0.direction == "up") {
          /*if (s0.mY + 1 > 15) {
           bodies[l].x = s0.mX;
           bodies[l].y = 0;
           bodies[l].direction = "up";
           tuple.get(bodies[l].x).set(bodies[l].y, bodies[i]);
           tuple.get(0).set(bodies[l].y, bodies[i]);
           } else {*/
          bodies[l].x = s0.x;
          bodies[l].y = s0.y;
          //bodies[l].direction = "up";
          tuple.get(bodies[l].x).set(bodies[l].y, bodies[l]);
        }
      } 
      catch (ArrayIndexOutOfBoundsException e) {
        println("q");
        gameOver();
      }
    } else {
      try {
        if (bodies[l - 1].dir == "right") {
          bodies[l].x = bodies[l - 1].x - 1;
          bodies[l].y = bodies[l - 1].y;
        } else if (bodies[l - 1].dir == "left") {
          bodies[l].x = bodies[l - 1].x + 1;
          bodies[l].y = s0.y;
        } else if (bodies[l - 1].dir == "down") {
          bodies[l].x = s0.x;
          bodies[l].y = bodies[l - 1].y - 1;
        } else if (bodies[l - 1].dir == "up") {
          bodies[l].x = s0.x;
          bodies[l].y = bodies[l - 1].y + 1;
        }
        tuple.get(bodies[l].x).set(bodies[l].y, bodies[l]);
      } 
      catch (ArrayIndexOutOfBoundsException f) {
        gameOver();
      }
    }
  }

  void displayScore() {
    rectMode(CENTER);
    fill(18, 18, 18, 200);
    rect(30, 20, 50, 25, 5);
    fill(210, 180, 60);
    textAlign(CENTER, CENTER);
    text(bodycount, 30, 20);
  }

  void moveHead() {
    move(still);
    if (millis() - mils >= 200) {
      valid = true;
    }

    if (valid) {
      /*if (xAr + xSpeed > 15 || yAr + ySpeed > 15 || xAr + xSpeed < 0 || yAr + ySpeed < 0) {
       if (xAr + xSpeed > 15) {
       xAr = 0;
       s0.x = 0;
       board.get(xAr).set(yAr, s0);
       board.get(15).set(yAr, 0);
       } else if (xAr + xSpeed < 0) {
       xAr = 15;
       s0.x = 15;
       board.get(xAr).set(yAr, s0);
       board.get(0).set(yAr, 0);
       } else if (yAr + ySpeed > 15) {
       yAr = 0;
       s0.y = 0;
       board.get(xAr).set(yAr, s0);
       board.get(xAr).set(15, 0);
       } else if (yAr + ySpeed < 0) {
       yAr = 15;
       s0.y = 15;
       board.get(xAr).set(yAr, s0);
       board.get(xAr).set(0, 0);
       }
       } else {*/
      try {
        board.get(xAr + xSpeed).set(yAr + ySpeed, s0);
        board.get(xAr).set(yAr, 0);
        s0.x = xAr + xSpeed;
        s0.y = yAr + ySpeed;
        valid = false;
        mils = millis();
        xCatch = xSpeed;
        yCatch = ySpeed;
        if (xCatch == 1) {
          moved = "right";
          s0.direction = "right";
          dir.get(s0.x - 1).get(s0.y).set(0, "r");
        } else if (xCatch == -1) {
          moved = "left";
          s0.direction = "left";
          dir.get(s0.x + 1).get(s0.y).set(0, "l");
        } else if (yCatch == 1) {
          s0.direction = "down";
          moved = "down";
          dir.get(s0.x).get(s0.y - 1).set(0, "d");
        } else if (yCatch == -1) {
          s0.direction = "up";
          moved = "up";
          dir.get(s0.x).get(s0.y + 1).set(0, "u");
        }
        xAr += xSpeed;
        s0.xPos += xSpeed;
        yAr += ySpeed;
        s0.yPos += ySpeed;
      } 
      catch (IndexOutOfBoundsException e) {
        gameOver();
      }
      for (Body b : bodies) {
        try {
          b.mover(i);
          if (tuple.get(xAr).get(xAr) == b) {
            gameOver();
          }

          i++;
        }

        catch (NullPointerException e) {
        }
      }
    }
  }

  void move(Boolean b) {
    if (b == false) {
      if (key == CODED) {
        if (keyCode == UP) {
          if (down != true) {
            ySpeed = -1;
            xSpeed = 0;
            right = false;
            left = false;
            up = true;
            down = false;
          } else {
            xSpeed = xSpeed;
            ySpeed = ySpeed;
          }
        }
        if (keyCode == DOWN) {
          if (up != true) {
            ySpeed = 1;
            xSpeed = 0;
            right = false;
            left = false;
            up = false;
            down = true;
          } else {
            xSpeed = xSpeed;
            ySpeed = ySpeed;
          }
        }
        if (keyCode == RIGHT) {
          if (left != true) {
            ySpeed = 0;
            xSpeed = 1;
            right = true;
            left = false;
            up = false;
            down = false;
          } else {
            xSpeed = xSpeed;
            ySpeed = ySpeed;
          }
        }
        if (keyCode == LEFT) {
          if (right != true) {
            ySpeed = 0;
            xSpeed = -1;
            right = false;
            left = true;
            up = false;
            down = false;
          } else {
            xSpeed = xSpeed;
            ySpeed = ySpeed;
          }
        }
      }
    } else {
    }
  }


  void gameOver() {
    Button button1 = new Button("New Game", width / 2, height / 2 - 100);
    Button button2 = new Button("Quit", width / 2, height / 2 + 100);
    still = true;
    if (still == true)
    {
      button1.display();
      button2.display();
    }
    if (button1.hov == true && mousePressed) {
      reset();
    }
    if (button2.hov == true && mousePressed) {
      exit();
    }
  }

  void reset() {
    for (int i = 0; i < 255; i++) {
      bodies[i] = null;
    }
    xAr = 7;
    yAr = 7;
    xF = (int)random(0, 16);
    yF = (int)random(0, 16);
    xSpeed = 0;
    ySpeed = 0;
    xCatch = 0;
    yCatch = 0;
    mils = 0;
    valid = true;
    up = false;
    down = false;
    right = false;
    left = false;
    still = false;
    moved = "";
    count = 0;
    i = 0;
    pause = false;
    bodycount = 0;
    for (int i = 0; i < 16; i++) {
      board.add(new ArrayList<Object>(16));
      list.add(new ArrayList<Object>(16));
      tuple.add(new ArrayList<Object>(16));
    }

    for (int i = 0; i < 16; i++) {
      for (int j = 0; j < 16; j++) {
        board.get(i).add(j, 0);
        list.get(i).add(new ArrayList<Object>(16));
        tuple.get(i).add(new ArrayList<Object>(16));
      }
    }
    f.generator();
    board.get(7).set(7, s0);
    initGame();
  }



  void display() {
    displayScore();
    int spaceX = width;
    float change = 100;
    rectMode(CENTER);
    fill(210, 140, 60);
    rect(spaceX / 2, spaceX / 2, spaceX - 200, spaceX - 200);
    for (int i = 0; i < 16; i++)
    {
      change += ((spaceX - 200)/17);
      stroke(50, 50, 50);
      line(100, change, spaceX - 100, change);
    }
    change = 100;
    for (int i = 0; i < 16; i++) {
      change += ((spaceX - 200)/17);
      stroke(50, 50, 50);
      line(change, 100, change, spaceX - 100);
    }
  }
}
