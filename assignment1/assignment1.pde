import processing.pdf.*;

//printing variables
float print_width = 8.5; //width in inches
float print_height = 11; //height in inches
float make_bigger = 40; //magnifies sketch window

//drawing variables
float a = 0;
float y;

void setup() {
  size(round(print_width * make_bigger), round(print_height * make_bigger));

  beginRecord(PDF, "assignment1.pdf"); 
  background(255);
  smooth();
  
  //draws the actual cone
  for (int i = 45; i < width-100; i+=50) {
    a = a+(i/2);
    strokeWeight(4);
    
    //ice cream section
    noStroke();
    fill(0, a);
    ellipse(i+50, (height/2)-87, 125, 125);
    
    //cone section
    stroke(0, a);
    fill(255);
    triangle(i, height/2-50, i+100, height/2-50, i+50, height-50);
  }

  endRecord();
}

