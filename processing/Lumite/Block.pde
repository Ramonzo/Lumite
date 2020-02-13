class Block{
  String text;
  PVector pos;
  color cor;
  
  Block(PVector pos, color cor, String text){
    this.pos = pos;
    this.text = text;
    this.cor = cor;
  }
  void draw(){
    stroke(color(255, 255, 255));
    strokeWeight(2);
    noFill();
    rect(pos.x, pos.y-10, 70, 90);
    strokeWeight(0);
    
    //Fazer referencia
    fill(cor, 130);
    noStroke();
    ellipse(pos.x, pos.y, 50, 50);
    //
    fill(color(255, 255, 255));
    text(text, pos.x-25, pos.y-35); 
  }
}
