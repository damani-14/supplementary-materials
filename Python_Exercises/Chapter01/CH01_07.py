def main():

    print("This program illustrates a chaotic function")

    x = eval(input("Enter a number between 0 an 1: "))
    y = eval(input("Enter a second number between 0 and 1: "))

    for i in range(10):

        x = 3.9 * x * (1 - x)
        y = 3.9 * y * (1 - y)

        print(i + 1, "a: ", x, " ", i + 1, "b: ", y)

main()