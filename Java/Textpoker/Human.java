/*
 * Human.java
 *
 * Version:
 * $Id$
 *
 * Revisions:
 * $Log$
 */

import java.util.Scanner;

/**
 * A human player for 2-card poker.
 * I just moved two methods up, otherwise it's the same
 * @author paw: Phil White modified by DYlan ayrey
 */

public class Human extends Player {


    private static Scanner in;

   /**
    * Initialize a human player for 2-card poker
    */
    public Human ( Scanner inScan ){
	in = inScan;
	myCards = new PokerHand();
    }

   /**
    * Asks the player if they want to stand.  You should prompt the
    * player with a suitable message, and then read the players response
    * from standard input.
    *
    * @return  a boolean value specifying if the human wants to stand
    */
    public boolean stand(){
	boolean res = true;
	String answer;
	char c;

	do{
	    System.out.print("Do you want to stand (y/n)? ");
	    answer = in.next();
	    answer = answer.toLowerCase();
	    c = answer.charAt(0);
	}while( c != 'y' && c != 'n' );

	if ( c == 'y' ){
	    res = true;
	} else {
	    res = false;
	}
	return res;
    }

   /**
    * adds a card to the human's hand
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
    * clears out all the cards for the human
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
    * @return  the integer representing the value of the hand
    */
    public int value() {
	return myCards.value();
    }
    

   /**
    * Compares the humans hand with the specified computers hand for order. 
    * Returns a:	<table BORDER="1" CELLPADDING="1" CELLSPACING="1">
    *		  <tr><td>negative integer<td>player hand < computers hand	
    *		  <tr><td>zero<td>player hand == computers hand	
    *		  <tr><td>positive integer<td>player hand > computers hand	
    *		</table>
    *
    * @return	a negative integer, zero, or a positive integer as the
    *		human is less than, equal to, or greater than the computer
    */
    public int compareTo( Computer d ){
/*
	int res;

	if( myCards.value() > d.value() ){
	    res = 1;
	} else if( myCards.value() == d.value() ){
	    res = 0;
	} else {
	    res = -1;
	}
	return res;
*/
	return myCards.value() - d.value();
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
