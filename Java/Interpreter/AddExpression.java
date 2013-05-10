
public class AddExpression implements Expression{

	/**
	 * AddExpression.java
	 *
	 * File:
	 *	$Id: AddExpression.java,v 1.1 2013/03/24 20:47:58 dxa4481 Exp $
	 *
	 * Revisions:
	 *	$Log: AddExpression.java,v $
	 *	Revision 1.1  2013/03/24 20:47:58  dxa4481
	 *	I AM COMMITING THIS
	 *
	 *@author Dylan Ayrey
	 */
	
	private Expression exp1;
	private Expression exp2;
	
	
	public AddExpression(Expression exp1, Expression exp2){
		/**Construcvtor, takes 2 expressions the left and right
		 * @param takes 2 expressions the left and right
		 * 
		 */
		
		this.exp1 = exp1;
		this.exp2= exp2;
	}//endconstructor
	
	
	public String emit(){
		
		/**Generates code for an Add expression
		 * 
		* @param none
		* @return string
		*/
		return ("(" + exp1.emit() + " + "+ exp2.emit() + ")");
	}//endemit
	
	public Integer evaluate(){
		/**Causes evaluation of an Add expression.
		 * 
		* @param none
		* @return Intenger
		*/
		return exp1.evaluate()+exp2.evaluate();
	}//endevaluate
		
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
