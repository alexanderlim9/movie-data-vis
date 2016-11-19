import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * Created by alex on 11/17/16.
 */
public class RatingCalculator {


    public static void main(String[] args) {

        String csvFile = "/Users/alex/Documents/repositories/MovieDataParser/pbfinal/movieData/ratings.csv";
        BufferedReader br = null;
        String line = "";
        String csvSplitBy = ",";

        int movieID = 1;
        int numRatings = 0;
        float sumRatings = 0;
        float averageRating = 0;

        try {
            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {
                // use comma as separator
                String[] entry = line.split(csvSplitBy);
                try {
                    // still calculating for the same movie
                    if (Integer.valueOf(entry[1]) == movieID) {
                        sumRatings += Integer.valueOf(entry[2]);
                        numRatings += 1;
                    } else {
                        // calculate average rating of movie
                        averageRating = sumRatings / numRatings;
//                        System.out.print("MovieID: " + movieID + ", ");
//                        System.out.print("Average Rating: " + averageRating + ", ");
//                        System.out.println("Number of Reviews: " + numRatings + ". ");

                        System.out.println(movieID + "," + averageRating + "," + numRatings);

                        // begin new calculation by resetting values
                        sumRatings = Integer.valueOf(entry[2]);
                        numRatings = 1;
                        movieID = Integer.valueOf(entry[1]);
                    }
                } catch (NumberFormatException e) {
//                    System.out.println(line);
                }

//                System.out.println(line);
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
