class Moves {
  float x = 0, y = 0;      
  float speed, i;          
  boolean moving = false;
  int animManager = 0;
  Animation[] animations;

  Moves() {
  }

  //The costructor recieves the object position and the number of spaces in the array of animations 
  Moves(int nAnimations ) {
    animations = new Animation[nAnimations];
  }

  void show( int animManager,float x, float y, float duration){
   animations[animManager].display2(x, y, duration);
  }

  //Fuction to move the player. Recieves the destination and speed
  void move(float x2, float y2, float speed) {
    float distanciaX;
    distanciaX = x2-x;
    float distanciaY;
    distanciaY = y2-y;
    x = x+(i*distanciaX);
    y = y+(i*distanciaY);
    if (i < 1) { 
      i = i + speed;
    } else {
      click = false;
      i=0;
    }
    //Changing animations
    if (x != x2) {
      animManager = 1;
    } else {
      animManager = 0;
    }
  }
}