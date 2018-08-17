# CH06_07: Write a function to calculate the nth Fibonacci number
#----------------------------------------------------------------------------------------------------------------------

def fibCalc(n):
    a,b = 1,1
    for i in range(n-1):
        a,b = b, a+b
    return a

def main():
    n = eval(input("Enter the length of Fib Seq: "))
    a = fibCalc(n)
    print("The nth Fibonacci number is:",a,"\n", sep=" ")

main()