def main():

    for i in range(100):
        expression = eval(input("Enter a mathematical expression: "))
        print(i + 1, "/100: ANSWER = ", expression, end="\n")

main()