
public class Parse {

	/**
	 * Parse.java
	 *
	 * File:
	 *	$Id: Parse.java,v 1.1 2013/03/24 20:47:59 dxa4481 Exp $
	 *
	 * Revisions:
	 *	$Log: Parse.java,v $
	 *	Revision 1.1  2013/03/24 20:47:59  dxa4481
	 *	I AM COMMITING THIS
	 *
	 *
	 *@author Dylan Ayrey
	 */
	
	public Parse(){
		/**THIS DOES NOTHING
		 * 
		* @param WHY DOES THIS NEED TO BE HERE
		* @return DO YOU EVEN READ THIS??
		*/	
	}//end constructuor
	public static Expression parseString(String s){
		/**Parse a prefix expression.
		 * 
		* @param takes a string
		* @return returns an expression
		*/	
		String[] expressions = s.split(" ");
		switch(expressions[0])
		{
		case "+":
			return new AddExpression(parseString2(s,1),parseString2(s,2));
		case "-":
			return new SubExpression(parseString2(s,1),parseString2(s,2));
		case "*":
			return new MulExpression(parseString2(s,1),parseString2(s,2));
		default:
			return new IntExpression(Integer.parseInt(expressions[0]));
		}//endswitch
	}//endexpression
	
	private static Expression parseString2(String s, int i){
		/**Parse a prefix expression. for the recurssion i made another method
		 * 
		* @param takes a string
		* @return returns an expression
		*/	

		String[] expressions = s.split(" ");
		switch(expressions[i])
		{		
		case "+":
			return new AddExpression(parseString2(s,i+1),parseString2(s,i+2));
		case "-":
			return new SubExpression(parseString2(s,i+1),parseString2(s,i+2));
		case "*":
			return new MulExpression(parseString2(s,i+1),parseString2(s,i+2));
		default:
			return new IntExpression(Integer.parseInt(expressions[i]));		
		
		}//endswitch
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
