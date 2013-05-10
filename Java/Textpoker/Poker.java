/*
 * Poker.java


 *
 * Version:
 * $Id$
 *
 * Revisions:
 * $Log$
 */

import java.util.ArrayList;
import java.util.Scanner;

/**
 * A 2-card poker game played between a human and a computer player
 *
 * @author paw: Phil White Modified by Dylan Ayrey
 */

public class Poker {

   /**
    * a boolean toggle that tells the order of making the stand/fold
    * decision.  This flips after each hand
    */


   /**
    * Plays a single hand of poker
    *
    * @param    person	The human player
    * @param    comp	The computer player
    * @param    d	The deck
    * @return   An int telling if the user lost/tied/won (neg/0/pos)
    */
    public static int playHand( ArrayList<Player> players, Deck d ){


	System.out.println( "== Dealing Cards\n" );
	//give initial cards 
	for (Player currentplayer : players){
	    currentplayer.addCard( d.dealCard() );
	    currentplayer.addCard( d.dealCard() );
	}

	boolean playerstands[]=new boolean[players.size()];
	int i=0;
	for (Player currentplayer : players){

	    if (currentplayer instanceof Human){
	    	System.out.println( "==============  Human #"+i+1+", Your Cards  ========" );
	    	currentplayer.printHand();
	    	playerstands[i]=currentplayer.stand();
	    }//endif
	    else{
	    	playerstands[i] = currentplayer.stand();
	    	int q=i+1;
	    	if (playerstands[i]){
	    		System.out.println( "Computer #"+q+" Stands" );
		    }//endif
	    	else {
	    		System.out.println( "Computer #"+q+" Folds" );	    		
	    	}//endelse
	    }//endelse
		i++;
	}//endfor
	
	i=0;

	System.out.println( "************  RESULTS *****************" );
	for (Player currentplayer : players){
		i++;
	    if (currentplayer instanceof Human){
	    	System.out.println( "==============  Human #"+i+"'s Cards  ========" );
	    }//endif
	    else{
	    	System.out.println( "==============  Computer #"+i+"'s Cards  ========" );
	    }//endelse
		currentplayer.printHand();

	}//endfor
	i=0;
	int winner=-1;
	int highscore=0;
	int[] scorelist = new int[players.size()];
	for (Player currentplayer : players){
		if(!playerstands[i]){
			scorelist[i]=currentplayer.getvalue();
		}//endif
		else{
			if (currentplayer.getvalue()>highscore){
				highscore=currentplayer.getvalue();
				winner=i;
			}//endif
			scorelist[i]=0;
		}
		i++;
	}//endfor
	
	for (Player currentplayer : players){
		currentplayer.newHand();
	}//endfor

	// have everyone throw in their cards


	return winner;
    }

   /**
    * main method -- plays multiple hands of poker, after each hand
    * ask the user if they want to play again.  We also keep trak of
    * the number of games played/won by the user and print the results
    * at the end.
    *
    * @param    args      command line arguments
    */
    public static void main( String args[] ){
	Scanner in = new Scanner( System.in );
	String again;
	char c;
	int playerWon;
	int numGames = 0;
	int numTie = 0;

	Deck theDeck = new Deck();
	
	ArrayList<Player> players= new ArrayList<Player>();
	System.out.println("How many players for this poker game:");
	int numplayers=in.nextInt();
	for(int i=0; i<numplayers; i++){
		System.out.println("Is player "+i+" a human or a computer (h/c):");
		if (in.next().equals("c")){
			players.add(new Computer());
		}//endif
		else{
			players.add(new Human(in));
		}//endelse
	}
	

	do {
	    numGames = numGames + 1;

	    System.out.println();
	    System.out.println( "##########################################" );
	    System.out.println( "##########       NEW HAND      ###########" );
	    System.out.println( "##########################################" );
	    System.out.println( "\n== Shuffling" );
	    theDeck.shuffle();

	    playerWon = playHand( players, theDeck );
	    if( playerWon==-1 ){
			System.out.println( "\n  **** Tie! ****\n" );
			numTie = numTie + 1;
	    } else{
	    	players.get(playerWon).wins++;
			if (players.get(playerWon) instanceof Human){
				System.out.println( "****Human #"+(playerWon+1)+" Won ****");
			}//endif
			else{
				System.out.println( "****Computer #"+(playerWon+1)+" Won ****");
			}//endelse

	    }

	    do{
	    	System.out.print( "Do you wish to play " +
				    "another hand (y/n):" );
		again = in.next();
		again = again.toLowerCase();
		c = again.charAt( 0 );
	    }while( c != 'y' && c != 'n' );

	} while ( c == 'y' );

	System.out.println( "========== Results ==========" );
	int i=0;
	System.out.println( "Games:\t" + numGames );
	for (Player currentplayer : players){
		if (currentplayer instanceof Human){
			System.out.print( "Human #"+i);
		}
		else{
			System.out.print( "Computer #"+i);
		}
		System.out.println( " won: "+currentplayer.wins);
		i++;
	}

	System.out.println( "Ties:\t" + numTie );

	in.close();
    }
} 
