import toxi.color.*;
import toxi.util.datatypes.*;
import processing.pdf.*;

//for printing
int vertical = 11;
int horizontal = 17;
int makeBigger = 40;

float bright = 1;
float sat = 0;
float x = 0;
float y = 0;

void setup() {
  
  size(round(vertical*makeBigger), round(horizontal*makeBigger));
  beginRecord(PDF, "assignment3" + minute() + second() + ".pdf");
  
  background(255);
  smooth();
  noStroke();
  colorMode(HSB, 1, 1, 1);
   
  for (int i = 0; i < height+10; i+=30) {
    TColor test = TColor.newHSV(random(0.1, 0.8), sat, bright);
    fill(test.hue(), test.saturation(), test.brightness());
    beginShape();
    vertex (0, i);
    for (int j = 1; j < 11; j++) {
      bezierVertex(j*(width/10), i-20, j*(width/10), i-20, j*(width/10), i);
    }
    vertex(width, i);
    vertex(width, i+30);
    vertex(0, i+30);
    endShape();
    
    //if (i >= height/5) {
      bright = bright - 0.02;
      sat = sat + 0.03;
    //}
  }
  
  endRecord();
}

