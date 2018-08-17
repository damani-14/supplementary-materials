# program to sum a series of numbers provided by the user

import math

def main():

    print("")
    print("This program will find the sum of n values")
    print("")
    n = eval(input("Enter the number of values to be summed: "))
    x = 0
    print("")

    for i in range(n):
        v = eval(input("Enter value: "))
        x = x + v

    print("")
    print("")
    print("The sum of the ", n, "values is: ", x)
    print("")

main()