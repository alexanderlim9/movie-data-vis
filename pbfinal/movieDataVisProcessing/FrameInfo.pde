

class FrameInfo {
  
  FrameInfo() {}
  
  void timeLine() {
    for (int x = 0; x < 11; x++) {
      pushMatrix();
      translate(x*width/10-3, height);
      rotate(-PI/3);
      text(Integer.toString(1916 + x*10), 0, 0);
      popMatrix();
      //text(Integer.toString(1916 + x*10), x*(width/10), height);
    }
  }
  
  void measures() {
    for (int y = 0; y < height; y+=height/12) {
      println("it's working");
      line(0, y*1.5, width, y);
    }
  }
}