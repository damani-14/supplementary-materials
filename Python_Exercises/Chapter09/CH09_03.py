# CH09_03: Design and implement a simulations of the game of volleyball. Normal volleyball is played like racquetball,
#           in that a tem can only score points when its serving. Games are played to 15, but must be won by at least
#           two points.
#----------------------------------------------------------------------------------------------------------------------

from random import random

def main():

    probA, probB, n = getInputs()
    winsA, winsB = simNGames(n, probA, probB)
    printSummary(winsA, winsB, n)

def getInputs():

    probA = eval(input("What is team A's win probability? "))
    probB = eval(input("What is team B's win probability? "))
    n = eval(input("How many games should be simulated? "))
    return probA, probB, n

def simNGames(n, probA, probB):

    winsA = winsB = 0

    # Validation
    print("TeamA | TeamB")

    for i in range(n):
        scoreA, scoreB = simOneGame(probA,probB)

        # Validation
        print(scoreA, "|", scoreB, sep=" ")

        if scoreA > scoreB:
            winsA = winsA + 1
        else:
            winsB = winsB + 1
    return winsA, winsB

def simOneGame(probA, probB):

    scoreA = 0
    scoreB = 0
    serving = "A"

    while not gameOver(scoreA, scoreB):
        if serving == "A":
            if random() < probA:
                scoreA = scoreA + 1
                serving = "A"
            else:
                serving = "B"
        else:
            if random() < probB:
                scoreB = scoreB + 1
                serving = "B"
            else:
                serving = "A"
    return scoreA, scoreB

def gameOver(a, b):

    return (a >= 15 and a - b >= 2) or (b >= 15 and b - a >= 2)

def printSummary(winsA,winsB, n):

    print("Wins Team A: {0} ({1:0.1%})".format(winsA, winsA/n))
    print("Wins Team B: {0} ({1:0.1%})".format(winsB, winsB/n))

main()

