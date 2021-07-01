def first_non_repeating_letter(string):
    low_str = []
    for i in string:
        low_str.append(i.lower())
    for i in string:
        if low_str.count(i.lower()) == 1:
            return i
    return ''

# Test Cases

print(first_non_repeating_letter('sTreSS'))
print(first_non_repeating_letter('stress'))
