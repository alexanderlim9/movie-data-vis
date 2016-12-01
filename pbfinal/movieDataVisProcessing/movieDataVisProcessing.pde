
Table movies;
Table ratings;

boolean sortYear;
int sortView = 0;
FrameInfo frameInfo = new FrameInfo();

void setup() {
  size(1200, 800);
  background(255);
  movies = loadTable("parsedMovieData.csv", "header");

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
    //int numMovies = movies.getRowCount();
    
    //println(y);
    fill(0, 20);
    noStroke();
    
    float yearX = (y-1916)*width/100;
    
    switch (Math.abs(sortView % 4)) {
      case 0: ellipse(yearX, random(height), width/100, width/100);
        //saveFrame("moviesVis1.JPG");
        break;

      case 1: 
      //case 2: ellipse(x, random(height), rating*3, rating*3);
        pushStyle();
        //fill(150+rating*10, 100+rating*20, 150);
        fill(0, rating*20);
        ellipse(yearX, random(height), width/100, width/100);
        popStyle();
        //saveFrame("moviesVis2.JPG");
        break;
        
      case 2:
        pushStyle();
        //fill(150+rating*10, 100+rating*20, 150);
        fill(0, 20);
        ellipse(yearX, random(height), numParticipants, numParticipants);
        popStyle();
        //saveFrame("moviesVis3.JPG");
        break;
        
      case 3:
        pushStyle();
        //fill(150+rating*10, 100+rating*20, 150);
        fill(0, 20);
        rect(yearX, height-numParticipants, numParticipants/10, numParticipants);
        popStyle();
        //saveFrame("moviesVis3.JPG");
        break;
        
      default: break;
    }
  }
  pushStyle();
  fill(150);
  frameInfo.timeLine();
  popStyle();
  //saveFrame("moviesByYear.JPG");
}

void draw() {
  //background(255);
}

void keyPressed() {
  switch (keyCode) {
    case UP: sortView = sortView + 1;
    setup();
    //saveFrame("moviesVis"+sortView+".JPG");
    //println(sortView);
    break;
    case DOWN: sortView = sortView -1;
    setup();
    //saveFrame("moviesVis"+sortView+".JPG");
    //println(sortView);
    break;
    default: break;
  }
  
}