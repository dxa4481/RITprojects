""" 
circles.py draws a bunch of mickey mouses

assignment: homework2
language: python3
author: Dylan Ayrey
"""

import turtle

# function definitions

def initWorld( size ):
    """
    initWorld initializes the drawing by establishing its pre-conditions.

    size -- PosNumber;
            length of tree trunk to draw should be positive.

    pre-conditions: 
    post-conditions: coordinate system
                       is (-2*|size|,-2*|size|) at lower-left
                       to (2*|size|, 2*|size|) at upper-right.
                     turtle is at origin,
                     turtle is facing North,
                     turtle is pen-down.
    """
    margin = 2   # provides canvas boundary
    turtle.setup( 600, 600 )
    turtle.setworldcoordinates( -2*abs(size) - margin, -2*abs(size) - margin,
                                2*abs(size) + margin, 2*abs(size) + margin )
    turtle.home()  # turtle is at origin, facing east, pen-down
    turtle.left( 90 )  # turtle is facing North
    turtle.down()  # turtle is pen-down
    turtle.pensize( 2 )





def drawTree( segments, size ):
    """
    drawTree recursively draws the tree.

    segments -- NonNegInteger;
                number of circle segments from the base circle
                the end of any circle should be integral and non-negative.
    size -- PosNumber;
            length of raduis of circle

    pre-conditions: segments >= 0, size > 0.
                    turtle is at base of circle,
                    turtle is facing along circle,
                    turtle is pen-down.
    post-conditions: a segments-level tree was drawn on the canvas,
                     turtle is at base of circle,
                     turtle is facing along trunk of circle,
                     turtle is pen-down.
    """
    if segments == 0:
        # base case: draw nothing
        pass
    elif segments > 0:
        # recursive case: draw trunk and two sub-trees
        turtle.right(90)
        turtle.circle(size)
        turtle.left(90)
        turtle.up()
        turtle.forward(size)
        turtle.left(45)
        turtle.forward(size/2)
        turtle.down()
        drawTree( segments - 1, size / 2 )
        turtle.up()
        turtle.forward(-size/2)
        turtle.right(90)
        turtle.forward(size/2)
        turtle.down()
        drawTree( segments - 1, size / 2 )
        turtle.up()
        turtle.forward(-size/2)
        turtle.left(45)
        turtle.forward(-size)
        turtle.down()


def initWorldAndDrawTree( segments, size, message="" ):
    """
    initWorldAndDrawTree prints a message, initializes the world,
    draws an instance of the recursive tree, and waits for ENTER.

    segments -- NonNegInteger;
                number of line segments from the base of the circle to
                the end of any circle should be integral and non-negative.
    size -- PosNumber;
            length of circle to draw should be (strictly) positive.
    message -- String;
               message to display
    """
    print( "Drawing recursive tree with", (segments, size), ";", message )
    initWorld( size )
    #turtle.speed('fastest')
    drawTree( segments, size )
    #turtle.hideturtle()
    turtle.update()
    input( "Hit ENTER to quit." )
    turtle.bye()




def promptAndDrawTree():
    """
    promptAndDrawTree prompts for number of line segments from the
    base of the circle to the end of any branch and length of circle
    and draws an instance of the recursive circle.
    """
    segments = int( input( "Enter 'segments' (a non-negative integer): " ) )

    if segments < 0:
        print( 'Sorry. That integer was not non-negative.' )
        exit()

    size = int( input( "Enter 'size' (a positive integer): " ) )

    # if size <= 0:
    #     print( 'Sorry. That integer was not positive.' )
    #     exit()

    initWorldAndDrawTree( segments, size )


# script execution/run

if __name__ == "__main__":
    promptAndDrawTree()
