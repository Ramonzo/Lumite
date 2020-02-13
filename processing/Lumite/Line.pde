class Line {
  ////PVector p1;
  ////float x, y;
  //PVector pos;
  
  Line(PVector pos) {
    //this.pos = pos;
    ////p1 = new PVector(this.pos.x, this.pos.y);
    ////x = p1.x;
    ////y = p1.y;
  }
  void drawline(PVector pos1, PVector pos2, color cor) {
    stroke(255);
    strokeWeight(2);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
    strokeWeight(0);
    
    //x -= (p1.x - mouseX) / 10;
    //y -= (p1.y - mouseY) / 10;
    //fill(cor);
    //rect(x, y, 5, 5);
    
    //if(int(x) == int(pos2.x) || int(y) == int(pos2.y)){
    //  x = p1.x;
    //  y = p1.y;
    //}
  }
}
