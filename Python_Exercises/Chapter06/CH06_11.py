# CH06_11: Write and test a function to meet this specification:
#          squareEach(nums)
#          where nums is a list of numbers, and squareEach returns
#          modifies the list by squaring each entry.
#----------------------------------------------------------------------------------------------------------------------

def squareEach(nums):

    import math
    sqrs = []
    for i in range(len(nums)):
        sqrs1 = nums[i] * nums[i]
        sqrs.append(sqrs1)
    return sqrs

def main():
    n = eval(input("Set the length of squares list: "))
    nums = []

    for i in range(n):
        nums.append(eval(input("Enter number: ")))

    sqrs = squareEach(nums)
    print("Squares: ", sqrs,"\n")

main()