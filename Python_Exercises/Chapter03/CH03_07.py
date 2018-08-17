# program to calculate the distance between two user provided points

import math

def main():

    print("")
    print("This program will calculate the distance between two two points.")
    print("")

    x1,y1 = eval(input("Enter the coordinates of POINT 1: "))
    print("")
    x2,y2 = eval(input("Enter the coordinates of POINT 2: "))
    print("")

    d = math.sqrt(((x2 -x1)**2)+((y2-y1)**2))

    print("")
    print("The distance between POINT 1 and POINT 2 is: ", d)
    print("")

main()