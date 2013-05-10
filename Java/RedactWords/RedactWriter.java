/**
 * Jam.java
 *
 * Program:
 *  $Id:$
 *  
 *  Revisions:
 *  $Log:$
 *  
 *  @author Dylan Ayrey
 */
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collection;

//this loops through stuff and puts xs places and stuff

public class RedactWriter extends Writer{

	Writer wr;
	ArrayList<String> redacts;
	ArrayList<Integer> word = new ArrayList<Integer>();

	/**
	 * first constructor
	 * @param takes the writer and an arraylist
	 * @return nothng
	 * 
	 * 
	 */
	public RedactWriter(Writer wr, Collection<String> redacts) throws IllegalArgumentException{
		this.wr=wr;
		this.redacts=(ArrayList<String>)redacts;
	}
	/**
	 * closes the writer
	 * @param takes nothign
	 * @return nothng
	 */	
	@Override
	public void close() throws IOException{
		wr.close();
		
	}//endclose

	
	/**
	 * flushes the thing or whatever
	 * @param takes nothign
	 * @return nothng
	 */		
	@Override
	public void flush() throws IOException{
		wr.flush();
		
	}//endflush

	/**
	 * writes the good words
	 * @param takes char array 0 and length of char array
	 * @return nothng
	 */		
	@Override
	public void write(char[] cbuf, int off, int len) throws IOException{
		wr.write(cbuf, off, len);
		
	}//endwrite
	/**
	 * this like makes the word array and calls write when it's ready to write
	 * @param takes char
	 * @return nothng
	 */			
	public void write(int c) throws IOException{
		
		if (c >=(int)'a' && c<=(int)'z' ||c >=(int)'A' && c<=(int)'Z'){
			word.add(c);
		}//endif
		else{
			int len = word.size();
			if(len!=0){
				char[] cbuf=new char[len+1];
				char[] checkthing = new char[len];
				char[] xcbuf=new char[len+1];
				int i=0;
				for(int bla:word){
					cbuf[i]=(char)bla;
					checkthing[i]=(char)bla;
					xcbuf[i]='X';
					i++;
				}//endfor
				String checkredact =new String(checkthing);
				if(redacts.contains(checkredact)){
					xcbuf[i]=(char)c;
					write(xcbuf,0,len+1);
				}//endif
				else{
					cbuf[i]=(char)c;
					write(cbuf,0,len+1);
				}//endelse
				word.clear();
				
			}//endif
			else{
				char[] onechar={(char)c};
				write(onechar,0,1);
			}//endelse
		}//endelse
	}//endwrite

}
