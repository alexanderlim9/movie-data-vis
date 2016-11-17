/**
 * Created by alex on 11/16/16.
 */

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

    public class Parser {

        public static void main(String[] args) {

            String csvFile = "/Users/alex/Documents/Fall16/ProgrammingBasics/pbfinal/movieData/movies.csv";
            BufferedReader br = null;
            String line = "";
            String csvSplitBy = ",";

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
                            line += ","+ Integer.valueOf(year);

                        } catch (NumberFormatException e) {
//                            System.out.println("N/A");
                            line += ",N/A ";
                        }

                    }
//                    System.out.println("Entry  " + entries[4] + " , name=" + entries[5] + "]");
//                    if (entries.length != 3) {
//                        counter++;
//                    }
                    System.out.println(line);
                }
//                System.out.println(counter);


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

