# program to calculate the order costs for the "Konditorei Coffee Shop"
# cost = 10.50/lb + shipping
# shipping = 0.86/lb + 1.50 fixed overhead cost

import math

def main():

    print("")
    print("This program will calculate the total cost (10.50/lb) for your coffee plus shipping (0.86/lb + 1.50 fixed).")
    print("")
    wt = eval(input("Enter the quantity of coffee you would like to order in pounds: "))
    print("")

    cost = wt * 11.36 + 1.5

    print("The total cost of your order + shipping is $", cost)
    print("")

main()