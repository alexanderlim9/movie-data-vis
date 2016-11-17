
Table table;

void setup() {
  size(1200, 800);
  background(255);
  table = loadTable("parsedMovies.csv", "header");
  
  println(table.getRowCount() + " total rows in table"); 
  for (TableRow row : table.rows()) {
    
    int id = row.getInt("movieId");
    String title = row.getString("title");
    int y = row.getInt("year");
    //String species = row.getString("species");
    //String name = row.getString("name");
    
    //println(name + " (" + species + ") has an ID of " + id);
    //println(id);
    println(y);
    fill(0, 0, 205, 20);
    noStroke();
    //float x = y*12-23000;
    //float x = (y-1916)*width/100+width;
    float x = (y-1916)*width/100;
    //line(x, 400, x, 0);
    ellipse(x, random(800), width/100, width/100);
  }
}

void draw() {
  
  //background(255, 5);

  
}