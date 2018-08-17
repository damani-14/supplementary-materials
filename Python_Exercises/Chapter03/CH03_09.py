# program to calculate the area of a triangle
# given the length of its 3 sides a, b, and c
# using the following formulas

#   s = a+b+c/2
#   A = sqrt(s(s-a)(s-b)(s-c)

import math

def main():

    print("")
    print("This program will calculate the area of a triangle")
    print("given the length of its three sides.")
    print("")

    a,b,c = eval(input("Enter the lengths of each side separated by commas: "))
    print("")

    s = (a + b + c)/2
    A = math.sqrt(s*(s-a)*(s-b)*(s-c))

    print("")
    print("The area of the triangle is: ", A)
    print("")

main()