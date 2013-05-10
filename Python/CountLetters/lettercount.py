""" 
file: uniform_stairs.py
Problem: Stairs 
Author: Dylan Ayrey
Description: counts the amount of a given character in a text file, outputs lines containing that letter
"""


def countLetterString(char,string):
    """
    This function counts the number of times a char shows up in a string
    """
    count = 0
    for a in string:
        if a == char:
            count=count+1
    return count;



def countLetterFile(char,filename):
    """
    This function adds all the chars found in each line and also prints the lines that contain given chars
    """
    totalcount=0
    for line in open (filename):
        count=countLetterString(char,line)
        if count > 0:
            print line
            totalcount=totalcount+count
    print("Total count of", char,"is", totalcount)


def main():
    """
    the main function, asks for input filename and char to search for, then calls countletterfile
    """
    char=raw_input('Enter character: ');
    filename=raw_input('Enter filename: ');    
    countLetterFile(char,filename)

main()


"""
are we human OR ARE WE DANCER?!
"""
