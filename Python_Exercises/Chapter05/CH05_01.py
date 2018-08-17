# CH05_01: Use the built in string formatting methods to re-write the provided date converting program p. 147
#-----------------------------------------------------------------------------------------------------------------------

# dateconvert2.py
#   Converts day month and year numbers into two date formats

def main():

    # get the day month and year
    day, month, year = eval(input("Enter the day, month, and year numbers: "))

    date1 = "/".join([str(month), str(day), str(year)])
    print(date1)

    months = ["January","February","March","April","May","June","July","August",
              "September","October","November","December"]

    monthStr = months[month-1]
    date2 = monthStr+" "+str(day)+", "+str(year)

    print("The date is {0} or {1}.".format(date1, date2))

main()