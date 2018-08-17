# a program to find the average of a series of numbers entered by the user

import math

def main():

    print("")
    print("This program will find the average of n values")
    print("")
    n = eval(input("Enter the number of values to be averaged: "))
    x = 0
    print("")

    for i in range(n):
        v = eval(input("Enter value: "))
        x = x + v

    avg = x//n
    print("")
    print("")
    print("The average of the ", n, "values is: ", avg)
    print("")

main()