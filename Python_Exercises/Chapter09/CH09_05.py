# CH09_05: Design and implement a system that compares regular volleyball games to those using rally scoring.
#           Your program should be able to investigate whether rally scoring magnifies reduces, or has no effect
#           on the relative advantage enjoyed by the better team.
#----------------------------------------------------------------------------------------------------------------------

from random import random

def main():

    probA, probB, n = getInputs()
    ralWinsA, ralWinsB, regWinsA, regWinsB = simNGames(n, probA, probB)
    printSummary(regWinsA, regWinsB, ralWinsA, ralWinsB, n)

def getInputs():

    probA = eval(input("What is team A's win probability? "))
    probB = eval(input("What is team B's win probability? "))
    n = eval(input("How many games should be simulated? "))
    return probA, probB, n

def simNGames(n, probA, probB):

    # Rally Match Sim

    ralWinsA = ralWinsB = 0

    for i in range(n):

        ralScoreA, ralScoreB = simRalGame(probA, probB)

        if ralScoreA > ralScoreB:
            ralWinsA = ralWinsA + 1
        else:
            ralWinsB = ralWinsB + 1

    # Regular Match Sim

    regWinsA = regWinsB = 0

    for i in range(n):

        regScoreA, regScoreB = simRegGame(probA,probB)

        if regScoreA > regScoreB:
            regWinsA = regWinsA + 1
        else:
            regWinsB = regWinsB + 1

    return ralWinsA, ralWinsB, regWinsA, regWinsB

def gameOver(a, b):

    return (a >= 15 and a - b >= 2) or (b >= 15 and b - a >= 2)

def printSummary(regWinsA, regWinsB, ralWinsA, ralWinsB, n):

    print("         TeamA | TeamB")
    print("regWins:  {0} | {1}".format(regWinsA,regWinsB))
    print("ralWins:  {0} | {1}".format(ralWinsA,ralWinsB))
    print("regWin%: {0:0.1%} | {1:0.1%}".format(regWinsA/n,regWinsB/n))
    print("ralWin%: {0:0.1%} | {1:0.1%}".format(ralWinsA/n,ralWinsB/n))

#----------------------------------------------------------------------------------------------------------------------
# Rally Style
#----------------------------------------------------------------------------------------------------------------------

def simRalGame(probA, probB):

    ralScoreA = 0
    ralScoreB = 0
    ralServe = "A"

    while not gameOver(ralScoreA, ralScoreB):

        if ralServe == "A":

            if random() < probA:
                ralScoreA = ralScoreA + 1
                ralServe = "A"
            else:
                ralServe = "B"

        else:
            if random() < probB:
                ralScoreB = ralScoreB + 1
                ralServe = "B"
            else:
                ralServe = "A"

    return ralScoreA, ralScoreB

#----------------------------------------------------------------------------------------------------------------------
# Best of N
#----------------------------------------------------------------------------------------------------------------------

def simRegGame(probA, probB):

    regScoreA = 0
    regScoreB = 0
    regServe = "A"

    while not gameOver(regScoreA, regScoreB):

        if regServe == "A":
            rnd = random()

            if rnd < probA:
                regScoreA = regScoreA + 1
                regServe = "B"
            else:
                regScoreB = regScoreB + 1
                regServe = "B"

        elif regServe == "B":
            rnd = random()

            if rnd < probB:
                regScoreB = regScoreB + 1
                regServe = "A"

            else:
                regScoreA = regScoreA + 1
                regServe = "A"

    return regScoreA, regScoreB

main()