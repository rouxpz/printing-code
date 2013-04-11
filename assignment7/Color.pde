class Color {
  
  float h;
  float s;
  float b;
  
  Color(float _h, float _s, float _b) {
    h = _h;
    s = _s;
    b = _b;
  }
  
  color returnColors() {
    
    return color(h, s, b);
  }
}
