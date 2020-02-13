import oscP5.*;
import netP5.*;

void setup(){
  fullScreen();
  rectMode(CENTER);
  
  //launch("/pd/main.pd");
  
  create();
}

void draw(){
  background(0);
  
  drawning();
  sendcontrols();
}
void mousePressed(){
}
