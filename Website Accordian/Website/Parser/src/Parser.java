import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Parser {

	/**
	 * Rules:
	 * Before <h, close a section and create a section with that header as the id
	 * every <li>, make into a slide
	 * 
	 * 
	 * @param infile
	 * @param outfile
	 * @throws IOException
	 */
	public static void Parse(String infile, String outfile) throws IOException {
		BufferedReader reader = new BufferedReader(new FileReader(infile));
		String text = null;

		while ((text = reader.readLine()) != null) {

		}
	}
}
