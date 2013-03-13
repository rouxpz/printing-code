class Story {

  float h;
  float w;
  float pages;

  float storyHue;

  Story(float _pages) {
    pages = _pages;
  }

  void drawStory() {
    
    rect(10, 10, w, h);
  }
}

