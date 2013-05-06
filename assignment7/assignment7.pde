import processing.pdf.*;
import toxi.util.datatypes.*;
import toxi.color.*;

int horiz = 15;
int vert = 20;
int makeBigger = 40;
float increment;
float initial;
int colorChooser;

Color bg = new Color(.59, .82, .49);
Color [] colors = new Color [6];

void setup() {

  size(round(horiz*makeBigger), round(vert*makeBigger));

  beginRecord(PDF, "assignment7_13.pdf");

  colorMode(HSB, 1, 1, 1);

  background(bg.returnColors());

  initializeColors();

  WeightedRandomSet<Setting> lines = new WeightedRandomSet<Setting>();

  lines.add(new Setting(75), 1);
  lines.add(new Setting(100), 2);
  lines.add(new Setting(150), 4);
  lines.add(new Setting(200), 2);
  lines.add(new Setting(250), 3);
  lines.add(new Setting(300), 1);

  for (int i = 0; i < 13; i++) {

    if (i > 5) {
      initial = (width/3)+((width/2)/10);
      if (i < 12) {
        colorChooser = i-6;
      } 
      else {
        colorChooser = 1;
      }
      increment = random(10*i, 130);
    } 
    else {
      initial = 75+(i*20);
      colorChooser = i;
      increment = random(10, 30);
    }

    Setting set = lines.getRandom();
    set.collins = colors[colorChooser].returnColors();
    set.x0 = initial + increment;
    set.display();

  }
  println(width/2);

  endRecord();
}

void initializeColors() {

  colors[0] = new Color(.164, .88, .36);
  colors[1] = new Color(.572, .74, .57);
  colors[2] = new Color(.73, .09, .22);
  colors[3] = new Color(.086, .79, .80);
  colors[4] = new Color(.958, .77, .56);
  colors[5] = new Color(.894, .17, .82);
}

void keyPressed() {
}

