import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

/**
 * Created by alex on 11/19/16.
 */
public class Merge {
    public static void main(String[] args) {

        String ratingsFile = "/Users/alex/Documents/repositories/MovieDataParser/pbfinal/movieData/parsedRatings.csv";
        String moviesFile = "/Users/alex/Documents/repositories/MovieDataParser/pbfinal/movieData/parsedMovies.csv";
        BufferedReader br = null;
        BufferedReader br2 = null;
        String line = "";
        String line2 = "";
        String csvSplitBy = ",";

        HashMap<Integer, Integer> ratingMap = new HashMap<Integer, Integer>();

        try {
            br = new BufferedReader(new FileReader(ratingsFile));
            while ((line = br.readLine()) != null) {
                // use comma as separator
                String[] entry = line.split(csvSplitBy);
                try {
                    // still calculating for the same movie
                    ratingMap.put(Integer.valueOf(entry[0]), Integer.valueOf(entry[1]));
                } catch (NumberFormatException e) {
//                    System.out.println(line);
                }
//                System.out.println(line);
            }

            br2 = new BufferedReader(new FileReader(moviesFile));
            while ((line2 = br2.readLine()) != null) {
                // use comma as separator
                String[] entry = line2.split(csvSplitBy);
                try {
                    line2 += "," + ratingMap.get(entry[0]);
                } catch (NullPointerException e) {
                    line2 += ",";
                }
                System.out.println(line2);
            }



        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }
}
