# modified futval.py (section 2.7)

# futval.py
#   A program to compute the value of an investment
#   carried 10 years into the future

def main():

    print("This program calculates the future value")
    print("for an investment of user-defined duration.")

    principal = eval(input("Enter the initial principal: "))
    apr = eval(input("Enter the annual interest rate: "))
    n = eval(input("Enter the number of years: "))

    for i in range(n):

        principal = principal * (1 + apr)

    print("The value in", n, "years is:", principal)

main()