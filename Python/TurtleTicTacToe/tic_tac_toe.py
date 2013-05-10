"""
   Use turtle graphics to draw a lab TicTacToe board and plays a game.

   file: Tic_Tac_Toe.py
   author: Dylan Ayrey

"""

import turtle

def initialize():
    """Initialize the turtle so that it is facing North with the pen up."""
    turtle.up()
    turtle.left( 90 )

def drawBorder():
    """Draw 2 parallel lines and then 2 more at 90 degrees to the first 2"""
    turtle.right( 90 )
    turtle.forward( 50 )
    turtle.down()
    turtle.left(90)
    turtle.forward(300)
    turtle.up()
    turtle.left(90)
    turtle.forward(100)
    turtle.left(90)
    turtle.down()
    turtle.forward(300)
    turtle.up()
    turtle.right(90+45)
    turtle.forward(141.421356237)
    turtle.right(90+45)
    turtle.down()
    turtle.forward(300)
    turtle.up()
    turtle.left(90)
    turtle.forward(100)
    turtle.left(90)
    turtle.down()
    turtle.forward(300)
    turtle.up()
    turtle.right(180+53.1301024)
    turtle.forward(250)
    turtle.left(53.1301024+90)
    

def drawX():
    """Draws an X 
    """
    turtle.forward( 10 )
    turtle.left( 90 )
    turtle.forward(40)
    turtle.right( 90+45 )
    turtle.down()
    turtle.forward( 113.13708499 )
    turtle.up()
    turtle.left( 45+90 )
    turtle.forward( 80 )
    turtle.left( 90+45 )
    turtle.down()
    turtle.forward( 113.13708499 )
    turtle.up()
    turtle.right( 90-14.0362435+45 )
    turtle.forward(41.2310562562)
    turtle.right(14.0362435+90)

def drawO():
    """Draws an O
    """
    turtle.forward(10)
    turtle.right(90)
    turtle.down()
    turtle.circle(40)
    turtle.up()
    turtle.right(90)
    turtle.forward(10)
    turtle.left(180)




def drawFace():
    """Moves from one grid space to another and calls each O or X"""
    drawBorder()
    drawX()
    turtle.right(90)
    turtle.forward(100)
    turtle.left(90)
    drawO()
    turtle.left(90)
    turtle.forward(100)
    turtle.right(90)
    turtle.left(90)
    turtle.forward(100)
    turtle.right(90)
    drawX()
    turtle.right(90)
    turtle.forward(100)
    turtle.left(90)
    turtle.forward(200)
    turtle.left(90)
    turtle.forward(100)
    turtle.right(90)
    drawO()
    turtle.right(90)
    turtle.forward(100)
    turtle.right(90)
    turtle.forward(200)
    turtle.left(180)
    turtle.forward(100)
    drawX()
    turtle.left(180)
    turtle.forward(100)
    turtle.left(180)
    turtle.forward(100)
    turtle.right(90)
    turtle.forward(100)
    turtle.left(90)
    drawO()
    turtle.left(90)
    turtle.forward(100)
    turtle.left(90)
    turtle.forward(100)
    turtle.left(180)
    turtle.forward(200)
    drawX()
    turtle.left(180)
    turtle.forward(200)
    turtle.left(180)


def main():
    """The program creates a picture canvas, draws a tiktaktoeboard with the Xs and Os, hides the turtle and
       waits for the user to respond before terminating.
    """
    initialize()
    drawFace()
    turtle.hideturtle()
    input( "Hit ENTER to finish the program." )
    turtle.bye()
	

main()
