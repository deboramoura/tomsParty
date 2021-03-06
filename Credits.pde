class Credits extends Input {
  private PImage bg1, bg2, hp1, hp2, hp3;
  Button btn_map, btn_right, btn_left, btn_credits, btn_exit;
  private int page, page1;
  boolean help=true, credits = false;

  Credits() {
    bg1 = loadImage("bg/credits1.png");
    bg2 = loadImage("bg/credits2.png");
    hp1 = loadImage("bg/hp1.png");
    hp2 = loadImage("bg/hp2.png");
    hp3 = loadImage("bg/hp3.png");

    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);
    btn_right = new Button("button/right-up.png", "button/right-down.png", width-(128/2)-16, height-(134/2)-16);
    btn_left = new Button("button/left-up.png", "button/left-down.png", 128/2+(16), height-(134/2)-16);
    btn_credits = new Button("button/volans-up.png", "button/volans-down.png", width-(128/2)-16, 134/2+(16));
    btn_exit = new Button("button/exit-up.png", "button/exit-down.png", width-(128/2)-16, 134/2+(16));
    page = 0;
  }

  void show() {
    if (help) {
      if (page == 0) {
        image(hp1, width/2, height/2);
        if (insideButton(btn_map) || insideButton(btn_right))
          isInside = true;
        else
          isInside = false;
      } else if (page ==1) {
        image(hp2, width/2, height/2);
        if (insideButton(btn_left) || insideButton(btn_right))
          isInside = true;
        else
          isInside = false;
      } else {
        image(hp3, width/2, height/2);
        if (insideButton(btn_left))
          isInside = true;
        else
          isInside = false;
      }
    }
    
    if(credits){
      if (page1 == 0) {
        image(bg1, width/2, height/2);
        if (insideButton(btn_exit) || insideButton(btn_right))
          isInside = true;
        else
          isInside = false;
      } else {
        image(bg2, width/2, height/2);
        if (insideButton(btn_exit) || insideButton(btn_left))
          isInside = true;
        else
          isInside = false;
      }
    }
  }

  void events() {
    if (help) {
      if (page ==0) {
        //PRESS TO COME BACK TO THE MAP
        if (btn_map.execute()) {
          delay(400);
          PAGE = 1;
        }

        //PRESS TO COME BACK TO THE FIRST PAGE OF THE CREDITS
        if (btn_right.execute()) {
          delay(400);
          page = 1;
        }

        if (btn_credits.execute()) { 
          delay(400);
          help = false;
          credits=true;
        }
      }

      if (page ==1) {
        //PRESS TO GO TO THE SECOND PAGE OF THE CREDITS
        if (btn_left.execute()) { 
          delay(400);
          page = 0;
        }

        if (btn_right.execute()) {
          delay(400);
          page = 2;
        }

        if (btn_credits.execute()) { 
          delay(400);
          help = false;
          credits=true;
        }
      }

      if (page ==2) {
        if (btn_left.execute()) { 
          delay(400);
          page = 1;
        }

        if (btn_credits.execute()) { 
          delay(400);
          help = false;
          credits=true;
        }
      }
    }

    if (credits) {
      if (page1 ==0) {
        //PRESS TO COME BACK TO THE FIRST PAGE OF THE CREDITS
        if (btn_right.execute()) {
          delay(400);
          page1 = 1;
        }

        if (btn_exit.execute()) { 
          delay(400);
          help = true;
          credits= false;
        }
      }

      if (page1 ==1) {
        if (btn_left.execute()) { 
          delay(400);
          page1 = 0;
        }

        if (btn_exit.execute()) { 
          delay(400);
          help = true;
          credits=false;
        }
      }
    }
  }
}