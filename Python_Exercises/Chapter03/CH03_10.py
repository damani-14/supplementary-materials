# program to calculate the length of a ladder required to reach a height when leaned against a house
# given the height of the house and the angle of the ladder

#   length = height/sin(angle)
# NOTE: the angle must be in radians
#   radians = pi/180*degrees

import math

def main():

    print("")
    print("This program will calculate the length of a ladder given user provided information.")
    print("")

    angle = eval(input("Enter the angle of the ladder in degrees: "))
    rad = (math.pi/180)*angle

    print("")
    height = eval(input("Enter the height of the house: "))
    length = height/math.sin(rad)

    print("")
    print("The length of the ladder is: ", length)
    print("")


main()