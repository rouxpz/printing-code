class Story {

  float h;
  float w;
  float pages;

  float storyHue;
  float storySat;
  //float a;

  Story(float _pages, float _storyHue, float _storySat) {
    pages = _pages;
    storyHue = _storyHue;
    storySat = _storySat;
  }

  void drawStory() {
    noStroke();
    TColor storyColor = TColor.newHSV(storyHue, 1, storySat);
    fill(storyColor.hue(), storyColor.saturation(), storyColor.brightness(), 100);
    rect(10, 10, w, h);
  }
}

