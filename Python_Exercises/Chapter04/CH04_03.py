# CH04_03: Write a program that draws some sort of face
#-----------------------------------------------------------------------------------------------------------------------

import sys
sys.path.append('/Users/DamanisMacBook/PycharmProjects/Practice/venv/bin')
from graphics import *

def main():

    win = GraphWin()
    win.getMouse()

    head = Circle(Point(100,100), 50)
    head.setFill("yellow")

    leftEye = Circle(Point(75,75),10)
    leftEye.setFill("black")

    rightEye = leftEye.clone()
    rightEye.move(50,0)

    mouth1 = Line(Point(95,125),Point(105,125))
    mouth2 = Line(Point(75, 120), Point(95, 125))
    mouth3 = Line(Point(105, 125), Point(125, 120))


    head.draw(win)
    leftEye.draw(win)
    rightEye.draw(win)
    mouth1.draw(win)
    mouth2.draw(win)
    mouth3.draw(win)

    win.getMouse()

    topTeeth = Rectangle(Point(75,120),Point(125,115))
    topTeeth.setFill("white")

    botTeeth = Rectangle(Point(75, 125), Point(125, 120))
    botTeeth.setFill("white")

    topTeeth.draw(win)
    botTeeth.draw(win)

    win.getMouse()
    win.close()

main()