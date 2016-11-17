/**
 * Created by alex on 11/16/16.
 */

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

    public class Parser {

        // Code adapted from source: https://www.mkyong.com/java/how-to-export-data-to-csv-file-java/
        public static void main(String[] args) {

            String csvFile = "/Users/alex/Documents/repositories/MovieDataParser/pbfinal/movieData/movies.csv";
            BufferedReader br = null;
            String line = "";
            String csvSplitBy = ",";
            int yearMin = 2017;
            int yearSpan;

            try {

                br = new BufferedReader(new FileReader(csvFile));
//                int counter = 0;
                while ((line = br.readLine()) != null) {
                    // use comma as separator
                    String[] entry = line.split(csvSplitBy);
                    int titleLength = entry[1].length();
                    if (titleLength > 6) {
//                        System.out.println(entry[1].substring(titleLength - 5, titleLength-1));

                        String year = entry[1].substring(titleLength - 5, titleLength-1);
                        try {
//                            System.out.println(Integer.valueOf(year));
                            int yearInt = Integer.valueOf(year);
                            line += ","+ yearInt;
                            yearMin = Math.min(yearInt, yearMin);

//                            entry[1] = entry[1].replace(year,"");
//                            entry[1] = entry[1].substring(titleLength-5);
                        } catch (NumberFormatException e) {
//                            System.out.println("N/A");
                            line += ",N/A ";
                        }
                    }
                    System.out.println(line);
                }
                yearSpan = 2016 - yearMin;
//                System.out.println(counter);
                System.out.println(yearMin);
                System.out.println(yearSpan);


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

        /**
         * Given an array of data, translates genres from strings to string-boolean values.
         * i.e. isActionMovie will store a value of 0 if the movie is not an action movie
         *
         * @param entry an array of a given movie entry
         */
//        public void translateGenre(String[] entry) {
//
//        }


}

