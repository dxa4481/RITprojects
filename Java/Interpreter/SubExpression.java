
public class SubExpression implements Expression {

	/**
	 * SubExpression.java
	 *
	 * File:
	 *	$Id: SubExpression.java,v 1.1 2013/03/24 20:47:59 dxa4481 Exp $
	 *
	 * Revisions:
	 *	$Log: SubExpression.java,v $
	 *	Revision 1.1  2013/03/24 20:47:59  dxa4481
	 *	I AM COMMITING THIS
	 *
	 *
	 * @author Dylan Ayrey
	 */

	private Expression exp1;
	private Expression exp2;
	
	
	public SubExpression(Expression exp1, Expression exp2){
		/**Construcvtor, takes 2 expressions the left and right
		 * 
		* @param left and right expressions
		*/		
		this.exp1 = exp1;
		this.exp2= exp2;		
	}//endconstructor
	
	
	
	public String emit(){
		/**Generates code for a SuB expression.
		 * 
		* @param none
		* @return String
		*/		
		return ("(" + exp1.emit() + " - "+ exp2.emit() + ")");		
	}//endemit
	
	public Integer evaluate(){
		//
		/**Causes evaluation of an Sub expression.
		 * 
		* @param none
		* @return Integer
		*/		
		return exp1.evaluate()-exp2.evaluate();
	}//endevaluate
		
		
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
