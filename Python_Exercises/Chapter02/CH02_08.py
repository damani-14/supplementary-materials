# modified convert.py (section 2.2)

def main():

    print("A program to convert Fahrenheit temperatures to Celsius")

    fahrenheit = eval(input("What is the Fahrenheit temperature? "))

    celsius = (fahrenheit - 32) * 5/9

    print("The temperature is ", celsius, " degrees Celsius")


main()