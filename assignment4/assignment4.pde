import geomerative.*;

float vertical = 7;
float horiz = 15;

float makeBigger = 60;

void setup() 
{
  size(round(horiz*makeBigger), round(vertical*makeBigger));
  background(255);
  smooth();
  noFill();

  //draw 20 instances of the word
  for (int i = 0; i < 20; i++) {
    
    float xVariance = random(10, 13);
    float yVariance = random(3, 3.5);
    //noStroke();
    pushMatrix();
    translate(width/xVariance, 2*(height/yVariance));
    drawFont();
    popMatrix();
  }
}



void drawFont() {

  int fontSize = 250;
  // initialize the geomerative library
  RG.init(this);

  // create a new font
  RFont font = new RFont("Copse-Regular.ttf", fontSize, RFont.LEFT);

  // before we generate anything, we need to tell the library how long we want between the points of the font
  RCommand.setSegmentLength(30);

  // get a group from a word. Because we want the reduced points, we need to call toPolygonGroup,
  // because otherwise we would get the actual vertices
  RGroup group = font.toGroup("fuzzy").toPolygonGroup();

  // now loop through the polygons in the group
  for (int k = 0; k < group.elements.length; k++)
  {
    // now get each character as a polygon
    RPolygon polygon = (RPolygon) group.elements[k];

    // because a character has multiple contours (the whole in the 'a' is one, the outline another),
    // let's loop through all the contours first
    for (int i = 0; i < polygon.contours.length; i++)
    {
      // for each contour, let's loop through all the points
      RContour curContour = polygon.contours[i];

      stroke(0);
      beginShape();
      
      //initial vertex at point 0
      RPoint beginPoint = curContour.points[0];
      vertex(beginPoint.x, beginPoint.y);


      for (int j = 1; j < (curContour.points.length)-2; j++)
      {

        // bezier vertex for each point
        RPoint curPoint = curContour.points[j];
        RPoint bezPoint = curContour.points[j+2];
        RPoint finPoint = curContour.points[j+2];
        bezierVertex(curPoint.x, curPoint.y, bezPoint.x, bezPoint.y, finPoint.x, finPoint.y);
      }
      
      //final vertex at last point
      RPoint endPoint = curContour.points[curContour.points.length-1];
      vertex(endPoint.x, endPoint.y);

      endShape();
    }
  }
}

