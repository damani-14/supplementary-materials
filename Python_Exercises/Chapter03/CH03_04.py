# a program to determine the distance to a lightning strike based on the time elapsed
# between the flash and the sound of thunder

# speed of sound = 1100 feet/second
# 1 mile = 5280 feet
# speed of sound = 0.2083 miles per second

import math

def main():

    print("")
    print("This program calculates the distance from a lightning strike")
    print("based on the time elapsed between the flash and sound of thunder")
    print("")
    r = 0.2083
    t = eval(input("Enter the time elapsed in seconds: "))
    d = r * t

    print("The distance is: ", d, "miles.")
    print("")

main()