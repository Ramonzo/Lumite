class Control {
  Circle circle;
  int size = 100;
  String action;
  int start, end;
  color c;
  int a1, a2;
  float value = 0;
  boolean clicked = false;
  PVector pos;

  //For arc
  float ax, ay;
  float angle = 0;
  float targetAngle = 0;

  Control(Circle circle, String action, int end, int i) {
    this.circle = circle;
    this.c = circle.static_color;
    this.action = action;
    this.end = end;

    size = circle.size + ((10*i)*2);
    this.pos = circle.pos;

    ay = height;
    ax = width;
  }

  void draw() {
    stroke(255);
    strokeWeight(1);
    noFill();

    angle = atan2(ay - pos.y, ax - pos.x);

    float dir = (angle - targetAngle) / TWO_PI;
    dir -= round(dir);
    dir *= TWO_PI;
    targetAngle += dir;
    
    if (targetAngle > 6.19) targetAngle = 6.2;
    else if (targetAngle < 0.0) targetAngle = 0.0;
    else {
      int h = int(dist(pos.x, pos.y, ax, ay));
      int r = size/2;
      int c1 = int(ay - pos.y);
      int c2 = int(ax - pos.x);
      a1 = (r*c1)/h;
      a2 = (r*c2)/h;
    }

    arc(circle.pos.x, circle.pos.y, size, size, 0, targetAngle);
    noStroke();
    fill(c);
    ellipse(a2+circle.pos.x, a1+circle.pos.y, 10, 10);


    hover();
    click();
    drag();
  }

  boolean hover() {
    if (mouseX > ((a2+circle.pos.x)-5) && mouseX < ((a2+circle.pos.x)+5) && 
      mouseY > ((a1+circle.pos.y)-5) && mouseY < ((a1+circle.pos.y)+5)) {
      c = circle.hover_color;

      return true;
    }

    c = circle.static_color;
    return false;
  }

  void click() {
    if (hover() && mousePressed && !mouseDrag) {
      clicked = true;
      mouseDrag = true;

      c = circle.clicked_color;

      ax = mouseX;
      ay = mouseY;
      pos = circle.pos;
    }
  }
  private void drag() {
    if (clicked) {
      if (mousePressed) {
        c = circle.clicked_color;

        ax = mouseX;
        ay = mouseY;

        value = (end*degrees(targetAngle))/360;
        send(value);
      } else {
        clicked = false;
        mouseDrag = false;
      }
    }
  }
  void send(float v) {
    conn.command(action, circle.name, v);
  }
}
