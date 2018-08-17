# CH07_05: Write a program to calculate a users BMI given their weight and height. Output above, below, or within
#          the range of "healthy" defined as 19-25
#-----------------------------------------------------------------------------------------------------------------------

def main():

    weight = eval(input("Enter your weight in pounds: "))
    height = eval(input("Enter your height in inches: "))

    bmi = (weight * 720) // height ** 2

    if bmi <= 25 and bmi >= 19:
        print("Your BMI is within the healthy range.")

    elif bmi < 19:
        print("Your BMI is below the healthy range.")

    else:
        print("Your BMI is above the healthy range.")

main()