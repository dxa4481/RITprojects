/*
 * Player.java
 *
 * Version:
 * $Id: CardButton.java,v 1.2 2013/04/22 17:51:11 dxa4481 Exp $
 *
 * Revisions:
 * $Log: CardButton.java,v $
 * Revision 1.2  2013/04/22 17:51:11  dxa4481
 * RAAWAWWRRRRRR THIS WAS DONE YESTERDAY I'M JUST ADDING COMMENTS
 *
 */


import javax.swing.*;
import java.awt.*;
import java.util.Observable;


/*
 * this is a button that is defualted to white and contains the position it is located
 */
public class CardButton extends JButton{
	public int position;
	//does nothing
	public void main(String args[]){
		
	}
	//this defuatls color to white and sets the postion
	public CardButton(int pos){
		this.setBackground(Color.WHITE);
		position = pos;
	}
	//returns the position
	public int getPos(){
		return position;
	}
	
}
