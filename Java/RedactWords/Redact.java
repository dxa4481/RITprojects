/**
 * Jam.java
 *
 * Program:
 *  $Id:$
 *  
 *  Revisions:
 *  $Log:$
 *  @author Dylan Ayrey
 */

import java.io.*;
import java.util.ArrayList;

/**
 * this like checks for - and writes to things and stuff
 */		
public class Redact extends Object {

	//does thing
	public Redact(){
		
	}
	/**
	 * takes inputs opens writer and reader makes redact object
	 * @param takes string input
	 * @return nothng
	 */		
	public static void main(String[] args) throws IOException{
		if (args[1].equals("-")){
			
		}//endif
		if (args[2].equals("-")){
			
		}
		
		BufferedReader buffer = new BufferedReader(new FileReader(args[0]));
		Reader read;
		Writer write;
		
		ArrayList<String> redact = new ArrayList<String>();
		while(buffer.ready()){
			redact.add(buffer.readLine());
		}
		if (args[2].equals("-")){
			write=new PrintWriter(System.out);
		}//endif
		else{
			write = new FileWriter(args[2]);
		}//endelse
		if(args[1].equals("-")){
			read=new InputStreamReader(System.in);
		}//endif
		else{
			read=new BufferedReader(new FileReader(args[1]));
		}//endelse
		
		RedactWriter redactobj = new RedactWriter(write, redact);
		
		while(read.ready()){
			redactobj.write(read.read());
		}
		buffer.close();
		write.close();
		read.close();
		redactobj.close();
		
		
	}//endmain
	
	
}
