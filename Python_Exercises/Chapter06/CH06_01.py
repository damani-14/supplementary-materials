# CH06_01: Write a program with functions that prints the lyrics to a song
#-----------------------------------------------------------------------------------------------------------------------

def ani(animal):

    print("And on that farm he had a", animal, ", Ee-igh, Ee-igh, Oh!", sep="")

def noise(sound):

    print("With a", sound, ",", sound, "here, and a", sound, ",",  sound, "there.", sep="")
    print("Here a ", sound, ",", " there a ", sound,",", " everywhere a ", sound,",",sound,".", sep="")

def omd():

    print("Old MacDonald had a farm, Ee-igh, Ee-igh, Oh!")

def main():

    animal = input("What is the farm animal? ")
    sound = input("What sound does it make? ")
    print("")
    omd()
    ani(animal)
    noise(sound)
    omd()
    print("")

main()