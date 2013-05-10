/*
 * Computer.java
 *
 * Version:
 * $Id$
 *
 * Revisions:
 * $Log$
 */

/**
 * A computer player for 2-card poker
 *I just moved 2 methods up to the super class, it's the same otehrwise
 * @author paw: Phil White modified by dylan
 */

public class Computer extends Player{


    private static final int BETTER_THAN_HALF_WIN_VALUE =
		( Ranks.QUEEN.getValue() ) * 14 + 
		( Ranks.JACK.getValue() );

   /**
    * Initalize a computer player for 2-card poker
    */
    public Computer (){
	myCards = new PokerHand();
    }

   /**
    * determines if the computer should stand (vs fold).  Note the
    * computer will stand if it has >=50% chance of winning (Based on
    * other work, a High Card hand with a Q and J beats 50% of the other
    * possible hands).  For the complete odds of winning see 
<a href="../chance.html">chance.html</a> for tables containing the chance 
    * to win for 2-cards of the same suit, and 2 cards of unmatched suits
    *
    * @return	a boolean value specifying if the computer wants to stand
    */
    public boolean stand(){
	return ( myCards.value() >= BETTER_THAN_HALF_WIN_VALUE );
    }

   /**
    * adds a card to the computer's hand
    *
    * @param c  the card to add
    */


   /**
    * prints the hand in some "nice" format
    */
    public void printHand(){
	myCards.printHand();
	System.out.println();
//	System.out.println( "Total:" + value() + "\n" );
    }

   /**
    * clears out all the cards for the computer
    */

   /**
    * This function must come up with a single integer that represents the
    * value of the hand.  You want the value to work such that a higher
    * hand has a higher value. So the values should fall from highest
    * to lowest as:
    * <ul>
    *   <li>pair of Aces
    *   <li>pair of Kings
    *   <br>...
    *   <li>pair of Twos
    *   <li>Ace/King flush (the same suit)
    *   <li>Ace/Queen flush
    *   <br>...
    *   <li>three/two flush
    *   <li>Ace/King high card (not the same suit)
    *   <li>Ace/Queen high card
    *   <br>...
    *   <li>Three/Two high card
    * </ul>
    *
    * @return	the integer representing the value of the hand
    */
    public int value() {
	return myCards.value();
    }

   /**
    * main method for a test driver that should test all the methods
    * in the class
    *
    * @param    args    command line arguments
    */
    public static void main( String args[] ){
    }
}
