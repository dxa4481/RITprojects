
public class IntExpression implements Expression{

	/**
	 * IntExpression.java
	 *
	 * File:
	 *	$Id: IntExpression.java,v 1.1 2013/03/24 20:47:59 dxa4481 Exp $
	 *
	 * Revisions:
	 *	$Log: IntExpression.java,v $
	 *	Revision 1.1  2013/03/24 20:47:59  dxa4481
	 *	I AM COMMITING THIS
	 *
	 *
	 *@author Dylan Ayrey
	 */
	private Integer blabla;

	
	public IntExpression(Integer blabla){
		/**Construcvtor, take an integer which is the value you are talking about
		 * 
		* @param Takes integer
		* 
		*/
		//
		this.blabla = blabla;
	
	}//endconstructor
	
	
	public String emit(){
		/**Generates code for an Int expression.
		 * 
		* @param none
		* @return string
		*/
		return "" + blabla;
	}//end emit
	
	public Integer evaluate(){
		/**Causes evaluation of an Int expression.
		 * 
		* @param none
		* @return integer
		*/
		return blabla;
	}//end evaluate
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
