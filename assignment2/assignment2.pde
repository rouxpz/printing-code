import processing.pdf.*;

//for printing
float printWidth = 15;
float printHeight = 19;
float makeBigger = 30;

void setup() {
  size(round(printWidth*makeBigger), round(printHeight*makeBigger));

  beginRecord(PDF, "assignment2.pdf");
  background(255);
  smooth();
  
  //iterate through 4 wave shapes so they layer on top of each other in slightly different positions
  for (int i = 0; i < 4; i++) {
    drawWet(-(i*10), height-height/(i+5));
  }
  
  drawSharp();

  endRecord();
}


//-- FOR DRAWING --//

void drawSharp() {

  stroke(0);
  strokeWeight(3);
  fill(0, 210);

  beginShape();

  for (int j = 0; j < width/25; j++) {
    float x;
    float y;

    if (j != 0) { //if it's not the first one
      x = random((j*25), (j*25)+25);

      //differentiate between odd and even
      if (j%2 != 0) {

        //if it's odd, draw a point further down
        y = random(height/2, height-height/5);
      } 
      else {

        //if it's even, draw a point further to the top
        y = random(height/10, height/4);
      }

      //set starting point to 0, 0
    } 
    else {
      x = 0;
      y = 0;
    }

    vertex(x, y);
  }

  vertex(width, 0);
  endShape();
}

void drawWet(float x, float y) {

  noStroke();
  fill(0, 70);

  beginShape();
  for (int i = 0; i < 10; i++) {
    if (i == 0) {
      vertex(x, y); //set initial vertex point
    }
    
    if (i%2 != 0) { //set bezier vertices to create wave shapes
      bezierVertex((i+1)*(width/6), y+50, ((i+2)*(width/6)), y, ((i+2)*(width/6))+x, y-25);
    } else {
      bezierVertex((i+1)*(width/6), y-50, ((i+2)*(width/6)), y, ((i+2)*(width/6))+x, y+25);
    }
  }
  
  //set last two vertex points to be the edge of the frame
  vertex(width, height);
  vertex(x, height);
  
  endShape();
}

