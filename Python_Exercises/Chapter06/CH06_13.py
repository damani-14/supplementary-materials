# CH06_13: Write and test a function to meet this specification:
#          toNumbers(strList)
#          where strList is a list of strings, each of which represents
#          a number. Modifies each entry in the list by converting it to a number
#          using Unicode encoding.
#----------------------------------------------------------------------------------------------------------------------

def toNumbers(strList):

    for i in range(len(strList)):
        string = strList[i].lower()
        runsum = 0

        for j in range(len(string)):
            runsum = runsum + (ord(string[j]))

        strList[i] = runsum

    return strList

def main():

    strList = []
    n = eval(input("Enter the number of strings in your list: "))

    for i in range(n):
        string = (input("Enter string: "))
        strList.append(string)

    toNumbers(strList)
    print(strList)

main()