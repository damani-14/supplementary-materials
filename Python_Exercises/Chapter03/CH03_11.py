# a program to find the sum of the first n natural numbers where the value of n is provided by the user

import math

def main():

    print("")
    print("This program will find the sum of the first n natural numbers given user")
    print("provided input for n")
    print("")

    n = eval(input("Please enter a value for n : "))
    tot = 0

    for i in range(n + 1):
        tot = tot + i

    print(tot)

main()