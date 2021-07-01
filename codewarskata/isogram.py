def is_isogram(s):
    string = s.lower()
    if len(s) == len(set(string)):
        return True
    return False

isogram = ['Dermatoglyphics','aba','moOse']
for i in isogram:
    print(is_isogram(i))
