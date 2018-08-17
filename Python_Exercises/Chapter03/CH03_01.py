# program to calculate the volume and surface area of a sphere, given its radius

import math

def main():

    r = eval(input("What is the radius of the sphere? "))

    v = 4/3 * math.pi * (r ** 3)
    a = 4 * math.pi * (r ** 2)

    print("The volume of the sphere is: ", v, end="\n")
    print("The area of the sphere is: ", a, end="\n")


main()