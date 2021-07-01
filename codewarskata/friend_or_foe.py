def friend(x):
    ans = []
    for i in x:
        if len(i) == 4:
            ans.append(i)
    return ans

print(friend(["Ryan", "Kieran", "Mark", ]))
