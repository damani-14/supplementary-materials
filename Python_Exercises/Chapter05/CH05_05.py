# CH05_05: Create a program to sum the numerical value of a name given that a = 1 and z = 26
#-----------------------------------------------------------------------------------------------------------------------

def main():

    namein = input("Enter the name to be summed: ")

    name = namein.lower()
    numsum = 0

    for i in range(len(name)):

        numsum = numsum + (ord(name[i])-96)

    print("The numeric value for ",namein," is: ",numsum)

main()