# CH08_04: Write a program to calculate the Syracuse sequence of a user defined starting value.
#----------------------------------------------------------------------------------------------------------------------

def main():

    x = eval(input("Enter starting value for Syracuse sequence: "))
    syr = [x]

    while x != 1:

        if x % 2 == 0:
            x = x / 2
            syr.append(x)

        else:
            x = 3 * x + 1
            syr.append(x)

    print(syr)

main()