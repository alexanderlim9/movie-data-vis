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
                while ((line = br.readLine()) != null) {
                    String[] entry = line.split(csvSplitBy);
//                    System.out.println(line);

                    int titleLength = 0;
                    String year = "";
                    // the element is not from the first row
                    try {
                        // IF THERE IS A COMMA IN THE TITLE, CHECK THE SECOND INDEX
                        // THIS DOES NOT ACCOUNT FOR TITLES WITH MORE THAN 2 COMMAS
                        if (entry[1].substring(0, 1).equals("\"")) {
                            titleLength = entry[2].length();
                            if (titleLength >= 6) {
                                year = entry[2].substring(titleLength - 6, titleLength - 2);
                            }
                        } else if (entry[1].length() > 6) {
                            titleLength = entry[1].length();
                            year = entry[1].substring(titleLength - 5, titleLength - 1);
                        }
                        int yearInt = Integer.valueOf(year);
                        line += "," + yearInt;
                        yearMin = Math.min(yearInt, yearMin);
                    } catch (NumberFormatException e) {
                        line += ",N/A";
//                            line += ","+ yearInt;
                    }
                    System.out.println(line);
                }
                yearSpan = 2016 - yearMin;
//                System.out.println(yearMin);
//                System.out.println(yearSpan);

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

