# modified convert.py (section 2.2)

def main():

    print("A program to convert Celsius temperatures to Fahrenheit")

    celsius = eval(input("What is the Celsius temperature? "))

    fahrenheit = 9/5 * celsius + 32

    print("The temperature is ", fahrenheit, " degrees Fahrenheit")


main()