# modified futval.py (section 2.7)

# futval.py
#   A program to compute the value of an investment
#   carried 10 years into the future

def main():

    print("This program calculates the future value")
    print("of a user defined duration investment.")

    principal = eval(input("Enter the initial principal: "))
    apr = eval(input("Enter the annual interest rate: "))
    periods = eval(input("Enter the annual frequency of interest compounding: "))
    duration = eval(input("Enter the number of years: "))
    n = duration * periods
    prate = apr/periods
    runsum = 0
    runrate = 0


    for i in range(n):

        runsum = principal * (1 + prate)
        runrate = runsum - principal

    print("The value in", duration, "years is:", runsum + (i * runrate))

main()