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
  drawWet();

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

void drawWet() {


}

