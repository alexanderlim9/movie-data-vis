
Table movies;
Table ratings;

boolean sortYear;
int sortView;

void setup() {
  size(1200, 800);
  background(255);
  movies = loadTable("parsedMovieData.csv", "header");

  sortYear = true;
  sortView = 3;

  //movies = loadTable("parsedMovies.csv", "header");
  //ratings  = loadTable("parsedRatings.csv", "header");
  
  println(movies.getRowCount() + " total rows in table"); 
  for (TableRow row : movies.rows()) {
    
    int id = row.getInt("movieId");
    String title = row.getString("title");
    int y = row.getInt("year");
    //float rating = -1.0;
    float rating = row.getFloat("rating");
    int numParticipants = row.getInt("numberOfParticipants");
    
    //println(name + " (" + species + ") has an ID of " + id);
    //println(id);
    println(y);
    fill(0, 20);
    noStroke();
    //float x = y*12-23000;
    //float x = (y-1916)*width/100+width;
    
    float x = (y-1916)*width/100;
    
    switch (sortView) {
      case 1: ellipse(x, random(height), width/100, width/100);
      break;
      //case 2: ellipse(x, random(height), rating*3, rating*3);

      case 2: 
        pushStyle();
        //fill(150+rating*10, 100+rating*20, 150);
        fill(0, rating*20);
        ellipse(x, random(height), width/130, width/130);
        popStyle();
        break;
        
      case 3:
        pushStyle();
        //fill(150+rating*10, 100+rating*20, 150);
        fill(0, 30);
        ellipse(x, random(height), numParticipants, numParticipants);
        popStyle();
        break;
        
      default: break;
    }
  }
  //saveFrame("moviesByYear.JPG");
}

void draw() {
  
  //background(255, 5);
  
}

//void keyPressed() {
//  switch (key) {
//    case 'y' = 
    
//  }
  
//}