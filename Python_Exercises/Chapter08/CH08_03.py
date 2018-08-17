# CH08_03: Use a while loop to calculate years until and investment has doubled given user provided principal and rate
#----------------------------------------------------------------------------------------------------------------------

def main():

    inv = eval(input("Enter the investment amount: "))
    rate = eval(input("Enter the annualized interest rate: "))
    y = 0
    dbl = 2 * inv

    while inv < dbl:
        inv = inv * (1 + rate)
        y = y + 1
    print(inv, y)

main()