""" 
file: hashlab.py
language: python3


description: This has functions that add to a hash table via chaining. It uses it's own hash function
"""




class HashTable( object ):
    """
       The HashTable data structure contains a collection of values
       where each value is located by a hashable key.
       No two values may have the same key, but more than one
       key may have the same value.
    """

    __slots__ = ( "table", "size" )

    def __init__( self, capacity=100 ):
        """
           Create a hash table.
           The capacity parameter determines its initial size.
        """
        self.table=[]
        for i in range(capacity):
            self.table.append([])
        self.size = 0

    def __str__( self ):
        """
           Return the entire contents of this hash table,
           one chain of entries per line.
        """
        result = ""
        for i in range( len( self.table ) ):
            result += str( i ) + ": "
            result += str( self.table[i] ) + "\n"
        return result

    class _Entry( object ):
        """
           A nested class used to hold key/value pairs.
        """

        __slots__ = ( "key", "value" )

        def __init__( self, entryKey, entryValue ):
            self.key = entryKey
            self.value = entryValue

        def __str__( self ):
            return "(" + str( self.key ) + ", " + str( self.value ) + ")"

def hash_function( val, n ):
    """
       Compute a hash of the val string that is in [0 ... n).
    """
    hashcode=0
    count=1
    for bla in val:
        hashcode+=(ord(bla)%10)*count
        count=count*10
    hashcode = hashcode % n
    return hashcode

def imbalance(hTable):
    """
    this is a measurment of the quality of the hashing based on the number of collisions
    """
    count=0
    numoflists=0
    for table in hTable.table:
        if len(table)>0:
            numoflists+=1
            count+=len(table)
    avg=count/numoflists
    return avg-1


def keys( hTable ):
    """
       Return a list of keys in the given
       .
    """
    result = []
    for entry in hTable.table:
        for subentry in entry:
            result.append( subentry.key )
    return result

def contains( hTable, key ):
    """
       Return True iff hTable has an entry with the given key.
    """
    index = hash_function( key, len( hTable.table ) )
    counter=0
    while  counter != len(hTable.table[index]):
        if hTable.table[index][counter].key==key:
            return True
        counter+=1
    return False

def put( hTable, key, value ):
    """
       Using the given hash table, set the given key to the
       given value. If the key already exists, the given value
       will replace the previous one already in the table.
       If the table is full, an Exception is raised.
    """


    allkeys=keys(hTable)
    if .75<len(allkeys)/len(hTable.table):
        newtable=HashTable(hTable.size*2+1)
        for thiskey in allkeys:
            put(newtable,thiskey,get(hTable,thiskey))
        hTable=newtable            
    index = hash_function( key, len( hTable.table ) )
    entry =HashTable._Entry( key, value )
    boolean=False
    for i in range(len(hTable.table[ index ])):
        if hTable.table[index][i].key==key:
            hTable.table[ index ][i]=entry
            boolean=True
            return True
    if boolean==False:
        hTable.table[ index ].append (entry)
    return True

def get( hTable, key ):
    """
       Return the value associated with the given key in
       the given hash table.
       Precondition: contains(hTable, key)
    """
    index = hash_function( key, len( hTable.table ) )
    counter=0
    while  counter != len(hTable.table[index]):
        if hTable.table[index][counter].key==key:
            return hTable.table[ index ][counter].value
        counter+=1
    raise Exception( "Hash table does not contain key." )
    
