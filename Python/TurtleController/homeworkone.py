"""
   Use turtle graphics to draw a homework controller thing.

   file: homeworkone.py
   author: Dylan Ayrey

"""

import turtle

def initialize():
    """Initialize the turtle so that it is facing North with the pen up."""
    turtle.up()
    turtle.left( 90 )

def drawBorder():
    """Draw a circle for the outline of the thingy. that is a circle of radius 100"""
    turtle.right( 90 )
    turtle.down()
    turtle.circle( 100 )
    turtle.up()
    turtle.left( 90 )

def drawTri():
    """Draw an equalatiral triangle that is 50 units long and 10 units forward. Returns to start position
    """
    turtle.forward( 10 )
    turtle.left( 30 )
    turtle.down()
    turtle.forward( 50 )
    turtle.right( 120 )
    turtle.forward( 50 )
    turtle.right( 120 )
    turtle.forward( 50 )
    turtle.left( 30 )
    turtle.up()
    turtle.forward( 10 )
    turtle.left( 180 )

def drawCenter():
    """Draw a circle that is centered in the center of the border and is raduis 20
    """
    turtle.forward(80)
    turtle.right( 90 )
    turtle.down()
    turtle.circle( 20 )
    turtle.up()
    turtle.right( 90 )
    turtle.forward( 80 )
    turtle.right( 180 )




def drawFace():
    """Draw the main controller"""
    drawBorder()
    drawTri()
    turtle.left(45)
    turtle.forward(141.42135623730950488016887242097)
    turtle.right(45+90)
    drawTri()
    turtle.left(45)
    turtle.forward(141.42135623730950488016887242097)
    turtle.right(45+90)
    drawTri()
    turtle.left(45)
    turtle.forward(141.42135623730950488016887242097)
    turtle.right(45+90)
    drawTri()
    turtle.left(45)
    turtle.forward(141.42135623730950488016887242097)
    turtle.right(45+90)
    drawCenter()


def main():
    """The program creates a picture canvas, draws a homework thingy, hides the turtle and
       waits for the user to respond before terminating.
    """
    initialize()
    drawFace()
    turtle.hideturtle()
    input( "Hit ENTER to finish the program." )
    turtle.bye()
	

main()
