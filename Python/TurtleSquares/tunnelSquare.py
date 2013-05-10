"""
   Use turtle graphics to draw squares with loops and squares with recursion

   file: tunnelSquare.py
   author: Dylan Ayrey

"""

import turtle

def init():
    """Initialize the turtle so that it is facing North with the pen up."""
    turtle.up()
    turtle.left( 90 )
    turtle.hideturtle()

def drawSquareFromCenter(size):
    """Draw a square centered at where the turtle starts with a length of size"""
    turtle.forward(size/2)
    turtle.right(90)
    turtle.down()
    turtle.forward(size/2)
    turtle.right(90)
    turtle.forward(size)
    turtle.right(90)
    turtle.forward(size)
    turtle.right(90)
    turtle.forward(size)
    turtle.right(90)
    turtle.forward(size/2)
    turtle.left(90)
    turtle.up()
    turtle.forward(-size/2)
    

def tunnelItSquare(size,squarefactor):
    """uses a while loop to draw smaller and smaller squares
    """
    size
    while (size>5):
        drawSquareFromCenter(size)    
        size=size*squarefactor/100

def tunnelRecSquare(size,squarefactor):
    """Uses recursion to draw smaller and smaller squares
    """
    if size <= 5:
        pass
    else:     
        drawSquareFromCenter(size)
        tunnelRecSquare(size*squarefactor/100,squarefactor)





def main():
    """The program creates a picture canvas, moves left and calls tunnelitsquare moves right and calls tunnelrecsquare then waits for user to hit enter
    """

    squarefactor = int( input( "Enter square factor' (a non-negative integer): " ) )
    if segments < 0:
        print( 'Sorry. That integer was not non-negative.' )
        exit()

    size = int( input( "Enter 'size' (a positive integer): " ) )
    init()
    turtle.left(90)
    turtle.forward(size)
    turtle.right(90)
    tunnelItSquare(size,100-squarefactor)
    turtle.right(90)
    turtle.forward(size*2)
    turtle.left(90)
    tunnelRecSquare(size,100-squarefactor)
    input( "Hit ENTER to finish the program." )
    turtle.bye()
	

main()
