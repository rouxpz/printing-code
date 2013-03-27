class Arrow {
  
  float x;
  float y;
  float h;
  
  Arrow(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void drawArrows() {
    ArrowGrid grid = new ArrowGrid(0, 0, 340, 340);
    //grid.display();
    
    Module one = grid.modules[9][1];
    Module two = grid.modules[8][2];
    Module three = grid.modules[7][3];
    Module four = grid.modules[6][4];
    Module five = grid.modules[5][5];
    Module bottom = grid.modules[8][6];
    
    //noStroke();
    //fill(0, 150);
    
    pushMatrix();
    translate(one.x, one.y);
    rect(0, 0, one.w, one.h);
    popMatrix();
    
    pushMatrix();
    translate(two.x, two.y);
    rect(0, 0, two.w*3, two.h);
    popMatrix();
    
    pushMatrix();
    translate(three.x, three.y);
    rect(0, 0, three.w*5, three.h);
    popMatrix();
    
    pushMatrix();
    translate(four.x, four.y);
    rect(0, 0, four.w*7, four.h);
    popMatrix();
    
    pushMatrix();
    translate(five.x, five.y);
    rect(0, 0, five.w*9, five.h);
    popMatrix();
    
    pushMatrix();
    translate(bottom.x, bottom.y);
    rect(0, 0, bottom.w*3, bottom.h*3);
    popMatrix();
  }
  
}
