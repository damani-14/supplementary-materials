# CH08_01: Wite a program that computes and outputs the nth Fibonacci number where n is a user defined value
#----------------------------------------------------------------------------------------------------------------------

def main():

    a, b = 1,1
    n = eval(input("Enter the length of the Fibonacci sequence: "))

    for i in range(n-1):
            a, b = b, (a+b)
    print(a)

main()