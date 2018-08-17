# a program to approximate the value of pi by summing the terms of the following series:
# 4/1 - 4/3 + 4/5 - 4/7 + 4/9 - 4/11 + ...
# for series of length n provided by the user
# subtract the final approximation from the value of math.pi to determine program accuracy

import math

def main():

    print("\n", "****************", "\n", "PI APPROXIMATION", "\n", "****************", sep="", end="\n\n")
    print("This program gives an approximation of pi")
    print("using the sum of the first n terms of the series:")
    print("(4/n-n+1 - 4/n-n+3) + ... + (4/n-3 - 4/n).", end="\n")
    print("...")

    n = eval(input("Enter a value for n: "))

    print("\n", "...", sep="", end="\n\n")

    appx = 0

    for i in range(1, n, 2):
        ser = 4/i - 4/(i+2)
        appx = appx + ser

    diff = math.pi - appx

    print("The approximation of the first ")
    print("n terms of the series is: ", appx,".", sep="", end="\n\n")
    print("This approximation is", "\n", "+/- ", abs(diff), "\n", "of pi (", math.pi,").", sep="", end="\n\n")
    print("END", end="\n\n")

main()

