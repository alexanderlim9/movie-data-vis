

class Plot {
  float x, y, r;
  
  Plot(float xpos, float ypos, float r) {
    this.x = xpos;
    this.y = ypos;
    this.r = r;
  }
  
  void render() {
    ellipse(x, y, r*2, r*2);
  }
  
}