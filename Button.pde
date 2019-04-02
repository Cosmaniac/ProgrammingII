class Button
{
  //Member Variables
  float x, y;
  String label;
  boolean hov;  

  //Constructor
  Button(String label, float x, float y) {    
    this.x = x;
    this.y = y;
    this.label = label;
  }

  void display()
  {
    hover();
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    if (hov)
    {
      fill(255, 50, 75);
    } else {
      fill(50, 55, 70);
    }
    noStroke();
    rect(x, y, 100, 40, 5, 0, 5, 5);
    fill(255);
    textSize(14);
    text(label, x, y);

  }


  void hover()
  {
    hov = mouseX > (x - 50) && mouseY > (y - 20) && mouseX < (x + 50) && mouseY < (y + 20);
  }
}
