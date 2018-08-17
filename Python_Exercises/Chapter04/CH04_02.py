# CH04_02: Right a program the draws an archery target using the given characteristics
#-----------------------------------------------------------------------------------------------------------------------

import sys
sys.path.append('/Users/DamanisMacBook/PycharmProjects/Practice/venv/bin')
from graphics import *

def main():

    win = GraphWin()

    r1 = Circle(Point(100,100),50)
    r1.setFill("red")

    r2 = Circle(Point(100,100),40)
    r2.setFill("blue")

    r3 = Circle(Point(100,100),30)
    r3.setFill("black")

    r4 = Circle(Point(100,100),20)
    r4.setFill("white")

    c = Circle(Point(100,100),10)
    c.setFill("yellow")

    win.getMouse()

    r1.draw(win)

    r2.draw(win)

    r3.draw(win)

    r4.draw(win)

    c.draw(win)

    win.getMouse()

    win.close()

main()