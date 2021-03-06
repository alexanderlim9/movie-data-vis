

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
    text("Number of Movies: 9126", width-100, height + 25);
  }
  
  void measures() {
    for (int y = 0; y < height; y+=height/12) {
      println("it's working");
      line(0, y*1.5, width, y);
    }
  }
  
  void title0() {
    textAlign(CENTER);
    text("Movies by Year", width/2, height + 25);
  }
  
  void title1() {
    textAlign(CENTER);
    text("Movies by Rating", width/2, height + 25);
  }
  
  void title2() {
    textAlign(CENTER);
    text("Movies by Popularity", width/2, height + 25);
  }
  
  void title3() {
    textAlign(CENTER);
    text("Number of Movies by Year", width/2, height + 25);
    pushStyle();
    stroke(.5);
    stroke(100, 40);
    for (int i = 1; i < 10; i++) {
      //line(0, height-275*1.5-40, width, height-275*1.5-40);
      text(i*100, 0, height-i*150-40);
      line(0, height-i*150-40, width, height-i*150-40);
    }
    popStyle();
  }
  
  void title4() {
    textAlign(CENTER);
    text("Movies by Genre", width/2, height + 25);
  }
  
  void genreKey() {
    pushStyle();
    fill(150);
    text("1-Action", 0, height-140);
    text("2-Adventure", 0, height-140+15);
    text("3-Animation", 0, height-140+15*2);
    text("4-Comedy", 0, height-140+15*3);
    text("5-Crime", 0, height-140+15*4);
    text("6-Children", 0, height-140+15*5);
    text("7-Drama", 0, height-140+15*6);
    
    fill(255, 20, 60, 100);
    rect(-15, height-150, 10, 10);
    fill(50, 0, 255, 100);
    rect(-15, height-150+15, 10, 10);
    fill(85, 180, 50, 100);
    rect(-15, height-150+15*2, 10, 10);
    fill(255, 180, 0, 100);
    rect(-15, height-150+15*3, 10, 10);
    fill(150, 140, 140, 100);
    rect(-15, height-150+15*4, 10, 10);
    fill(64, 224, 208, 100);
    rect(-15, height-150+15*5, 10, 10);
    fill(128, 0, 128, 100);
    rect(-15, height-150+15*6, 10, 10);
    
    popStyle();
    
    /*
    pushStyle();
    fill(150);
    text("Action", 0, height + 25);
    text("Adventure", width/10, height + 25);
    text("Animation", width/10*2, height + 25);
    text("Comedy", width/10*3, height + 25);
    text("Crime", width/10*4, height + 25);
    text("Children", width/10*5, height + 25);
    text("Drama", width/10*6, height + 25);
    
    fill(255, 20, 60, 100);
    rect(-15, height+15, 10, 10);
    fill(50, 0, 255, 100);
    rect(width/10-15, height+15, 10, 10);
    fill(85, 180, 50, 100);
    rect(width/10*2-15, height+15, 10, 10);
    fill(255, 180, 0, 100);
    rect(width/10*3-15, height+15, 10, 10);
    fill(150, 140, 140, 100);
    rect(width/10*4-15, height+15, 10, 10);
    fill(64, 224, 208, 100);
    rect(width/10*5-15, height+15, 10, 10);
    fill(128, 0, 128, 100);
    rect(width/10*6-15, height+15, 10, 10);

    popStyle();
    */
  }
}