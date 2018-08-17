# CH05_13: Modify a previous program to use batch processing
#-----------------------------------------------------------------------------------------------------------------------

def main():

    print("This program conducts a chaos simulation for\na user defined number if iterations")
    print("")
    x1, x2 = eval(input("Enter two numbers between 0 and 1: "))
    n = eval(input("Enter the number of iterations: "))

    print("")

    chaos = open(input("Enter a filename for output: "), "w")

    print("index {0:^14} {1:^6}".format(x1, x2))
    print("index,",x1,x2,sep="", file=chaos)

    print(28 * "-")

    for i in range(n):

        x1 = 3.9 * x1 * (1 - x1)

        x2 = 3.9 * x2 * (1 - x2)

        print("{0:^5} {1:^12.06f} {2:^4.06f}".format(i+1, x1, x2))
        print(x1,",",x2,sep="", file=chaos)

    print("Data has been written to: ", chaos)
    print("")
    chaos.close()

main()