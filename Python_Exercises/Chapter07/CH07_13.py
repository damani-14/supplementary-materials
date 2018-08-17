# CH07_13: Write a program that accepts a date (dd/mm/yyy) and verifies that it is a valid data, then calculates
#          the corresponding day number.
#-----------------------------------------------------------------------------------------------------------------------

# Day Number Calculation

def dayNum(m,d,y):

    if float(m) < 2:
        dayNum = 31 * (float(m) - 1) + float(d)

    elif float(m) > 2 and y[2] != '0':
        dayNum = (31 * int(m)-1 + int(d)) - ((4 * int(m)+23) // 10)

    elif float(m) > 2 and y[2] == '0' and float(y) / 4 == float(y) // 4 and float(y) % 400 == 0:
        dayNum = (31 * (float(m) - 1) + float(d)) + 1

    elif float(m) > 2 and float(y) / 4 == float(y) // 4:
        dayNum = (31 * (float(m) - 1) + float(d)) + 1

    return dayNum

def main():

# Date Validation

    date = input("\nEnter a date using mm/dd/yyyy format: ")
    m,d,y = date.split("/")

    if float(d) > 31:
        print("\n{0} is not a valid date.".format(date))

    elif m == '09' or m == '04' or m == '06' or m == '11':

        if float(d) > 30:
            print("\n{0} is not a valid date.".format(date))

    elif float(d) <= 31:
        day = dayNum(m,d,y)
        print("\n{0} is a valid date occuring on day {1} of the year.\n".format(date, str(day)))

main()