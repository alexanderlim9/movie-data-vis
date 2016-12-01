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

//        HashMap<Integer, Integer> ratingMap = new HashMap<Integer, Integer>();
        HashMap<String, String> ratingMap = new HashMap<String, String>();

        try {
            br = new BufferedReader(new FileReader(ratingsFile));
            while ((line = br.readLine()) != null) {
                // use comma as separator
                try {
                    String[] entry = line.split(csvSplitBy);
//                    ratingMap.put(Integer.valueOf(entry[0]), Integer.valueOf(entry[1]));
                    ratingMap.put(entry[0], entry[1] + "," + entry[2]);
                } catch (NumberFormatException e) {
//                    System.out.println(line);
                }
            }

            br2 = new BufferedReader(new FileReader(moviesFile));
            while ((line2 = br2.readLine()) != null) {
                // use comma as separator
                String[] entry = line2.split(csvSplitBy);

                line2 += "," + ratingMap.getOrDefault(entry[0], "0,0");

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
