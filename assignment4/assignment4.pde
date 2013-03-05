import toxi.color.*;
import toxi.util.datatypes.*;
import geomerative.*;
import processing.pdf.*;


//set up guidelines for printing
float vertical = 7;
float horiz = 16;
float makeBigger = 60;

void setup() {
  
  size(round(horiz*makeBigger), round(vertical*makeBigger));
  
  beginRecord(PDF, "assignment4.pdf");
 
  background(200);
  colorMode(HSB, 1, 1, 1); 
  smooth();
  noFill();
  

  //draw 30 instances of the word
  for (int i = 0; i < 30; i++) {
    //how much the x and y values will differ in each iteration
    float xVariance;
    float yVariance;
    
    //set the beginning value
    if (i == 0) {
      xVariance = 2;
      
    //then make the others random
    } else {
      xVariance = random(1.9, 2.1);
    }
    
    yVariance = random(2.8, 3.3);
    //noStroke();
    pushMatrix();
    translate(width/xVariance, 2.1*(height/yVariance));
    drawFont();
    popMatrix();
  }
  
  endRecord();
}


//function for drawing the word
void drawFont() {

  int fontSize = 310;
  
  // initialize the geomerative library
  RG.init(this);

  // create a new font
  RFont font = new RFont("contra.ttf", fontSize, RFont.CENTER);

  // set segment lengths
  RCommand.setSegmentLength(50);

  // get a group from a word. Because we want the reduced points, we need to call toPolygonGroup,
  // because otherwise we would get the actual vertices
  RGroup group = font.toGroup("fuzzy").toPolygonGroup();

  // now loop through the polygons in the group
  for (int k = 0; k < group.elements.length; k++){
    // now get each character as a polygon
    RPolygon polygon = (RPolygon) group.elements[k];

    // because a character has multiple contours (the whole in the 'a' is one, the outline another),
    // let's loop through all the contours first
    for (int i = 0; i < polygon.contours.length; i++){
      
      // for each contour, let's loop through all the points
      RContour curContour = polygon.contours[i];
      
      //set up variables for new TColor object
      float vHue = random(0.7, 1);
      float bright = random(0.4, 0.7);
      
      //create new TColor object
      TColor value = TColor.newHSV(vHue, bright, 0.8); 

      stroke(value.hue(), value.saturation(), value.brightness());
      beginShape();
      
      //initial vertex at point 0
      RPoint beginPoint = curContour.points[0];
      vertex(beginPoint.x, beginPoint.y);


      for (int j = 1; j < (curContour.points.length)-2; j++){

        // bezier vertex for each point
        RPoint curPoint = curContour.points[j];
        RPoint bezPoint = curContour.points[j+2];
        RPoint finPoint = curContour.points[j-1];
        bezierVertex(curPoint.x, curPoint.y, bezPoint.x, bezPoint.y, finPoint.x, finPoint.y);
      }
      
      //final vertex at last point
      RPoint endPoint = curContour.points[curContour.points.length-1];
      vertex(endPoint.x, endPoint.y);

      endShape();
    }
  }
}

