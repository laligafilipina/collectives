def descending_order(num):
    data = sorted([i for i in str(num)], reverse=True)
    joined = int("".join(data))
    return '\n Input: %s Output: %s' % (num, joined)

integer = ['42145','145263','123456789', '1201']
for i in integer:
    print(descending_order(i))

