# modified convert.py (section 2.2)

def main():

    print("A program to convert five(5) Celsius temperatures to Fahrenheit")

    for i in range(5):

        celsius  = eval(input("What is the Celsius temperature? "))

        fahrenheit = 9/5 * celsius + 32

        print("Temperature", i + 1, "is", fahrenheit, "degrees Fahrenheit")

main()