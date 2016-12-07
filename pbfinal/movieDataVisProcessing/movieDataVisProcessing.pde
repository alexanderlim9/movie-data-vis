
Table movies;
Table ratings;

boolean sortYear;
int sortView = 0;
FrameInfo frameInfo = new FrameInfo();

HashMap<Integer, Integer> moviesByYear;

void setup() {
  //size(1200, 800);
  fullScreen(OPENGL);
  background(255);
  movies = loadTable("parsedMovieData.csv", "header");
  moviesByYear = Calculate.moviesByYear(movies);
  sortYear = true;
  //sortView = 3;

  //movies = loadTable("parsedMovies.csv", "header");
  //ratings  = loadTable("parsedRatings.csv", "header");
  
  //println(movies.getRowCount() + " total rows in table"); 


  for (TableRow row : movies.rows()) {
    
    int id = row.getInt("movieId");
    //String title = row.getString("title");
    int y = row.getInt("year");
    float rating = row.getFloat("rating");
    int numParticipants = row.getInt("numParticipants");
    int numMovies = movies.getRowCount();
    
    ArrayList<Plot> plots = new ArrayList<Plot>();
    
    //println(y);
    fill(0, 20);
    noStroke();
    
    float yearX = (y-1916)*width/100;
    
    
    switch (Math.abs(sortView % 4)) {
      case 0:
        plots.clear();
        plots.add(new Plot(yearX, random(height-40), width/200));
        for (Plot p: plots) {
          p.render();
        }
        
        //if (mouseX > yearX && mouseX < yearX+width/100
        //    && mouseY > )
        //saveFrame("moviesVis1.JPG");
        //println(y);
        break;

      case 1: 
        pushStyle();
        fill(0, rating*20);
        //rect(yearX, random(height-40), width/100, width/180);
        
        plots.clear();
        plots.add(new Plot(yearX, random(height-40), width/200));
        for (Plot p: plots) {
          p.render();
        }
        popStyle();
        //saveFrame("moviesVis2.JPG");
        break;
        
      case 2:
        pushStyle();
        //fill(150+rating*10, 100+rating*20, 150);
        fill(0, 20);
        //ellipse(yearX, random(height-40), numParticipants, numParticipants);
        plots.clear();
        plots.add(new Plot(yearX, random(height-40), numParticipants/2));
        for (Plot p: plots) {
          p.render();
        }
        popStyle();
        //saveFrame("moviesVis3.JPG");
        break;
        
      case 3:
        frameInfo.measures();
        pushStyle();
        //fill(150+rating*10, 100+rating*20, 150);
        fill(200);

        pushMatrix();
        translate(0, -40);
        rect(yearX, height-moviesByYear.get(y)*1.5, width/110, moviesByYear.get(y)*1.5);
        
        popMatrix();
        popStyle();
        //saveFrame("moviesVis4-1.JPG");
        break;
        
      default: break;
    }
  }
  pushStyle();
  fill(150);
  frameInfo.timeLine();
  popStyle();
}

void draw() {
  //background(255);
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0) + 20, width/2.0, height/2.0, 0, 0, 1, 0);

}

void keyPressed() {
  switch (keyCode) {
    case UP: sortView = sortView + 1;
    setup();
    if (sortView == 3) {
      saveFrame("moviesVis"+sortView+"-3.JPG");
    }
    break;
    case DOWN: sortView = sortView -1;
    setup();
    //saveFrame("moviesVis"+sortView+".JPG");
    //println(sortView);
    break;
    default: break;
  }
  
}