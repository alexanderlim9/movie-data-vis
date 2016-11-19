
Table movies;
Table ratings;

void setup() {
  size(1200, 800);
  background(255);
  movies = loadTable("parsedMovies.csv", "header");
  ratings  = loadTable("parsedRatings.csv", "header");
  
  println(movies.getRowCount() + " total rows in table"); 
  for (TableRow row : movies.rows()) {
    
    int id = row.getInt("movieId");
    String title = row.getString("title");
    int y = row.getInt("year");
    //float rating = -1.0;
    
    int index = Math.max(1, ratings.findRowIndex("movieID",id));
    float rating = ratings.getRow(index).getFloat("rating");
    
    //if (ratings.findRow("movieID",id) != null) {
    //    rating = ratings.findRow("movieID",id).getFloat("rating");
    //}
    
    //println(name + " (" + species + ") has an ID of " + id);
    //println(id);
    println(y);
    fill(0, 0, 205, 20);
    noStroke();
    //float x = y*12-23000;
    //float x = (y-1916)*width/100+width;
    float x = (y-1916)*width/100;
    //line(x, 400, x, 0);
    //ellipse(x, random(800), width/100, width/100);
    ellipse(random(width), random(height), rating*2, rating*2);
  }
  //saveFrame("moviesByYear.JPG");
}

void draw() {
  
  //background(255, 5);

  
}