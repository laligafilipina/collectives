def duplicate_encode(word):
    return (lambda w: ''.join(('(', ')')[c in w[:i] + w[i+1:]] for i, c in enumerate(w)))(word.lower())

strings = ['din','recede','Success','(( @']
for encoder in strings:
    print(duplicate_encode(encoder))
