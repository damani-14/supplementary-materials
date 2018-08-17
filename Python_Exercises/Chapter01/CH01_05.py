def main():

    print("This program illustrates a chaotic function")

    n = eval(input("Enter number of lines for output: "))

    x = eval(input("Enter a number between 0 an 1: "))

    for i in range(n):

        x = 3.9 * x * (1 - x)

        print(i + 1, ": ", x)

main()