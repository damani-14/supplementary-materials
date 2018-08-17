# program to determine the molecular weight of a hydrocarbon given user provided C, H and O inputs

import math

def main():

    print("")
    print("")
    print("")

    print("For the given hydrocarbon, enter the number of each")

    print("associated Carbon, Hydrogen, and Oxygen atom.")

    print("")

    c = eval(input("Number of Carbon atoms: "))
    h = eval(input("Number of Hydrogen atoms: "))
    o = eval(input("Number of Oxygen atoms: "))

    wt = (12.011 * c) + (1.0079 * h) + (15.9994 * o)

    print("")
    print("")

    print("The total molecular weight is", wt, end="\n")

    print("")
    print("")

main()