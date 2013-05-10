/**
 * trollsbridge.java
 *
 * File:
 *	$Id: TrollsBridge.java,v 1.1 2013/05/06 22:27:43 dxa4481 Exp $
 *
 * Revisions:
 *	$Log: TrollsBridge.java,v $
 *	Revision 1.1  2013/05/06 22:27:43  dxa4481
 *	adfasfd
 *
 */

import java.util.ArrayList;

//main thing or whatever
public class TrollsBridge extends Object{
	
	int max;
	int current;
	ArrayList<Woolie> inline = new ArrayList<Woolie>();
	
	//constructor
	/**
	 * @returns nothing
	 * @param the max of bridge
	 */
	public TrollsBridge(int max){
		this.max=max;
	}
	/**
	 * lets trolls get on bridge
	 * @returns nothing
	 * @param a wooolie
	 */
	public synchronized void enterBridgePlease(Woolie thisWoolie){
		System.out.println("The troll scowls \"Get in line\" when "+thisWoolie.name+" shows up");
		if(current==max){
			inline.add(thisWoolie);
			while(inline.get(0)!=thisWoolie&&current==max){
				try {thisWoolie.wait();} catch (InterruptedException e) {}
			}
			
			inline.remove(0);
		}
		System.out.println(thisWoolie.name+" is starting to cross.");
		current++;
		
	}
	
	/**
	 * just decrements counter and notifies
	 * @returns nothing
	 * @param nothing
	 */
	public synchronized void leave(){
		current--;
		notifyAll();
	
	}
	
	
}
