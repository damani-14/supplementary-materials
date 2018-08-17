# program which calculates the cost per square inch of a circular pizza given its diameter and price

import math

def main():

    d = eval(input("Enter the diameter in inches: "))
    c = eval(input("Enter the cost of the pizza: "))
    r = int(d/2)

    a = math.pi * (r ** 2)

    ppa = a / c

    print("The area of the pizza is", a, "inches squared.")
    print("The cost per square inch is", ppa, "dollars.")

main()