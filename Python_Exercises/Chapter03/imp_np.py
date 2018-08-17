# macro - import NumPy
# fullpath = opt/passcal/other/lib/python2.6/site-packages/numpy


def main():

    ext = eval(input("Extension for import: "))
    path1 = "opt/passcal/other/lib/python2.6/site-packages/numpy/"

    path2 = path1 + ext

    newext = __import__(path2)

main()