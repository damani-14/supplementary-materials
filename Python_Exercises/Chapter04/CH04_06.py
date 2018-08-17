# CH04_06: Modify the graphical future value program (p. 101-102) so that the input (principal and apr) are received
# in a graphical fashion using 'Entry' objects
#-----------------------------------------------------------------------------------------------------------------------

import sys
sys.path.append('/Users/DamanisMacBook/PycharmProjects/Practice/venv/bin')
from graphics import *

def main():

    # Introduction
    print("This program plots the growth of a 10-year investment.")

    # Create a graphics window with labels on the left edge
    win = GraphWin("Investment Growth Chart",320, 240)
    win.setBackground("white")
    win.setCoords(-1.75, -200, 11.5, 10400)

    Text(Point(-1,0), ' 0.0K').draw(win)
    Text(Point(-1,2500), ' 2.5K').draw(win)
    Text(Point(-1,5000), ' 5.0K').draw(win)
    Text(Point(-1,7500), ' 7.5K').draw(win)
    Text(Point(-1,10000), '10.0K').draw(win)

    # Get principal and interest rate

    Text(Point(1,9500),"Principal: ").draw(win)
    entry1 = Entry(Point(3,9500), 5)
    entry1.setText("0.00")
    entry1.draw(win)

    Text(Point(1.5,8500), "APR: ").draw(win)
    entry2 = Entry(Point(3,8500), 4)
    entry2.setText("0.00")
    entry2.draw(win)

    Text(Point(3,7000), "Calculate 10y APR").draw(win)
    Rectangle(Point(1,6500),Point(5,7500)).draw(win)

    win.getMouse()

    # Convert 'principal' and 'apr' to numbers
    principal = eval(entry1.getText())
    apr = eval(entry2.getText())

    # Draw bar for initial principal
    bar = Rectangle(Point(0,0),Point(1, principal))
    bar.setFill("Green")
    bar.setWidth(2)
    bar.draw(win)

    # Draw a bar for each subsequent year
    for year in range(1, 11):
        principal = principal * (1 + apr)
        bar = Rectangle(Point(year, 0), Point(year+1, principal))
        bar.setFill("green")
        bar.setWidth(2)
        bar.draw(win)

    butn2 = Rectangle(Point(1, 6500), Point(5, 7500))
    butn2.setFill("white")
    butn2.draw(win)
    Text(Point(3, 7000), "Click To Close").draw(win)

    win.getMouse()
    win.close()

main()

