import processing.pdf.*;

//for printing
float printWidth = 15;
float printHeight = 19;
float makeBigger = 30;

void setup() {
  size(round(printWidth*makeBigger), round(printHeight*makeBigger));

  //beginRecord(PDF, "assignment2.pdf");
  background(255);
  smooth();

  drawSharp();
  drawWet(0, height-height/5);
  drawWet(10, height-height/4);
  drawWet(-15, height-height/3);
  drawWet(0, height-height/6);

  //endRecord();
}


//-- FOR DRAWING --//

void drawSharp() {

  stroke(0);
  strokeWeight(3);
  fill(0, 200);

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
  fill(0, 50);

  beginShape();
  vertex(x, y);
  for (int i = 0; i < 5; i++) {
    bezierVertex((i+1)*(width/5), y-50, (i+1)*(width/5), y, (i+1)*(width/5), y+50);
  }
  vertex(width, height);
  vertex(x, height);
  endShape();
}

