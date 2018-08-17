# bespoke algorithm for calculating the square root of n using the "guess-and-check" approach
# Newton's method of estimating the square root, where:
# sqrt = (guess + (x/guess))/2
# guess(init) = x/2


import math
def main():
    print("")
    print("This program will estimate the square root of a value 'x' using 'n'",end="\n")
    print("attempts to improve accuracy.",end="\n\n")
    x = eval(input("Please select a value to estimate the square root: "))
    n = eval(input("Please confirm the number of times to iterate: "))
    guess = x/2
    sr = 0
    print("")
    for i in range(1,n+1):
        sr = (guess + (x / guess)) / 2
        guess = sr
        print("Attempt ",i,":",sep="",end="\n")
        print("Guess = ",guess, sep="", end="\n")
        print("Square Root = ", math.sqrt(x), sep="", end="\n")
        print("Accuracy = ", (math.sqrt(x) - guess), sep="", end="\n\n")
        print("...",end="\n\n")
    print("END",end="\n\n")
main()