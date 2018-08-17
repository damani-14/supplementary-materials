# CH05_03: Create a program that returns the letter grade for a numerical value
#-----------------------------------------------------------------------------------------------------------------------

def main():

    lettGrd = 60 * "F" + 10 * "D" + 10 * "C" + 10 * "B" + 11 * "A"
    numGrd = eval(input("Enter the numerical grade rounded to the nearest whole number: "))
    print(lettGrd[numGrd])

main()