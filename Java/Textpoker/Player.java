/*
 * Player.java
 *
 * Version:
 * $Id$
 *
 * Revisions:
 * $Log$
 */


public abstract class Player {

	/**
	 * has some protected things and some abstract things and stuff
	 */
    protected PokerHand myCards;
    //just a variable used by both human and computer
	protected int wins;
	//a variable again used by both
	public static void main(String[] args) {
	}
    public void newHand(){
	myCards = new PokerHand();
    }	
    //a method that is implomented the same in both
	public abstract boolean stand();
	//a method that is implemented idfferently
	public abstract void printHand();
	//another method that's different for each class
    public int getvalue(){
    	return myCards.value();
    }
    //this is one I added, it just returns the player's score
    
    public void addCard(Card c){
    	myCards.addCard(c);
    }
    //this returns the cards same for both functions

}
