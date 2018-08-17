# program to calculate the Fibonacci sequence of length n

import math

def main():

    print("")
    n = eval(input("Enter the Fibonacci number for sequence of length n: "))
    print("")

    a,b = 1,1

    for i in range(n-1):

        a,b = b, a+b

    print("The Fibonacci number for sequence length ", n, " is: ", a, sep="", end="\n")

main()