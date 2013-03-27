import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;
import toxi.color.*;
import toxi.util.datatypes.*;

//for printing
float pageSize = 17;
float makeBigger = 40;

Arrow[] arrows = new Arrow[3];

//set up arrays for hue, sat and brightness for each set of arrows
float[] atariHues = new float[3];
float[] nesHues = new float[3];
float[] psHues = new float[3];
float[] xboxHues = new float[3];

float[] atariSat = new float[3];
float[] nesSat = new float[3];
float[] psSat = new float[3];
float[] xboxSat = new float[3];

float[] atariBright = new float[3];
float[] nesBright = new float[3];
float[] psBright = new float[3];
float[] xboxBright = new float[3];

void setup() {

  size(round(pageSize*makeBigger), round(pageSize*makeBigger));
  beginRecord(PDF, "assignment6_alt.pdf");
  
  background(240);
  
  colorMode(HSB, 1, 1, 1);
  initializeArrows();
  initializeHues();
  initializeSat();
  initializeBright();

  //int fontSize = 17;
  RG.init(this);

  //atari sample
  for (int i = 0; i < arrows.length; i++) {
    pushMatrix();
    translate(0, arrows[i].y);
    noStroke();
    arrows[i].h = atariHues[i];
    TColor console = TColor.newHSV(arrows[i].h, atariSat[i], atariBright[i]);
    fill(console.hue(), console.saturation(), console.brightness());
    arrows[i].drawArrows();
    if (i == 2) {
      TColor lining = TColor.newHSV(atariHues[0], atariSat[0], atariBright[0]);
      fill(lining.hue(), lining.saturation(), lining.brightness());
      arrows[i].drawText();
    }
    popMatrix();
  }

  //nes sample
  for (int i = 0; i < arrows.length; i++) {
   pushMatrix();
   translate(340, arrows[i].y);
   noStroke();
   arrows[i].h = nesHues[i];
   TColor console = TColor.newHSV(nesHues[i], nesSat[i], nesBright[i]);
   fill(console.hue(), console.saturation(), console.brightness());
   arrows[i].drawArrows();
   if (i == 2) {
     TColor lining = TColor.newHSV(nesHues[0], nesSat[0], nesBright[0]);
     fill(lining.hue(), lining.saturation(), lining.brightness());
     arrows[i].drawText();
   }
   popMatrix();
   }
   
   //playstation sample
   for (int i = 0; i < arrows.length; i++) {
   pushMatrix();
   translate(0, 340+ arrows[i].y);
   noStroke();
   arrows[i].h = psHues[i];
   TColor console = TColor.newHSV(psHues[i], psSat[i], psBright[i]);
   fill(console.hue(), console.saturation(), console.brightness());
   arrows[i].drawArrows();
   if (i == 2) {
     TColor lining = TColor.newHSV(psHues[0], psSat[0], psBright[0]);
     fill(lining.hue(), lining.saturation(), lining.brightness());
     arrows[i].drawText();
   }
   popMatrix();
   }
   
   //xbox sample
   for (int i = 0; i < arrows.length; i++) {
   pushMatrix();
   translate(340, 340 + arrows[i].y);
   noStroke();
   arrows[i].h = xboxHues[i];
   TColor console = TColor.newHSV(xboxHues[i], xboxSat[i], xboxBright[i]);
   fill(console.hue(), console.saturation(), console.brightness());
   arrows[i].drawArrows();
   if (i == 2) {
     TColor lining = TColor.newHSV(xboxHues[0], xboxSat[0], xboxBright[0]);
     fill(lining.hue(), lining.saturation(), lining.brightness());
     arrows[i].drawText();
   }
   popMatrix();
   }
   
   endRecord();
}


//-----INITIALIZATION FUNCTIONS-------//

//initializing arrow placement
void initializeArrows() {
  arrows[0] = new Arrow(0, 30);
  arrows[1] = new Arrow(0, 60);
  arrows[2] = new Arrow(0, 90);
}

//initializing hues
void initializeHues() {
  atariHues[0] = 0;
  atariHues[1] = 0.1;
  atariHues[2] = 0;

  nesHues[0] = 0;
  nesHues[1] = 0;
  nesHues[2] = 0.7;

  psHues[0] = 0;
  psHues[1] = 0.4;
  psHues[2] = 0.6;

  xboxHues[0] = 0;
  xboxHues[1] = 0;
  xboxHues[2] = 0.3;
}

//initializing saturation
void initializeSat() {

  atariSat[0] = 0;
  atariSat[1] = 1;
  atariSat[2] = 1;

  nesSat[0] = 0;
  nesSat[1] = 0;
  nesSat[2] = 0.8;

  psSat[0] = 0.8;
  psSat[1] = 1;
  psSat[2] = 0.9;

  xboxSat[0] = 0;
  xboxSat[1] = 0;
  xboxSat[2] = 1;
}

//initializing brightness
void initializeBright() {

  atariBright[0] = 0;
  atariBright[1] = 0.3;
  atariBright[2] = 1;

  nesBright[1] = 0.3;
  nesBright[0] = 0.7;
  nesBright[2] = 0.8;

  psBright[0] = 1;
  psBright[1] = 1;
  psBright[2] = 1;

  xboxBright[0] = 0;
  xboxBright[1] = 0.5;
  xboxBright[2] = 1;
}

