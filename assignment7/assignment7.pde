import processing.pdf.*;
import toxi.util.datatypes.*;
import toxi.color.*;

int horiz = 15;
int vert = 20;
int makeBigger = 40;
float increment;
float initial;

Color bg = new Color(.59, .82, .49);

void setup() {

  size(round(horiz*makeBigger), round(vert*makeBigger));
  
  beginRecord(PDF, "assignment7_1.pdf");
  
  colorMode(HSB, 1, 1, 1);
  
  background(bg.returnColors());

  WeightedRandomSet<Setting> lines = new WeightedRandomSet<Setting>();

  lines.add(new Setting(25), 7);
  lines.add(new Setting(50), 7);
  lines.add(new Setting(100), 2);
  lines.add(new Setting(75), 5);

  for (int i = 0; i < 15; i++) {
    
    initial = 75+(i*20);
    increment = initial-35;
    
    Setting set = lines.getRandom();
    set.collins = i*10;
    set.x0 = initial + random(40, increment);
    set.display();
    
  }

}

void keyPressed() {
  
  endRecord();
}


