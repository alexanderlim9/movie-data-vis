

class Plot {
  float x, y, r;
  String t;
  
  Plot(String title, float xpos, float ypos, float r) {
    this.t = title;
    this.x = xpos;
    this.y = ypos;
    this.r = r;
  }
  
  void render() {
    ellipse(x, y, r*2, r*2);
  }
  
}