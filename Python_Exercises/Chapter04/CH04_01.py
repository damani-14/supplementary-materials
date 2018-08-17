# CH04_01: Modification of pre-existing program from discussion p.117 Question 3
#
#-----------------------------------------------------------------------------------------------------------------------

# sys.path object refers to list of directories. using '.append' allows
# you to add a path to the system for importing modules outside of the
# current working directory
#
import sys
sys.path.append('/Users/DamanisMacBook/PycharmProjects/Practice/venv/bin')
from graphics import *
#
#-----------------------------------------------------------------------------------------------------------------------


def main():
    win = GraphWin()
    shape = Rectangle(Point(90,110), Point(110,90))
    shape.setOutline("red")
    shape.setFill("red")
    shape.draw(win)
    for i in range(10):
        p = win.getMouse()
        c = shape.getCenter()
        dx = p.getX() - c.getX()
        dy = p.getY() - c.getY()
        dshape = shape.clone()
        dshape.draw(win)
        dshape.move(dx,dy)
    message = Text(Point(100,100), "Click Again to Close")
    message.draw(win)
    win.getMouse()
    win.close()
main()