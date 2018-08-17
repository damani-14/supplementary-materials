# CH07_01: Write a program to calculate weekly wages (including overtime) given user provided hours and pay rate
#-----------------------------------------------------------------------------------------------------------------------

def main():

    hours = eval(input("What is the total number of hours worked: "))
    rate = eval(input("What is the hourly rate: "))

    if hours <= 40:
        regular = []
        regular.append(hours * rate)
        print("Regular wages = $", regular,".", sep="")

    else:
        extra = hours - 40
        over = extra * (1.5 * rate)
        regular = 40 * rate
        print("Regular wages plus over time = $", regular + over,".", sep="")

main()