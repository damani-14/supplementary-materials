# CH05_11: Write a chaos program that generates well formatted output given user defined parameters
#-----------------------------------------------------------------------------------------------------------------------

def main():

    print("This program conducts a chaos simulation for\na user defined number if iterations")

    x1, x2 = eval(input("Enter two numbers between 0 and 1: "))
    n = eval(input("Enter the number of iterations: "))

    print("")
    print("index {0:^14} {1:^6}".format(x1, x2))

    print(28 * "-")

    for i in range(n):

        x1 = 3.9 * x1 * (1 - x1)

        x2 = 3.9 * x2 * (1 - x2)

        print("{0:^5} {1:^12.06f} {2:^4.06f}".format(i+1, x1, x2))

main()