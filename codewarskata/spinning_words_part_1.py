def spin_words(sentence):
    count=" "
    words = sentence.split()
    if len(words) == 1:
        for word in words:
            if len(word) >= 5:
                plus_five = word [:: -1] + " "
                count += plus_five
            elif len(word) < 5:
                less_than_five = word + " "
                count += less_than_five
            return count[:-1]

        else:
            for word in words:
                if len(word) >= 5:
                    plus_five = word[::-1]
                    count += plus_five
                elif len(word) < 5:
                    less_than_five = word + " "
                    count += less_than_five
            return count[: -1]
