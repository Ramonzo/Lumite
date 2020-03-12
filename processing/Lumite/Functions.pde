boolean mouseDrag = false;
ArrayList<Circle> circles;
ArrayList<Control> controls;
Circle lastClicked = null;
Conn conn;
ArrayList<Block> blocks;

void create() {
  conn = new Conn(1200, "127.0.0.1");

  PVector pos;
  circles = new ArrayList<Circle>();
  controls = new ArrayList<Control>();
  blocks = new ArrayList<Block>();


  //OSCs
  pos = new PVector(240, height-60);
  circles.add(new Circle(pos, color(#B93838), color(150, 150, 150), color(50, 50, 50), "osc1", 1));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B93838), "Osc1"));
  controls.add(new Control(circles.get(0), "l", 1, 1));
  controls.add(new Control(circles.get(0), "r", 1, 2));
  controls.add(new Control(circles.get(0), "f", 1000, 3));

  pos = new PVector(315, height-60);
  circles.add(new Circle(pos, color(#B77537), color(150, 150, 150), color(50, 50, 50), "osc2", 1));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B77537), "Osc2"));
  controls.add(new Control(circles.get(1), "l", 1, 1));
  controls.add(new Control(circles.get(1), "r", 1, 2));
  controls.add(new Control(circles.get(1), "f", 1000, 3));

  pos = new PVector(390, height-60);
  circles.add(new Circle(pos, color(#B79C37), color(150, 150, 150), color(50, 50, 50), "osc3", 1));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B79C37), "Osc3"));
  controls.add(new Control(circles.get(2), "l", 1, 1));
  controls.add(new Control(circles.get(2), "r", 1, 2));
  controls.add(new Control(circles.get(2), "f", 1000, 3));

  pos = new PVector(465, height-60);
  circles.add(new Circle(pos, color(#B7B737), color(150, 150, 150), color(50, 50, 50), "osc4", 1));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B7B737), "Osc4"));
  controls.add(new Control(circles.get(3), "l", 1, 1));
  controls.add(new Control(circles.get(3), "r", 1, 2));
  controls.add(new Control(circles.get(3), "f", 1000, 3));
  //!OSCs

  //DA-AD Converters
  pos = new PVector(40, height-60);
  circles.add(new Circle(pos, color(#81B737), color(150, 150, 150), color(50, 50, 50), "adc", 1));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#81B737), "ADC Ch1"));
  controls.add(new Control(circles.get(4), "l", 1, 1));
  controls.add(new Control(circles.get(4), "r", 1, 2));

  pos = new PVector(115, height-60);
  circles.add(new Circle(pos, color(#4CB737), color(150, 150, 150), color(50, 50, 50), "dac", 2));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#4CB737), "DAC Ch1"));
  controls.add(new Control(circles.get(5), "l", 1, 1));
  controls.add(new Control(circles.get(5), "r", 1, 2));
  //!DA-AD Converters

  //Recorders
  pos = new PVector(940, height-60);
  circles.add(new Circle(pos, color(#37B769), color(150, 150, 150), color(50, 50, 50), "recoder", 2));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#37B769), "Recoder"));
  controls.add(new Control(circles.get(6), "l", 1, 1));
  controls.add(new Control(circles.get(6), "r", 1, 2));
  //!Recorders

  //Samplers
  pos = new PVector(590, height-60);
  circles.add(new Circle(pos, color(#37B789), color(150, 150, 150), color(50, 50, 50), "sampler1", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#37B789), "Sample1"));
  controls.add(new Control(circles.get(7), "l", 1, 1));
  controls.add(new Control(circles.get(7), "r", 1, 2));

  pos = new PVector(665, height-60);
  circles.add(new Circle(pos, color(#37B7AB), color(150, 150, 150), color(50, 50, 50), "sampler2", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#37B7AB), "Sample2"));
  controls.add(new Control(circles.get(8), "l", 1, 1));
  controls.add(new Control(circles.get(8), "r", 1, 2));

  pos = new PVector(740, height-60);
  circles.add(new Circle(pos, color(#379CB7), color(150, 150, 150), color(50, 50, 50), "sampler3", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#379CB7), "Sample3"));
  controls.add(new Control(circles.get(9), "l", 1, 1));
  controls.add(new Control(circles.get(9), "r", 1, 2));

  pos = new PVector(815, height-60);
  circles.add(new Circle(pos, color(#3770B7), color(150, 150, 150), color(50, 50, 50), "sampler4", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#3770B7), "Sample4"));
  controls.add(new Control(circles.get(10), "l", 1, 1));
  controls.add(new Control(circles.get(10), "r", 1, 2));
  //!Samplers

  //Effects
  pos = new PVector(40, 60);
  circles.add(new Circle(pos, color(#3F37B7), color(150, 150, 150), color(50, 50, 50), "effect1", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#3F37B7), "Flanger"));
  controls.add(new Control(circles.get(11), "l", 1, 1));
  controls.add(new Control(circles.get(11), "r", 1, 2));
  controls.add(new Control(circles.get(11), "c", 1, 3));
  controls.add(new Control(circles.get(11), "d", 1, 4));
  controls.add(new Control(circles.get(11), "e", 1, 5));

  pos = new PVector(115, 60);
  circles.add(new Circle(pos, color(#5937B7), color(150, 150, 150), color(50, 50, 50), "effect2", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#5937B7), "Bitcrusher"));
  controls.add(new Control(circles.get(12), "l", 1, 1));
  controls.add(new Control(circles.get(12), "r", 1, 2));
  controls.add(new Control(circles.get(12), "c", 1, 3));

  pos = new PVector(190, 60);
  circles.add(new Circle(pos, color(#8337B7), color(150, 150, 150), color(50, 50, 50), "effect3", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#8337B7), "Resonance"));
  controls.add(new Control(circles.get(13), "l", 1, 1));
  controls.add(new Control(circles.get(13), "r", 1, 2));

  pos = new PVector(265, 60);
  circles.add(new Circle(pos, color(#A137B7), color(150, 150, 150), color(50, 50, 50), "effect4", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#A137B7), "DelayFb"));
  controls.add(new Control(circles.get(14), "l", 1, 1));
  controls.add(new Control(circles.get(14), "r", 1, 2));
  controls.add(new Control(circles.get(14), "c", 1, 3));

  pos = new PVector(340, 60);
  circles.add(new Circle(pos, color(#B737AA), color(150, 150, 150), color(50, 50, 50), "effect5", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B737AA), "NoiseRed"));
  controls.add(new Control(circles.get(15), "l", 1, 1));
  controls.add(new Control(circles.get(15), "r", 1, 2));

  pos = new PVector(415, 60);
  circles.add(new Circle(pos, color(#B73784), color(150, 150, 150), color(50, 50, 50), "effect6", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B73784), "Pitch"));
  controls.add(new Control(circles.get(16), "l", 1, 1));
  controls.add(new Control(circles.get(16), "r", 1, 2));
  controls.add(new Control(circles.get(16), "c", 1, 3));
  controls.add(new Control(circles.get(16), "d", 1, 4));

  pos = new PVector(490, 60);
  circles.add(new Circle(pos, color(#B73766), color(150, 150, 150), color(50, 50, 50), "effect7", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B73766), "Shaper"));
  controls.add(new Control(circles.get(17), "l", 1, 1));
  controls.add(new Control(circles.get(17), "r", 1, 2));
  controls.add(new Control(circles.get(17), "c", 1, 3));
  controls.add(new Control(circles.get(17), "d", 1, 4));

  pos = new PVector(565, 60);
  circles.add(new Circle(pos, color(#B7373A), color(150, 150, 150), color(50, 50, 50), "effect8", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B7373A), "Wave"));
  controls.add(new Control(circles.get(18), "l", 1, 1));
  controls.add(new Control(circles.get(18), "r", 1, 2));

  pos = new PVector(640, 60);
  circles.add(new Circle(pos, color(#B7373A), color(150, 150, 150), color(50, 50, 50), "effect9", 0));
  blocks.add(new Block(new PVector(pos.x, pos.y), color(#B7373A), "Vibrato"));
  controls.add(new Control(circles.get(19), "l", 1, 1));
  controls.add(new Control(circles.get(19), "r", 1, 2));
  controls.add(new Control(circles.get(19), "c", 1, 3));
  controls.add(new Control(circles.get(19), "d", 1, 4));
  //!Effects
}

void drawning() {
  for (Circle c : circles) {
    c.draw();
  }
  for (Block b : blocks) {
    b.draw();
  }
  for (Control ct : controls) {
    ct.draw();
  }
}

void sendcontrols() {
  float value;
  int max;
  if (circles.get(11).clicked) {
    max = 1;
    value = (max*circles.get(11).pos.x)/width;
    conn.command("a", circles.get(11).name, value);
    value = (max*circles.get(11).pos.y)/height;
    conn.command("b", circles.get(11).name, value);
    
  } else if (circles.get(12).clicked) {
    max = 1;
    value = (max*circles.get(12).pos.x)/width;
    conn.command("a", circles.get(12).name, value);
    value = (max*circles.get(12).pos.y)/height;
    conn.command("b", circles.get(12).name, value);
    
  } else if (circles.get(13).clicked) {
    max = 1;
    value = (max*circles.get(13).pos.x)/width;
    conn.command("a", circles.get(13).name, value);
    value = (max*circles.get(13).pos.y)/height;
    conn.command("b", circles.get(13).name, value);
    
  }else if (circles.get(14).clicked) {
    max = 1;
    value = (max*circles.get(14).pos.x)/width;
    conn.command("a", circles.get(14).name, value);
    value = (max*circles.get(14).pos.y)/height;
    conn.command("b", circles.get(14).name, value);
    
  } else if (circles.get(15).clicked) {
    max = 1;
    value = (max*circles.get(15).pos.x)/width;
    conn.command("a", circles.get(15).name, value);
    value = (max*circles.get(15).pos.y)/height;
    conn.command("b", circles.get(15).name, value);
    
  } else if (circles.get(16).clicked) {
    max = 1;
    value = (max*circles.get(16).pos.x)/width;
    conn.command("a", circles.get(16).name, value);
    value = (max*circles.get(16).pos.y)/height;
    conn.command("b", circles.get(16).name, value);
    
  } else if (circles.get(17).clicked) {
    max = 1;
    value = (max*circles.get(17).pos.x)/width;
    conn.command("a", circles.get(17).name, value);
    value = (max*circles.get(17).pos.y)/height;
    conn.command("b", circles.get(17).name, value);
    
  } else if (circles.get(18).clicked) {
    max = 1;
    value = (max*circles.get(18).pos.x)/width;
    conn.command("a", circles.get(18).name, value);
    value = (max*circles.get(18).pos.y)/height;
    conn.command("b", circles.get(18).name, value);
    
  } else if (circles.get(19).clicked) {
    max = 1;
    value = (max*circles.get(19).pos.x)/width;
    conn.command("a", circles.get(19).name, value);
    value = (max*circles.get(19).pos.y)/height;
    conn.command("b", circles.get(19).name, value);
    
  }
}

boolean LineCollision(PVector thePoint, PVector theLineEndPoint1, PVector theLineEndPoint2, int theTolerance) {

  PVector dir = new PVector(theLineEndPoint2.x, theLineEndPoint2.y, theLineEndPoint2.z);

  dir.sub(theLineEndPoint1);
  PVector diff = new PVector(thePoint.x, thePoint.y, 0);
  diff.sub(theLineEndPoint1);

  // inside distance determines the weighting 
  // between linePoint1 and linePoint2 
  float insideDistance = diff.dot(dir) / dir.dot(dir);

  if (insideDistance>0 && insideDistance<1) {
    // thePoint is inside/close to 
    // the line if insideDistance>0 or <1
    PVector closest = new PVector(theLineEndPoint1.x, theLineEndPoint1.y, theLineEndPoint1.z);

    dir.mult(insideDistance);
    closest.add(dir);
    PVector d = new PVector(thePoint.x, thePoint.y, 0);
    d.sub(closest);
    // println((insideDistance>0.5) ? "b":"a");
    float distsqr = d.dot(d);

    // check the distance of thePoint to the line against our tolerance. 
    return (distsqr < pow(theTolerance, 2));
  }
  return false;
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
