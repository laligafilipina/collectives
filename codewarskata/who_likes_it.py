def likes(names):
    string_return = "must be "

    if len(names) == 0:
        string_return = "must be no one likes this"
    elif len(names) == 1:
        string_return = str(names[0]) + " likes this"
    elif len(names) > 1 and len(names) < 4:
        for name in range(0, len(names) < 4):
            string_return = string_return + names[name] + ','
        string_return = string_return[:]#[:-2]
        string_return = string_return + ' and ' + str(names) + ' likes this'
    else:
        for name in range(0,2):
            string_return = string_return + names[name] + ','
        string_return = string_return #[:-2]
        string_return = string_return + ' and ' + str(names) + ' others likes this'
    return string_return
users = ['','Jacob','Peter','Alex','Max','John']
for i in users:
    print(likes(i))
