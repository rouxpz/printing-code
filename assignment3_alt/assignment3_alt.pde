import toxi.color.*;
import toxi.util.datatypes.*;
import processing.pdf.*;

//for printing
int vertical = 10;
int horizontal = 16;
int makeBigger = 40;

float bright = 0.4;
float sat = 0.05;

void setup() {

  size(round(vertical*makeBigger), round(horizontal*makeBigger));
  beginRecord(PDF, "assignment3" + minute() + second() + ".pdf");

  background(255);
  smooth();
  //noStroke();
  colorMode(HSB, 1, 1, 1);
  
  float a = random(0.2, 0.5);
  float b = random(0.5, 0.8);

  for (int y = 0; y < height; y+=10) {
    for (int x = 0; x < height; x+=10) {
      
      float newHue = random(a, b);
      TColor test = TColor.newHSV(newHue, sat, bright);
      
      noStroke();
      fill(test.hue(), test.saturation(), test.brightness());
      rect(x, y, 10, 10);
    }

    if (y > height/8) {
      sat = sat + 0.015;
      //bright = bright + 0.01;
    }
    
    if (y > 4*(height/5)) {
      //sat = 1;
      //bright = 0.5;
    }
  }

  endRecord();
}

