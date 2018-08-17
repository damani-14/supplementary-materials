# CH05_07: Write a program that can encode and decode Caesar ciphers given user provided input
#-----------------------------------------------------------------------------------------------------------------------

def main():

    message = input("Enter the message to be encoded: ")
    key = eval(input("Enter the key value: "))

    coded = ""

    for i in range(len(message)):
        char = chr((ord(message[i]) + key))
        coded = coded + char

    print(coded)

main()