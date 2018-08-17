# CH04_05: Write a program that draws 5 dice on the screen depicting a straight (1, 2, 3, 4, 5 or 2, 3, 4, 5, 6).
#-----------------------------------------------------------------------------------------------------------------------

import sys
sys.path.append('/Users/DamanisMacBook/PycharmProjects/Practice/venv/bin')
from graphics import *

def main():

    win = GraphWin()
    win.getMouse

# Arrange Each Die and Its Dots (Straight: 1, 2, 3, 4, 5)

    # Die One
    d1 = Rectangle(Point(20,95), Point(50,65))
    d1.setFill("white")

    one = Circle(Point(35,80),3.5)
    one.setFill("black")


    # Die Two
    d2 = Rectangle(Point(85,95), Point(115,65))
    d2.setFill("white")

    two1 = Circle(Point(92.5,72.5),3.5)
    two1.setFill("black")
    two2 = Circle(Point(107.5,87.5),3.5)
    two2.setFill("black")

    # Die Three
    d3 = Rectangle(Point(150,95), Point(180,65))
    d3.setFill("white")

    three1 = Circle(Point(157.5,72.5),3.5)
    three1.setFill("black")
    three2 = Circle(Point(165,80),3.5)
    three2.setFill("black")
    three3 = Circle(Point(172.5,87.5),3.5)
    three3.setFill("black")

    # Die Four
    d4 = Rectangle(Point(62.5,135), Point(92.5,105))
    d4.setFill("white")

    four1 = Circle(Point(70,112.5),3.5)
    four1.setFill("black")
    four2 = Circle(Point(85,112.5),3.5)
    four2.setFill("black")
    four3 = Circle(Point(70,127.5),3.5)
    four3.setFill("black")
    four4 = Circle(Point(85,127.5),3.5)
    four4.setFill("black")

    # Die Five
    d5 = Rectangle(Point(107.5,135), Point(137.5,105))
    d5.setFill("white")

    five1 = Circle(Point(115,112.5),3.5)
    five1.setFill("black")
    five2 = Circle(Point(130,112.5),3.5)
    five2.setFill("black")
    five3 = Circle(Point(122.5,120),3.5)
    five3.setFill("black")
    five4 = Circle(Point(115,127.5),3.5)
    five4.setFill("black")
    five5 = Circle(Point(130,127.5),3.5)
    five5.setFill("black")

# Draw All Items
    d1.draw(win)
    one.draw(win)

    d2.draw(win)
    two1.draw(win)
    two2.draw(win)

    d3.draw(win)
    three1.draw(win)
    three2.draw(win)
    three3.draw(win)

    d4.draw(win)
    four1.draw(win)
    four2.draw(win)
    four3.draw(win)
    four4.draw(win)

    d5.draw(win)
    five1.draw(win)
    five2.draw(win)
    five3.draw(win)
    five4.draw(win)
    five5.draw(win)

    win.getMouse()
    win.close()

main()