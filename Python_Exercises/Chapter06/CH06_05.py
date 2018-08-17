# CH06_05: Define two functions (one to calculate the area of a pizza, and one to compute the cost per square inch
#          Create a program to execute both.
#----------------------------------------------------------------------------------------------------------------------

import math

def pizArea(radius):
    area = math.pi * (radius ** 2)
    return area

def pizCost(cost, area):
    cpa = cost / area
    return cpa

def main():
    diameter = eval(input("Enter the diameter in inches: "))
    cost = eval(input("Enter the cost of the pizza: "))
    area = pizArea(int(diameter/2))
    cpa = pizCost(cost, area)
    print("The area of the pizza is",round(area,2),"inches squared.", sep=" ")
    print("The cost per square inch is $",round(cpa,2),".\n", sep="")

main()