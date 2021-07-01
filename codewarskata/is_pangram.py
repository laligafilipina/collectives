import string   
def is_pangram(str): 
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    for char in alphabet: 
        if char not in str.lower(): 
            return False
    return True
      
string = 'the quick brown fox jumps over the lazy dog'
if(is_pangram(string) == True): 
    print("Yes") 
else: 
    print("No") 
