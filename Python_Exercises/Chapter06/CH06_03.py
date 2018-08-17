# CH06_03: Write definitions for the following functions:
#          sphereArea(radius) Returns the surface area of a sphere having the given radius.
#          sphereVolume(radius) Returns the volume of a sphere having the given radius.
#----------------------------------------------------------------------------------------------------------------------

import math

def sphereArea(radius):

    area = 4 * math.pi * (radius ** 2)
    return area

def sphereVolume(radius):

    volume = 4 / 3 * math.pi * (radius ** 3)
    return volume

def main():

    rad = eval(input("Enter the radius of the sphere: "))
    a = sphereArea(rad)
    v = sphereVolume(rad)
    print("The surface area of the sphere is {0:0.02f}\n"
          "and the volume is {1:0.2f}.\n".format(a, v))

main()