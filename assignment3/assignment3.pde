import toxi.color.*;
import toxi.util.datatypes.*;
import processing.pdf.*;

//for printing
int vertical = 10;
int horizontal = 16;
int makeBigger = 40;

void setup() {

  size(round(vertical*makeBigger), round(horizontal*makeBigger));
  //beginRecord(PDF, "assignment3" + minute() + second() + ".pdf");

  colorMode(HSB, 1, 1, 1);

  TColor bkgrnd = TColor.newHSV(0.5, 0.1, 0.8);

  background(bkgrnd.hue(), bkgrnd.saturation(), bkgrnd.brightness());
  smooth();
  noStroke();

  shape1();
  ellipses();
  shape2();

  //endRecord();
}

void shape1() {

  //color for the shape
  TColor shape1color = TColor.newHSV(random(0.4, 0.6), 1, 0.7);
  noStroke();
  fill(shape1color.hue(), shape1color.saturation(), shape1color.brightness());

  //draw the shape
  beginShape();
  vertex(50, 0);
  bezierVertex(50, 100, 50, 200, 160, 75);
  bezierVertex(150, 200, 150, 300, 300, 300);
  bezierVertex(width, height/2, width/2, height, 100, 300);
  bezierVertex(0, height, 2*(width/3), height, 2*(width/3), height);
  vertex(0, height);
  vertex(0, 0);
  endShape();
}

void ellipses() {
  FloatRange h = new FloatRange(0, 0.3);
  FloatRange s = new FloatRange(0, 0.1);
  FloatRange b = new FloatRange(0.2, 0.5);
  
  ColorRange range = new ColorRange(h, s, b, "newRange");

  TColor ellipse1 = range.getColor();
  TColor ellipse2 = range.getColor();
  TColor ellipse3 = range.getColor();
  TColor ellipse4 = range.getColor();
  TColor ellipse5 = range.getColor();

  fill(ellipse1.hue(), ellipse1.saturation(), ellipse1.brightness());
  ellipse(100, 0, 50, 50);
  
  fill(ellipse2.hue(), ellipse2.saturation(), ellipse2.brightness());
  ellipse(width+15, 50, 500, 500);
  
  fill(ellipse3.hue(), ellipse3.saturation(), ellipse3.brightness());
  ellipse(175, -10, 150, 150);
  
  fill(ellipse4.hue(), ellipse4.saturation(), ellipse4.brightness());
  ellipse(width, 0, 400, 400);
  
  fill(ellipse5.hue(), ellipse5.saturation(), ellipse5.brightness());
  ellipse(width, height/2, 100, 100);
}

void shape2() {  
  TColor shape2color = TColor.newHSV(random(0.1, 0.3), 0.5, 0.4);
  noStroke();
  fill(shape2color.hue(), shape2color.saturation(), shape2color.brightness());
  beginShape();
  vertex(width, 2*(height/3));
  bezierVertex(width, height/2, width/2, height, 100, 350);
  bezierVertex(100, height, 2*(width/3), height, width-50, height);
  vertex(width, height);
  endShape();
}

