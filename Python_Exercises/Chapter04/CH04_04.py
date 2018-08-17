# CH04_04: Write a program that draws a winter scene with a Christmas tree and a snowman.
#-----------------------------------------------------------------------------------------------------------------------

import sys
sys.path.append('/Users/DamanisMacBook/PycharmProjects/Practice/venv/bin')
from graphics import *

def main():

    win = GraphWin()
    win.getMouse

# Christmas Tree
    tree = Polygon(Point(25,125),Point(50,50),Point(75,125))
    tree.setFill("green")

    trunk = Rectangle(Point(45,150),Point(55,125))
    trunk.setFill("brown")

    baub1 = Circle(Point(50,85),3)
    baub1.setFill("red")
    baub2 = Circle(Point(40,100),3)
    baub2.setFill("white")
    baub3 = Circle(Point(60,115),3)
    baub3.setFill("yellow")
    baub4 = Circle(Point(50,120),3)
    baub4.setFill("red")

# Snowman
    body1 = Circle(Point(150,85),10)
    body1.setFill("white")
    body2 = Circle(Point(150,107.5),12.5)
    body2.setFill("white")
    body3 = Circle(Point(150,135),15)
    body3.setFill("white")

    button1 = Circle(Point(150,103.5),1)
    button1.setFill("black")
    button2 = Circle(Point(150,107.5),1)
    button2.setFill("black")
    button3 = Circle(Point(150,111.5),1)
    button3.setFill("black")

    leftEye = Circle(Point(147,85),1)
    leftEye.setFill("black")
    rightEye = leftEye.clone()
    rightEye.move(6,0)

# Draw Scene
    trunk.draw(win)

    tree.draw(win)

    baub1.draw(win)
    baub2.draw(win)
    baub3.draw(win)
    baub4.draw(win)

    body1.draw(win)
    body2.draw(win)
    body3.draw(win)

    button1.draw(win)
    button2.draw(win)
    button3.draw(win)

    leftEye.draw(win)
    rightEye.draw(win)

    win.getMouse()
    win.close()

main()