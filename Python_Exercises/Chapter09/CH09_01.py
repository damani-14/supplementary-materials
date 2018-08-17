# CH09_01: Revise the raquetball simulation so that it computes the results for bast of n game matches. First service
#           alternates, so player A serves first in the odd games of the match, and player B serves first in even games.
#----------------------------------------------------------------------------------------------------------------------

from random import random

def main():

    printIntro()

    probA, probB, n = getInputs()

    winsA, winsB = simNGames(n, probA, probB)

    printSummary(winsA, winsB)

def printIntro():
    print("This program simulates best of n raquetball game matches between two")
    print('players called "A" and "B". The abilities of each player is')
    print("indicated by a probability (a number between 0 and 1) that")
    print("the plater wins the point when serving. Player A always")
    print("has the first serve.")

def getInputs():

    a = eval(input("What is the prob. player A wins a serve? "))
    b = eval(input("What is the prob. player B wins a serve? "))
    n = eval(input("How many games to simulate? "))
    return a, b, n

def simNGames(n, probA, probB):

    winsA = winsB = 0
    for i in range(n):
        scoreA, scoreB = simOneGame(probA, probB)
        if scoreA > scoreB:
            winsA = winsA + 1
        else:
            winsB = winsB + 1
    return winsA, winsB


def simOneGame(probA, probB):

    serving = "A"
    scoreA = 0
    scoreB = 0

    while not gameOver(scoreA, scoreB):

        if serving == "A":

            rnd = random()

            if rnd < probA:
                scoreA = scoreA + 1
                serving = "B"
            else:
                scoreB = scoreB + 1
                serving = "B"

        elif serving == "B":

            rnd = random()

            if rnd < probB:
                scoreB = scoreB + 1
                serving = "A"
            else:
                scoreA = scoreA + 1
                serving = "A"
    return scoreA, scoreB

def gameOver(a, b):

    return a == 15 or b == 15

def printSummary(winsA, winsB):

    n = winsA + winsB
    print("\nGames simulated:",n)
    print("Wins for A: {0}".format(winsA))
    print("Wins for B: {0}".format(winsB))

main()