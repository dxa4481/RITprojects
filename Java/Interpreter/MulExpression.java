
public class MulExpression implements Expression{

	/**
	 * MulExpression.java
	 *
	 * File:
	 *	$Id: MulExpression.java,v 1.1 2013/03/24 20:47:58 dxa4481 Exp $
	 *
	 * Revisions:
	 *	$Log: MulExpression.java,v $
	 *	Revision 1.1  2013/03/24 20:47:58  dxa4481
	 *	I AM COMMITING THIS
	 *
	 *
	 *@author Dylan Ayrey
	 */
	
	private Expression exp1;
	private Expression exp2;
	
	
	public MulExpression(Expression exp1, Expression exp2){
		/**Construcvtor, takes 2 expressions the left and right
		 * 
		* @param left and right expressions
		*/		
		this.exp1 = exp1;
		this.exp2= exp2;		
	}//endconstructor
	
	public String emit(){
		/**Generates code for a Mul expression.
		 * 
		* @param none
		* @return integer
		*/		
		return ("(" + exp1.emit() + " * "+ exp2.emit() + ")");
	}//endemit
	
	public Integer evaluate(){
		/**Causes evaluation of an Mul expression.
		 * 
		* @param none
		* @return integer
		*/
		return exp1.evaluate()*exp2.evaluate();
	}//endevaluate
		
		
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
