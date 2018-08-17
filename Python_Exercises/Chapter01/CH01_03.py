def main():

    print("This program illustrates a chaotic function")

    x = eval(input("Enter a number between 0 an 1: "))

    for i in range(10):

        x = 2.0 * x * (1 - x)

        print(x)

main()

# The most striking difference between CH01_02 and CH01_03 where x = 3.9 * x * (1-x) is replaced by
# x = 2.0 * x * (1-x) is that rather than increasing chaos in the output, x approaches 0.49999999999999994 and, after 5
# or so iterations, the output is always 0.49999999999999994
