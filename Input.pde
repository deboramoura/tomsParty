//this class will recieve all kind of users input, and handle it.
//the intention is make the it easier to use in the principal classes.

class Input {
  private float x; //position x of the element
  private float y; //position y of the element
  private float w; //width the element
  private float h; //height of the element

  private float mouseDistance; // for the clickRadial method

  private float newX = -1; // for the drag method
  private float newY; // for the drag method
  private boolean draggedArea = false; //for the drag method


  //this function returns true if the mouse was clicked in a determinated local of the screen
  // and false if not.
  boolean click(PImage image, float x, float y) {
    if (mousePressed && draggedArea == false && mouseX>x-(image.width/2) && mouseX<x+(image.width/2) && mouseY>y-(image.height/2) && mouseY<y+(image.height/2)) {
      return true;
    } else {
      return false;
    }
  }

  //this function returns true if the mouse was clicked inside of a circle in the screen
  // and false if not.
  boolean clickRadial(float x, float y, float r) {
      if (mousePressed) {

      return true;
    } else {
      return false;
    }
  }


  //this function returns true if the mouse was inside a determinated local of the screen
  // and false if not.
  boolean inside(float x, float y, float w, float h) {
    if (mouseX>x-(w/2) && mouseX<x+(w/2) && mouseY>y-(w/2) && mouseY<y+(h/2)) {
      return true;
    } else {
      return false;
    }
  }

  //this function returns the new X and y of the dragged image
  boolean drag(PImage image, float x, float y ) {
    if (click(image, x, y) && draggedArea == false) {
      draggedArea = true;
    } 
    if (mousePressed && draggedArea) {
      newX = mouseX;
      newY = mouseY;
      image(image, newX, newY);
      return true;
    } else {  
      draggedArea = false;
      return false;
    }
  }

  float getNewX() {
    return newX;
  }
  float getNewY() {
    return newY;
  }
}