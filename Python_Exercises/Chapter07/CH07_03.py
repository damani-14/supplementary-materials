# CH07_03: Write a program that accepts a numerical score and uses a decision structure to produce the letter grade.
#-----------------------------------------------------------------------------------------------------------------------

def main():

    numGrd = round(eval(input("Enter the numerical grade: ")))

    if numGrd >= 90:
        print("Grade recieved is an A.")

    elif numGrd <= 89 and numGrd >= 80:
        print("Grade recived is a B.")

    elif numGrd <= 79 and numGrd >= 70:
        print("Grade recived is a C.")

    elif numGrd <= 69 and numGrd >= 60:
        print("Grade recived is a D.")

    else:
        print("Grade recived is an F.")

main()