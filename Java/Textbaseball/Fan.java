/*
 * Fan.java
 *
 * Version:
 * $Id: Fan.java,v 1.1 2013/04/17 01:34:54 dxa4481 Exp $
 *
 * Revisions:
 * $Log: Fan.java,v $
 * Revision 1.1  2013/04/17 01:34:54  dxa4481
 * *** empty log message ***
 *
 */
import java.util.*;

/**
 * Fan implements the Fan class
 * @author Aaron T Deever
 * @author Dylan Ayrey
 *
 */
public class Fan {
	
	//does nothing. It's here because javadocs
	public Fan(){
	}
	
	//constants and stuff I guess
	public static final int FAN_MONEY = 50;
	Dealer dealer = new Dealer();
	int playermoney = 50;
	
	//Uhh... I don't even know if I use all these... I probably do
	ArrayList<BaseballCard> playerscards = new ArrayList<BaseballCard>();
	HashMap<String, Integer> playerscardsdic = new HashMap<String, Integer>();
	
	ArrayList<BaseballCard> playersgluttony = new ArrayList<BaseballCard>();
	
	ArrayList<BaseballCard> playersdesires = new ArrayList<BaseballCard>();

	//da scanner
	private Scanner in = new Scanner(System.in);
	
	
	/**
	 * Main method for Baseball card simulation
	 * @param args not used
	 */
	public static void main(String[] args) {
		
		if(args.length != 0) { 
			System.out.println("Usage: java Fan");
			return;
		}
		
		Fan fan = new Fan();
		fan.simulate();
	}
	
	/**
	 * Uh, trades and stuff happen here. Won't trade if homers aren't good
	 */
	
	
	public void makeTrade(){
		System.out.print("Input player you will trade: ");
		String cardgive = in.next();
		System.out.print("Input player you will receive: ");
		String cardget= in.next();
		if(playerscardsdic.containsKey(cardgive) && dealer.getcards().containsKey(cardget) && dealer.getcards().get(cardgive)>dealer.getcards().get(cardget)){
			if (playerscardsdic.containsKey(cardget)){
				playerscardsdic.put(cardget,playerscardsdic.get(cardget)+1);
			}//endif
			else{
				playerscardsdic.put(cardget,1);
			}//endelse
			if(playerscardsdic.get(cardgive)>1){
				playerscardsdic.put(cardgive, playerscardsdic.get(cardgive)-1);
			}
			else{	
				playerscardsdic.remove(cardgive);
			}
		}//endif
		else{
			System.out.println("Trade not accepted or bad input");
		}//endelse		
		
	}
	/**
	 * Buys a new card
	 */
	public void purchaseCard(){
		System.out.print("Input name of player card to buy: ");
		String card = in.next();
		if(dealer.getcards().containsKey(card) && playermoney >=3){
			playermoney -=3;
			if (playerscardsdic.containsKey(card)){
				playerscardsdic.put(card,playerscardsdic.get(card)+1);
			}//endif
			else{
				playerscardsdic.put(card,1);
			}				
		}//endif
		else{
			System.out.print("Not enough money or bad input");
		}//endelse
		
	}
	/**
	 * Buys 5 cards
	 */
	public void purchasePack(){
		
		if (playermoney>=10){
			playermoney-=10;
			ArrayList<BaseballCard> newpack=(ArrayList<BaseballCard>)dealer.buyPack();
			for(BaseballCard card : newpack){
				if (playerscardsdic.containsKey(card.name)){
					playerscardsdic.put(card.name,playerscardsdic.get(card.name)+1);
				}//endif
				else{
					playerscardsdic.put(card.name,1);
				}
			}//endfor
		}
		else{
			System.out.print("Not enough money or bad input");
		}
	}
	/**
	 * Prints all the stuff and stuff. Also makes some arrays because I didn't make them elsewhere...
	 */
	
	public void status(){
		
		System.out.println("Fan has $"+playermoney+" remaining.");
		System.out.print("Fan has: ");
		
		
		ArrayList<String> playerscardsp = new ArrayList<String>(playerscardsdic.keySet());
		
		playerscards=new ArrayList<BaseballCard>();
		playersgluttony=new ArrayList<BaseballCard>();
		playersdesires = new ArrayList<BaseballCard>();
		playersdesires.add(dealer.buyCard("Bonds"));
		playersdesires.add(dealer.buyCard("Aaron"));
		playersdesires.add(dealer.buyCard("Ruth"));
		playersdesires.add(dealer.buyCard("Mays"));
		playersdesires.add(dealer.buyCard("Rodriguez"));
		playersdesires.add(dealer.buyCard("Griffey"));
		playersdesires.add(dealer.buyCard("Thome"));
		playersdesires.add(dealer.buyCard("Sosa"));
		playersdesires.add(dealer.buyCard("Robinson"));
		playersdesires.add(dealer.buyCard("McGwire"));
		int index=0;
		for (String s : playerscardsp){
				playerscards.add(dealer.buyCard(s));
				for (BaseballCard b :playersdesires){
					if (b.name.equals(s)){
						index=playersdesires.indexOf(b);
					}//endif
				}//endfor
				playersdesires.remove(index);
				for(int i=0;i<playerscardsdic.get(s)-1;i++){
					playersgluttony.add(dealer.buyCard(s));
				}
		}//endfor
		
		System.out.println(playerscards);
		
		System.out.print("Fan needs: ");
		System.out.println(playersdesires);
		System.out.print("Fan has extra: ");
		System.out.println(playersgluttony);
		
		
	}
	
	/**
	 * Method to simulate the interaction of a Fan and Dealer to buy/trade cards
	 */
	
	
	public void simulate() { 
		

		boolean quit = false;
		
		do { 
			System.out.println();
			System.out.print("Options: buy (P)ack / buy (C)ard / (T)rade");
			System.out.println(" / (S)tatus / (Q)uit");
			System.out.print("Command: ");
			
			if(in.hasNext()) { 
				String cmd = in.next();
				switch(cmd.charAt(0)) { 
				case 'P':
				case 'p':
					purchasePack();
					break;
				case 'C':
				case 'c':
					purchaseCard();
					break;
				case 'T':
				case 't':
					makeTrade();
					break;
				case 'S':
				case 's':
					status();
					break;
				case 'Q':
				case 'q':
					quit = true;
					break;
				default:
					break;
				}
			}
			else { 
				return;
			}
			
		} while (!quit);
	}
	
	
}