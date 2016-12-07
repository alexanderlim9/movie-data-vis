
Table movies;
Table ratings;

boolean sortYear;
int sortView = 0;
FrameInfo frameInfo = new FrameInfo();

HashMap<Integer, Integer> moviesByYear;
ArrayList<Plot> plots = new ArrayList<Plot>();

boolean isAction = false;
boolean isAdventure = false;
boolean isComedy = false;


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

  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0) + 60, width/2.0, height/2.0, 0, 0, 1, 0);

  for (TableRow row : movies.rows()) {
    
    int id = row.getInt("movieId");
    String title = row.getString("title");
    int y = row.getInt("year");
    float rating = row.getFloat("rating");
    int numParticipants = row.getInt("numParticipants");
    int numMovies = movies.getRowCount();
    String primaryGenre = row.getString("genre1");
    
    //plots = new ArrayList<Plot>();
    
    //println(y);
    fill(0, 20);
    noStroke();
    
    float yearX = (y-1916)*width/100;
    
    
    switch (Math.abs(sortView % 5)) {
      case 0:
        plots.clear();
        plots.add(new Plot(title, yearX, random(height-40), width/200));
        for (Plot p: plots) {
          p.render();
        }
        

        //saveFrame("moviesVis1.JPG");
        //println(y);
        break;

      case 1: 
        pushStyle();
        fill(0, rating*20);
        //rect(yearX, random(height-40), width/100, width/180);
        
        plots.clear();
        plots.add(new Plot(title, yearX, random(height-40), width/200));
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
        plots.add(new Plot(title, yearX, random(height-40), numParticipants/2));
        for (Plot p: plots) {
          p.render();
        }
        popStyle();
        //saveFrame("moviesVis3.JPG");
        break;
        
      case 3:
        pushStyle();
        //fill(150+rating*10, 100+rating*20, 150);
        fill(200);
        //frameInfo.measures();

        pushMatrix();
        translate(0, -40);
        rect(yearX, height-moviesByYear.get(y)*1.5, width/110, moviesByYear.get(y)*1.5);
        
        popMatrix();
        popStyle();
        //saveFrame("moviesVis4-1.JPG");
        break;
        
      case 4:
        pushStyle();
        
        plots.clear();
        plots.add(new Plot(title, yearX, random(height-40), width/200));
        for (Plot p: plots) {
          if (primaryGenre.equals("Action") && isAction) {
            fill(255, 0, 0, 100);
            p.render();
          }
          if (primaryGenre.equals("Adventure") && isAdventure) {
            fill(0, 0, 255, 100);
            p.render();
          }
        }
        popStyle();
        text("Action", width/2, height/2);
        text("Adventure", width/2+30, height/2);

        //saveFrame("moviesVis1.JPG");
        //println(y);
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
    
    
    //for (Plot p: plots) {
    //  //p.render();
    //    if (mousePressed && mouseX > p.x && mouseX < p.x+p.r*2
    //        && mouseY > p.y && mouseY < p.y+p.r*2) {
    //      text(p.t, width/2, height/2);
    //      println("you did it");
    //    }
    //}
}

void keyPressed() {
  switch (keyCode) {
    case UP: sortView = sortView + 1;
    setup();
    //if (sortView == 4) {
    //  saveFrame("moviesVis"+sortView+"-3.JPG");
    //}
    break;
    case DOWN: sortView = sortView -1;
    setup();
    //saveFrame("moviesVis"+sortView+".JPG");
    //println(sortView);
    break;
    default: break;
  }
  switch (key) {
    
    case '1': isAction = !isAction;
      setup();
      sortView = 4;
      break;
    case '2': isAdventure = !isAdventure;
      setup();
      sortView = 4;
      break;
    case '3': isComedy = !isComedy;
      break;
    default: break;
  }
}