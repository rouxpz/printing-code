import toxi.color.*;
import toxi.util.datatypes.*;
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import processing.pdf.*;

//for printing
float horizontal = 10;
float vertical = 16;
float makeBigger = 40;

int fontSize;

Story ewing;
Story zedelghem;
Story luisa;
Story cavendish;
Story sonmi;
Story sloosha;

void setup() {

  size(round(horizontal*makeBigger), round(vertical*makeBigger));
  smooth();
  background(255);
  
  beginRecord(PDF, "assignment5.pdf");
  
  colorMode(HSB, 1, 1, 1, 255);

  RG.init(this);

  //set up each new story object
  ewing = new Story(74, random(0.4, 0.5), 0.5);
  zedelghem = new Story(80, random(0.6, 0.7), 0.4);
  luisa = new Story(102, random(0.9, 1), 0.3);
  cavendish = new Story(76, random(0.3, 0.4), 0.4);
  sonmi = new Story(92, random(0.1, 0.2), 0.4);
  sloosha = new Story(73, random(0, 0.1), 0.3);

  drawBackground();
  displayStories();
  
  //draw text
  colorMode(RGB, 255);
  fontSize = 80;
  displayTitle();
  
  fontSize = 35;
  displayAuthor();
  
  endRecord();
}

void displayStories() {

  ModularGrid grid = new ModularGrid(9, 15, 10, 25);
  //grid.display();

  //establish modules for all the stories
  Module slooshaModule = grid.modules[0][1];
  Module sonmiModule = grid.modules[0][4];
  Module cavendishModule = grid.modules[5][4];
  Module luisaModule = grid.modules[1][7];
  Module zedelghemModule = grid.modules[2][7];
  Module ewingModule = grid.modules[2][10];

  //draw ewing's rect
  pushMatrix();
  translate(ewingModule.x-10, ewingModule.y-10);
  ewing.w = map(ewing.pages, 0, 102, 0, height/2);
  ewing.h = 2*ewingModule.h;

  ewing.drawStory();
  popMatrix();

  //draw zedelghem rect
  pushMatrix();
  translate(zedelghemModule.x-10, zedelghemModule.y-10);
  zedelghem.h = map(zedelghem.pages, 0, 102, 0, height/2);
  zedelghem.w = 2*zedelghemModule.h;

  zedelghem.drawStory();
  popMatrix();

  //draw luisa rect
  pushMatrix();
  translate(luisaModule.x-20, luisaModule.y-10);
  luisa.w = map(luisa.pages, 0, 102, 0, height/2);
  luisa.h = 2*luisaModule.h;

  luisa.drawStory();
  popMatrix();

  //draw cavendish rect
  pushMatrix();
  translate(cavendishModule.x-10, cavendishModule.y-10);
  cavendish.h = map(cavendish.pages, 0, 102, 0, height/2);
  cavendish.w = 2*cavendishModule.h;

  noStroke();
  fill(0, 100, 255, 80);
  cavendish.drawStory();
  popMatrix();

  //draw sonmi rect
  pushMatrix();
  translate(sonmiModule.x-10, sonmiModule.y-10);
  sonmi.w = map(sonmi.pages, 0, 102, 0, height/2);
  sonmi.h = 2*sonmiModule.h;

  sonmi.drawStory();
  popMatrix();

  //draw sloosha rect
  pushMatrix();
  translate(slooshaModule.x-10, slooshaModule.y-10);
  sloosha.h = map(sloosha.pages, 0, 102, 0, height/2);
  sloosha.w = 2*slooshaModule.h;

  sloosha.drawStory();
  popMatrix();
}

//draw the title
void displayTitle() {
  //RG.init(this);
  ModularGrid grid = new ModularGrid(9, 15, 10, 25);
  RFont font = new RFont("Tw Cen MT Bold.ttf", fontSize, RFont.LEFT);

  Module module1 = grid.modules[2][2];
  Module module2 = grid.modules[2][3];

  pushMatrix();
  translate(module1.x-10, module1.y+15);
  fill(50, 220);
  font.draw("CLOUD");
  popMatrix();

  pushMatrix();
  translate(module2.x-10, module2.y+18);
  font.draw("ATLAS");
  popMatrix();
}

void displayAuthor() {
  
  RFont font = new RFont("Tw Cen MT Bold.ttf", fontSize, RFont.RIGHT);

  //draw grid
  ModularGrid grid = new ModularGrid(9, 15, 10, 25);
  //grid.display();
  
  Module novelModule = grid.modules[8][13];
  Module authorModule = grid.modules[8][14];
  
  //draw text
  pushMatrix();
  translate(novelModule.x+novelModule.w, novelModule.y+10);
  noStroke();
  fill(50, 200);
  font.draw("a novel");
  popMatrix();

  pushMatrix();
  translate(authorModule.x+authorModule.w/2.5-12, authorModule.y);
  font.draw("by david mitchell");
  popMatrix();
  
}

void drawBackground() {
  
  //draw the sky rectangle
  noStroke();
  TColor sky = TColor.newHSV(0.59, 0.5, 1);
  fill(sky.hue(), sky.saturation(), sky.brightness(), 70);
  rect(0,0,width,height);

  //grid for the "clouds"
  ModularGrid grid = new ModularGrid(70, 90, 0, 0);
  //grid.display();

  //draw clouds
  for (int i = 0; i < 70; i++) {
    for (int j = 0; j < 90; j++) {
      Module space = grid.modules[i][j];
      
      pushMatrix();
      translate(space.x, space.y);
      fill(0.2, 0, 1, 100);
      //strokeWeight(2);
      ellipseMode(CORNER);
      ellipse (0,0,space.w-1,space.h-1);
      popMatrix();
    }
  }
}

