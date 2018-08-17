# CH06_09: Do programming exercise 3 from Chapter 5 using a function
#          grade(score)
#          that returns the letter grade for a score
#----------------------------------------------------------------------------------------------------------------------

def grade(score):
    lettGrd = 60*"F" + 10*"D" + 10*"C" + 10*"B" + 11*"A"
    grade = lettGrd[score]
    print(grade)

def main():
    score = eval(input("Enter the numerical score: "))
    grade(score)
main()