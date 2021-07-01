def spin_words(sentence):
    words=sentence.split(" ")
    if len(words) == 1:
        newWords = [word[::-1] for word in words]
        newSentence = " ".join(newWords)
        return newSentence
    else:
        words = sentence.split(" ")
        newWords = [word[::-1] for word in words]
        newSentence = " ".join(newWords)
        sentence=newSentence.split(" ")
        for letters in sentence:
            if len(letters) < 5:
                new_letter=letters[::-1]
                sentence=' '.join(sentence)
                return sentence.replace(letters, new_letter)

message = "to"
print(spin_words(message))
