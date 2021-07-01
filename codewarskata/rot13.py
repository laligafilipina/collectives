import codecs
def rot13(s):
    msg = codecs.encode(s, 'rot_13')
    return '%s' % (msg)
meg = ["test","Test"]
for i in meg:
    print(rot13(i))
