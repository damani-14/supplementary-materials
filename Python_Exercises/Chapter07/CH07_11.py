# CH07_11: Write program that determines whether a provided year is a leap year.
#-----------------------------------------------------------------------------------------------------------------------

def main():

    year = eval(input("Enter the year for determining leap year: "))
    yearSt = str(year)

    if yearSt[2] == '0' and year % 400 == 0:
        # leap year
        print("\n{0} is a leap year and a century year.".format(yearSt))

    elif year / 4 == year // 4:
        # leap year
        print("\n{0} is a leap year.".format(yearSt))

    else:
        # non-leap year
        print("\n{0} is not a leap year.".format(yearSt))

main()