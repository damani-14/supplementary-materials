# program which calculates the slope of a line given x,y coordinates of two user provided points

import math

def main():
    print("")
    print("This program will calculate ths slope of a non-vertical line between two points.")

    print("")
    x1,y1 = eval(input("Enter the coordinates of POINT 1 separated by a comma: "))
    print("")
    x2,y2 = eval(input("Enter the coordinates of POINT 2 separated by a comma: "))
    print("")

    m = (y2 - y1)/(x2 - x1)

    print("The slope between the selected coordinates is: ", m)
    print("")

main()