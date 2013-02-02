import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 8.5;
float print_height = 11;

// This will help make the sketch window bigger
float make_bigger = 40;

float a = 0;
float y;

void setup() {
  size(round(print_width * make_bigger), round(print_height * make_bigger));

  //beginRecord(PDF, "grab.pdf"); 
  background(255);
  smooth();
  
  for (int i = 50; i < width-100; i+=50) {
    a = a+(i/2);
    strokeWeight(4);
    noStroke();
    fill(0, a);
    ellipse(i+50, (height/2)-87, 125, 125);
    
    stroke(0, a);
    fill(255);
    triangle(i, height/2-50, i+100, height/2-50, i+50, height-50);
  }

  //endRecord();
}

