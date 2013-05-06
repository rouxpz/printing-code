class Setting {

  float x0;
  float x1;
  float x2;
  int y0;
  float y1;
  float y2;
  float y3;

  float noiseCount;

  color collins;

  Setting(int _y0) {

    y0 = _y0;
  }

  void display() {

    noStroke();

    if (x0 > 75 && x0 <2*(width/3)) {
      fill(collins);
    } 
    else {
      fill(255);
    }

    if (x0 > width/3) {
      x1 = random(x0+10, x0+30);
      x2 = random(x1+50, x1+100);
      drawRightShape(x0, x1, x2);
    }
    else {
      x1 = random(x0-30, x0-10);
      x2 = random(x1-75, x1-50);
      drawLeftShape(x0, x1, x2);
    }
  }

  void drawLeftShape(float firstX, float secondX, float endX) {

    y1 = y0 + (random(10, 50));
    y2 = y1 + (random(100, 150));
    y3 = y2 + (random(200, 250));

    noStroke();
    fill(collins);

    beginShape();
    vertex(firstX, 0);
    vertex(firstX, y0);
    vertex(secondX, y1);
    vertex(secondX, y2);
    vertex(endX, y3);
    vertex(endX, height);
    vertex(firstX+300, height);
    vertex(firstX+300, 0);

    endShape();
  }

  void drawRightShape(float firstX, float secondX, float endX) {

    y1 = y0 + (random(10, 50));
    y2 = y1 + (random(100, 150));
    y3 = y2 + (random(200, 250));

    beginShape();

    vertex(firstX, 0);
    vertex(firstX, y0);
    vertex(secondX, y1);
    vertex(secondX, y2);
    vertex(endX, y3);
    vertex(endX, height);
    vertex(endX+300, height);
    vertex(endX+300, 0);

    endShape();
  }
}

