# CH05_09: Write a program that counts the number of words in a sentence entered by the user
#-----------------------------------------------------------------------------------------------------------------------

def main():

    sentence = input("Enter a sentence for word count: ")

    sentNum = sentence.split()

    wordcount = 0

    for i in range(len(sentNum)):

        wordcount = wordcount + i

    print("The number of words is: ", wordcount)

main()