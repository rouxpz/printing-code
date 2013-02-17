import toxi.color.*;
import toxi.util.datatypes.*;
import processing.pdf.*;

//for printing
int vertical = 10;
int horizontal = 16;
int makeBigger = 40;

//float bright = 0.9;
//float sat = 0.25;

void setup() {

  size(round(vertical*makeBigger), round(horizontal*makeBigger));
  //beginRecord(PDF, "assignment3" + minute() + second() + ".pdf");

  background(255);
  smooth();
  noStroke();
  //colorMode(HSB, 1, 1, 1);

  shape1();
  ellipses();
  shape2();


  //shape 2

  //endRecord();
}

void shape1() {
  stroke(0);
  fill(0);
  beginShape();
  vertex(50, 0);
  bezierVertex(50, 100, 50, 200, 150, 75);
  bezierVertex(150, 200, 150, 300, 250, 300);
  bezierVertex(width, height/2, width/2, height, 100, 300);
  bezierVertex(0, height, 2*(width/3), height, 2*(width/3), height);
  vertex(0, height);
  vertex(0, 0);
  endShape();
}

void ellipses() {
  ellipse(100, 0, 50, 50);
  fill(0, 100);
  ellipse(width+15, 50, 500, 500);
  ellipse(175, -10, 150, 150);
  fill(0);
  ellipse(width, 0, 400, 400);
  ellipse(width, height/2, 100, 100);
}

void shape2() {  
  noFill();
  beginShape();
  vertex(width, 2*(height/3));
  bezierVertex(width, height/2, width/2, height, 100, 400);
  bezierVertex(100, height, 2*(width/3), height, width-50, height);
  vertex(width, height);
  endShape();
}
