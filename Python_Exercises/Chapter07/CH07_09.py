# CH07_09: Write a program to calculate the date of Easter for a given year given:
#          for 1982 >= year <= 2048
#           a = year % 19
#           b = year % 4
#           c = year % 7
#           d = (19a + 24) % 30
#           e = (2b + 4c + 6d + 5) % 7
#           Easter Date = March 22 + d + e
#           Which may fall in April
#-----------------------------------------------------------------------------------------------------------------------

def main():

    year = eval(input("Enter the year for which to find the Easter date: "))

    a = year % 19
    b = year % 4
    c = year % 7
    d = ((19 * a) + 24) % 30
    e = (2*b + 4*c + 6*d + 5) % 7
    easter = 22 + d + e

    if year >= 1982 and year <= 2048:

        if easter - 22 < 31 - 22:
            # March Date
            day = str(round(easter - 22))
            year = str(year)
            print("Easter falls on {0} March, {1}.".format(day, year))
        else:
            # April Date
            day = str(round(easter - 31))
            year = str(year)
            print("Easter falls on {0} April, {1}.".format(day, year))
    else:
        print("Error: Selected year does not fall into range 1982-2048.")

main()