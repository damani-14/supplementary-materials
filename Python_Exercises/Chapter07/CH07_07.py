# CH07_07: A baby sitter charges $2.50/hr until 9 pm and $1.75/hr after. Write a program that accepts a starting and
#          ending time in hours and minutes then calculates the total bill.
#          Partial hours are appropriately prorated
#-----------------------------------------------------------------------------------------------------------------------

import math

def main():

    start = (input("Enter the starting time using 24:00 hour notation: "))
    finish = (input("Enter the finishing time using 24:00 hour notation: "))
    Shrs, Smins = start.split(":")
    Fhrs, Fmins = finish.split(":")
    Shrs, Smins, Fhrs, Fmins = float(Shrs), float(Smins), float(Fhrs), float(Fmins)

    if Fhrs + (Fmins/60) > 21:
        reg = ((21 - Shrs) + (round(Smins / 60))) * 2.5
        low = ((Fhrs - 21) + (round(Fmins / 60))) * 1.75
        total = str(round((reg + low),2))
        print("The post-9pm total bill comes to: ${0}\n".format(total))

    else:
        bill = (Fhrs - Shrs + abs(round((Fmins - Smins) / 60,2))) * 2.5
        str(round(bill,2))
        print("The pre-9pm total bill comes to: ${0}\n".format(bill))

main()