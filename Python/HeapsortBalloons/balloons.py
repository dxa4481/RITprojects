""" 
file: balloons.py
Author: Dylan Ayrey
Description: pops balloons that expand in R3 once they touch. If there is
a balloon left over it will print that one.
"""

from array_heap import*
from copy import deepcopy

class Balloon(object):
    """
    This is the balloon object that has a name and a position in R3
    """
    __slots__=('name','x','y','z')
    def __init__(self, name, x, y, z):
        self.name=name
        self.x=x
        self.y=y
        self.z=z
    def __str__(self):
        return self.name
    
class Balloonpair(object):
    """
    Holds 2 balloon objects and their distance
    """
    __slots__=('balloons','distance')
    def __init__(self,balloons,dist):
        self.balloons=balloons
        self.distance=dist
def getlist(balloonlist,word,boolean,balloontext):
    for line in balloontext:
        if boolean:
            boolean=False
        else:
            count=0
            for char in line:
                word=word+char
                if char == ' ':
                    if count==0:
                        name=word
                    elif count==1:
                        x=word
                    else:
                        y=word
                    word=''
                    count+=1
            name.replace(' ','')
            x.replace(' ','')
            y.replace(' ','')
            
            balloonlist.append(Balloon(name,int(x),int(y),int(word)))
            word=''
    
    return balloonlist

def getdict(pairdict,balloonlist,heap):
    """
    This function takes in an empty dictionary, a list of balloons and a heap, and returns a dictionary of balloons with their distances as the value
    """
    for balloon in balloonlist:
        for secondballoon in balloonlist:
            dist=pow((pow(balloon.x-secondballoon.x,2)+pow(balloon.y-secondballoon.y,2)+pow(balloon.z-secondballoon.z,2)),.5)
            if dist in pairdict:
                torf=True
                for sublist in pairdict[dist]:
                    if balloon in sublist:
                        if secondballoon not in sublist:
                            sublist.append(secondballoon)
                            torf=False
                            break
                    elif secondballoon in sublist:
                        if balloon not in sublist:
                            sublist.append(balloon)
                            torf=False
                            break
                if torf:
                    pairdict[dist].append([balloon,secondballoon])
            elif dist!=0:
                pairdict[dist]=[[balloon,secondballoon]]
                add(heap,dist)
    return pairdict
def getpopped(popped,pairdict,heap):
    """
    Takes an empty list, a dictionary and a heap, returns a list of balloon objects that should be popped
    """
    distance=removeMin(heap)
    while distance!=None:
        thingstoremove=[]
        for sublist in pairdict[distance]:
            for balloon in sublist:
                if balloon in popped:
                    thingstoremove.append(balloon)
        for sublist in pairdict[distance]:
            for balloon in thingstoremove:
                if balloon in sublist:
                    sublist.remove(balloon)
        for sublist in pairdict[distance]:
            if len(sublist)>1:
                for balloon in sublist:
                    if balloon not in popped:
                        popped.append(balloon)
        distance=removeMin(heap)
    return popped
def main():
    """
    This is the main function that imploments the heap sort, it gets the popped balloons and then pops them
    """
    balloontext=open(input('What is the filename?:'))
    boolean=True
    for firstline in balloontext:
        heap=Heap(int(firstline),less)
        break
    balloonlist=getlist([],'',True,balloontext)

    pairdict=getdict({},balloonlist,heap)
    popped=getpopped([],pairdict,heap)
    for balloon in popped:
        print(balloon)
        balloonlist.remove(balloon)
    if balloonlist==[]:
        print('there is no last ballon, they all popped')
    else:
        print('The last balloon is')
        print(balloonlist[0])

main()
        
