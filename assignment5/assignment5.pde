import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import toxi.color.*;
import toxi.color.theory.*;


float horizontal = 11;
float vertical = 17;
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

  RG.init(this);

  ewing = new Story(74);
  zedelghem = new Story(80);
  luisa = new Story(102);
  cavendish = new Story(76);
  sonmi = new Story(92);
  sloosha = new Story(73);

  drawBackground();
  displayStories();
  fontSize = 90;
  displayTitle();
  fontSize = 40;
  displayAuthor();
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

  noStroke();
  fill(0, 255, 0, 80);
  ewing.drawStory();
  popMatrix();

  //draw zedelghem rect
  pushMatrix();
  translate(zedelghemModule.x-10, zedelghemModule.y-10);
  zedelghem.h = map(zedelghem.pages, 0, 102, 0, height/2);
  zedelghem.w = 2*zedelghemModule.h;

  noStroke();
  fill(255, 0, 0, 80);
  zedelghem.drawStory();
  popMatrix();

  //draw luisa rect
  pushMatrix();
  translate(luisaModule.x-10, luisaModule.y-10);
  luisa.w = map(luisa.pages, 0, 102, 0, height/2);
  luisa.h = 2*luisaModule.h;

  noStroke();
  fill(0, 0, 255, 80);
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

  noStroke();
  fill(100, 0, 255, 80);
  sonmi.drawStory();
  popMatrix();

  //draw sloosha rect
  pushMatrix();
  translate(slooshaModule.x-10, slooshaModule.y-10);
  sloosha.h = map(sloosha.pages, 0, 102, 0, height/2);
  sloosha.w = 2*slooshaModule.h;

  noStroke();
  fill(100, 0, 255, 80);
  sloosha.drawStory();
  popMatrix();
}

void displayTitle() {
  //RG.init(this);
  ModularGrid grid = new ModularGrid(9, 15, 10, 25);
  RFont font = new RFont("Tw Cen MT Bold.ttf", fontSize, RFont.LEFT);

  Module module1 = grid.modules[2][2];
  Module module2 = grid.modules[2][3];

  pushMatrix();
  translate(module1.x-20, module1.y+20);
  fill(150);
  font.draw("CLOUD");
  popMatrix();

  pushMatrix();
  translate(module2.x-20, module2.y+30);
  font.draw("ATLAS");
  popMatrix();
}

void displayAuthor() {
  
  RFont font = new RFont("Tw Cen MT Bold.ttf", fontSize, RFont.RIGHT);

  ModularGrid grid = new ModularGrid(9, 15, 10, 25);
  //grid.display();
  
  Module novelModule = grid.modules[8][13];
  Module authorModule = grid.modules[8][14];
  
  pushMatrix();
  translate(novelModule.x+novelModule.w-5, novelModule.y+10);
  noStroke();
  fill(150);
  font.draw("a novel");
  popMatrix();

  pushMatrix();
  translate(authorModule.x+authorModule.w/2.5-5, authorModule.y);
  font.draw("by david mitchell");
  popMatrix();
  
}

void drawBackground() {
  
  noStroke();
  fill(0, 0, 255, 40);
  rect(0,0,width,height);

  ModularGrid grid = new ModularGrid(80, 100, 0, 0);
  //grid.display();

  for (int i = 0; i < 80; i++) {
    for (int j = 0; j < 100; j++) {
      Module space = grid.modules[i][j];
      pushMatrix();
      
      translate(space.x, space.y);
      fill(255,100);
      //strokeWeight(2);
      ellipseMode(CORNER);
      ellipse (0,0,space.w-1,space.h-1);
      popMatrix();
    }
  }
}

