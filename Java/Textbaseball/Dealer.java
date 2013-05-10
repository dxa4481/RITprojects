/*
 * Dealer.java
 *
 * Version:
 * $Id: Dealer.java,v 1.1 2013/04/17 01:34:54 dxa4481 Exp $
 *
 * Revisions:
 * $Log: Dealer.java,v $
 * Revision 1.1  2013/04/17 01:34:54  dxa4481
 * *** empty log message ***
 *
 */
import java.util.*;

/**
 * Dealer implements the Dealer class
 * @author Aaron T Deever
 * @author Dylan Ayrey
 *
 */
public class Dealer {
	
	/* Dealer stores information about the baseball cards contained in this
	 * special edition.
	 */
	
	
	public final int CARDS_PER_PACK = 5;
	public final int COST_PER_CARD = 3;
	public final int COST_PER_PACK = 10;

	
	private HashMap<String, Integer> playerData = 
			new HashMap<String, Integer>();
	
	/**
	 * Constructor
	 */
	

	/**
	 * Constructor that does stuff
	 */
	public Dealer() { 
		playerData.put("Bonds", 762);
		playerData.put("Aaron",  755);
		playerData.put("Ruth", 714);
		playerData.put("Mays",  660);
		playerData.put("Rodriguez",  647);
		playerData.put("Griffey", 630);
		playerData.put("Thome",  612);
		playerData.put("Sosa", 609);
		playerData.put("Robinson", 586);
		playerData.put("McGwire", 583);
	}
	/**
	 * Buys a card and returns it
	 */
	public BaseballCard buyCard(String player){
		return (new BaseballCard(player,playerData.get(player)));
	}//endbuycard
	
	
	/**
	 * retuns all cards
	 */	
	public HashMap<String, Integer> getcards(){
		return playerData;
	}
	
	
	/**
	 * returns complete set in arraylist
	 */	
	public Collection<BaseballCard> getCompleteSet(){
		ArrayList<String> bla= new ArrayList<String>(playerData.keySet());
		ArrayList<BaseballCard> blabla = new ArrayList<BaseballCard>();
		for(String s:bla){
			blabla.add(new BaseballCard(s,playerData.get(s)));
		}
		return blabla;
	}
	
	/**
	 * Returns 5 random cards
	 */	
	public Collection<BaseballCard> buyPack(){
		Random gen = new Random();
		
		ArrayList<BaseballCard> returnthis = new ArrayList<BaseballCard>();
		int randnum;
		ArrayList<BaseballCard> blabla = (ArrayList<BaseballCard>)getCompleteSet();
		for(int i=0;i<5;i++){
			randnum=gen.nextInt(blabla.size());
			returnthis.add(blabla.get(randnum));
			blabla.remove(randnum);
		}
		return returnthis;
	}//endbuypack
	
	/**
	 * gives card you ask for
	 */		
	public BaseballCard trade(String fanPlayer, String dealerPlayer){
		return new BaseballCard(dealerPlayer,playerData.get(dealerPlayer));
	}
}