class Circle {
  PVector pos;
  int size;
  color cor, static_color, hover_color, clicked_color;
  boolean clicked = false;
  String name;
  ArrayList<Circle> connected;
  Line line;
  int type;

  Circle(PVector pos, color cor, color hover_color, color clicked_color, String name, int type) {
    this.pos = pos;

    this.cor = cor;
    this.static_color = cor;
    this.hover_color = hover_color;
    this.clicked_color = clicked_color;

    this.name = name;
    this.type = type;

    size = 50;
    connected = new ArrayList<Circle>();
    line = new Line();
  }

  void draw() {
    fill(cor);
    ellipse(pos.x, pos.y, size, size);

    if (connected.size() > 0) {
      for (Circle c : connected) {
        line.drawline(this.pos, c.pos);
        if (linecollision(this.pos, c.pos) && mousePressed && keyPressed == true && keyCode == SHIFT) {
          conn.sendLine("remove", this.name, c.name);
          connected.remove(c);  
          conn.command("bang", c.name, 0);
          lastClicked = null;
          break;
        }
      }
    }

    hover();
    click();
    drag();
  }



  boolean linecollision(PVector pos1, PVector pos2) {
    if (LineCollision(new PVector(mouseX, mouseY), pos1, pos2, 4)) {
      return true;
    }
    return false;
  }

  boolean hover() {
    if (mouseX > (pos.x - (size/2)) && mouseX < (pos.x + (size/2)) &&
      mouseY > (pos.y - (size/2)) && mouseY < (pos.y + (size/2))) {
      cor = hover_color;
      return true;
    }
    cor = static_color;
    return false;
  }

  void click() {
    if (hover() && mousePressed && !mouseDrag) {
      cor = clicked_color;
      clicked = true;
      mouseDrag = true;
      conn.command("bang", this.name, 1);
      if (keyPressed == true && keyCode == CONTROL) {
        if (lastClicked == null && type != 2) {
          lastClicked = this;
        } else if (lastClicked != null) {
          if (!connected.contains(lastClicked) && lastClicked != this && !lastClicked.connected.contains(this) && this.type != 1) {
            connected.add(lastClicked);
            conn.sendLine("connect", this.name, lastClicked.name);
            conn.command("bang", lastClicked.name, 1);
            lastClicked = null;
          } else {
            lastClicked = null;
          }
        }
      } else {
        lastClicked = null;
      }
    } else if (!hover()) {
      cor = static_color;
    }
  }
  private void drag() {
    if (clicked) {
      if (mousePressed) {
        cor = clicked_color;
        pos.x += mouseX - pmouseX;
        pos.y += mouseY - pmouseY;
      } else {
        clicked = false;
        mouseDrag = false;
      }
    }
  }
}
