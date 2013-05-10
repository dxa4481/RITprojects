/**
 * woolie.java
 *
 * File:
 *	$Id: Woolie.java,v 1.1 2013/05/06 22:27:43 dxa4481 Exp $
 *
 * Revisions:
 *	$Log: Woolie.java,v $
 *	Revision 1.1  2013/05/06 22:27:43  dxa4481
 *	adfasfd
 *
 */

//main class, makes a woolie thread
public class Woolie extends Thread{
	String name;
	int crossTime;
	String destination;
	TrollsBridge bridgeGuard;
	int currenttime=1;
	//constructor takes name time destonation
	/**
	 * @returns nothing
	 * @param time name destination bridge
	 */
	public Woolie(String name,int crossTime,String destination,TrollsBridge bridgeGuard){
		this.name=name;
		this.crossTime=crossTime;
		this.destination= destination;
		this.bridgeGuard=bridgeGuard;
	}
	//run calls bridgeguard waits time it should wait prints stuff
	/**
	 * @returns nothing
	 * 
	 * @param nothing
	 */
	public void run(){
		bridgeGuard.enterBridgePlease(this);
		while(currenttime<crossTime){
			System.out.println(name+" "+currenttime+" seconds");
			try{sleep(1000);}catch(InterruptedException E){}
			
			currenttime++;
		}//endwhile
		System.out.println(name+" leaves at "+destination);
		currenttime=1;
		bridgeGuard.leave();
	}
}
