/*
 * BaseballCard.java
 *
 * Version:
 * $Id: BaseballCard.java,v 1.1 2013/04/17 01:34:55 dxa4481 Exp $
 *
 * Revisions:
 * $Log: BaseballCard.java,v $
 * Revision 1.1  2013/04/17 01:34:55  dxa4481
 * *** empty log message ***
 *
 */


	/**
	 * Uh... just a class or something. Did I even use comparable? Whatisthat ._.?
	 */	

public class BaseballCard implements Comparable<BaseballCard> {

	public String name;
	public int homers;
	
	
	/**
	 * constructor takes name and homers
	 */		
	
	public BaseballCard(String name, int homers){
		this.name=name;
		this.homers=homers;
	}//endconstructor
	
	/**
	 * takes a card, makes a new card
	 */		
	
	public BaseballCard(BaseballCard bc){
		this.name=bc.getPlayerName();
		this.homers=bc.getHomeRuns();
	}//endbaseballcard
	
	/**
	 * compares too cards
	 */		
	public int compareTo(BaseballCard bc){
		int diff =homers-bc.getHomeRuns();
		if (diff ==0){
			return name.compareTo(bc.name);
		}
		return diff/(Math.abs(diff));
	}//endcomparto
	
	
	/**
	 * see if cards are equal
	 */	
	public boolean equals(Object o){
		if (o instanceof BaseballCard && ((BaseballCard)o).getHomeRuns()==homers && ((BaseballCard)o).getPlayerName()==name){
			return true;
		}
		return false;
	}//endequals
	/**
	 * returns homers
	 */		
	public int getHomeRuns(){
		return homers;
	}//endgethomeruns
	/**
	 * returns name
	 */	
	public String getPlayerName(){
		return name;
	}//endgetplayername
	/**
	 * Returns hashcode
	 */	
	public int hashCode(){
		String cardinfo=name+homers;
		return cardinfo.hashCode();
	}
	/**
	 * Returns the name
	 */	
	public String toString(){
		return name;
	}//endtostring
	
}
