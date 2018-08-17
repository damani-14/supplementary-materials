# The Gregorian epact is the number of days between January 1st and the previous new moon
# Used to calculate the date of Easter
# Using integer arithmetic:
#   C = year//100
#   epact = (8 + (C//4) - C + ((8C + 13)//25) + 11(year%19))%30

import math

def main():

    print("")
    print("This program will calculate the Gregorian epact given a user provided year.")
    print("")
    year = eval(input("Enter the four digit year: "))
    C = year//100
    epact = (8 + (C // 4) - C + ((8*C + 13) // 25) + 11*(year % 19)) % 30
    print("")
    print("The Gregorian epact is: ", epact)
    print("")

main()