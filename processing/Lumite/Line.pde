class Line {
  float gFreq = 400; // frequency
  float gAmp = 15; // amplitude in pixels
  float theta = 0.0;
  float dx;
  float period = 1000.0;
  int spacing = 1;
  Line() {
    dx = (TWO_PI / period) * spacing;
  }
  void drawline(PVector pos1, PVector pos2) {
    float d = PVector.dist(pos1,pos2);
    float a = atan2(pos2.y - pos1.y, pos2.x - pos1.x);
    float[] values;
    values = new float[int(d)];
    fill(255);
    pushMatrix();
      translate(pos1.x,pos1.y);
      rotate(a);
      beginShape();
        fill(255);
        theta += -0.02;
        float x = theta;
        for (int i = 0; i < values.length; i++) {
          ellipse(i, (sin(x*TWO_PI*gFreq/d)*gAmp),1,1);
          x+= -dx;
        }
      endShape();
    popMatrix();
    
  }
}
