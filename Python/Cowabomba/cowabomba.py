"""
Name: Dylan Ayrey
Lab: Lab 1 cows and stuff, this takes in a text file that contains
the location of cows and bombs and blast radius for those bombs.
It tells who what bomb painted what cow and what cows if any remain
Section: B section, ICS lab 1


"""


class bomb():
"""
This class is for a bomb, it has a position a blast radius and neighbors
"""
    __slots__=('name','neighbors','x','y','radius')
    
    def __init__(self,name,neighbors,x,y,radius):
        self.name=name
        self.neighbors=[]
        self.radius=radius
        self.x=x
        self.y=y
        
class nobomb():
"""
This class is for a no bomb, it only has a name
"""
    __slots__=('name')
    
    def __init__(self,name):
        self.name=name

           
class cow():
"""
This class is for a cow, it has a positon and neighbors
"""   
    __slots__=('name','neighbors','x','y')
    
    def __init__(self,name,neighbors,x,y):
        self.name=name
        self.neighbors=[]
        self.x=x
        self.y=y
        
class biggestbomb():
"""
This class is for the biggest bomb, it contains the number of cows it can paint and a bomb object
""" 
    __slots__=('bomb','numofcows')

    def __init__(self,bomb,numofcows):
        self.bomb=bomb
        self.numofcows=numofcows
   
    
def main():
    """
This just calls the other functions, counts how many cows each thingy sets off
and prints which bomb is first triggered along with the winning bomb
"""
    fakebomb=nobomb('absence of a bomb')
    bigbomb=biggestbomb(fakebomb,0)
    file=input('Please enter a file name:')
    graph=createneighbors(loadgraph(file))    

    for node in graph:
        if isinstance(node,bomb):
            print("Triggering "+node.name+" bomb...")
            visitedlist=visitDFS(node,[node])
            count=0
            for iscow in visitedlist:
                if isinstance(iscow, cow):
                    count=count+1
            if count > bigbomb.numofcows:
                bigbomb=biggestbomb(node,count)
    print("Triggering the "+bigbomb.bomb.name+" bomb paints the largest number of cows: "+str(bigbomb.numofcows))

            
            
def visitDFS(  node, visited ):
    """
     visitDFS : Node ListOfNode -> None
     visitDFS visits all the neighbors of node in a depth-first fashion.
     effect: visited list grows as function recurses.
    "    """    
    for neighbor in node.neighbors:
        if not neighbor in visited:
            if isinstance(neighbor,cow):
                print(node.name+' bomb paints '+neighbor.name)
            else:                
                print(node.name+' bomb sets off '+neighbor.name+' bomb')
            visited.append(  neighbor )
            visitDFS(  neighbor, visited )
    return visited
    
def createneighbors(graph):
    """
calculates neighbors based on distance formula
"""
    for node in graph:
        for node2 in graph:
            if node == node2:
                pass
            elif isinstance(node,bomb):
                if float(node.radius)>=pow(pow((float(node.x)-float(node2.x)),2)+pow((float(node.y)-float(node2.y)),2),0.5):
                    node.neighbors.append(node2)
    return graph
    
    
    
def loadgraph(filename):

    """
this like, makes the node thingys without a neighbor list though
"""
    graph=[]
    for line in open( filename ):
        classlist=line.split()
        if classlist[0]=='cow':
            n1=cow(classlist[1],[],classlist[2],classlist[3])
            graph.append(n1)
        else:
            n1=bomb(classlist[1],[],classlist[2],classlist[3],classlist[4])
            graph.append(n1)
    return graph
            
main()
