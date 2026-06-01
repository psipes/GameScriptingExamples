#==============#
#Patricia Sipes#
#Text Adventure#
#P08           #
#==============#


"""==========================================================================================="""
"""                Assignment: Create a Text Adventure with min. 20 user prompts              """
"""==========================================================================================="""
"""Text Adventure game. Uses: Lists, dictionaries, random choices, timing(sleep), functions,  """
"""user input, if/elif/else, while/else, %s notation, print statements, "map printing"        """
"""                                                                                           """
"""Features: A maze! And a riddle or two...I'm predictable, sorry Julie                       """
"""  Also, there's dialogue dependent on race. And end options only available to certain races"""
"""   And randomly generated weapon combos, NPC names, some verbs                              """
"""                                                                                           """
"""Things to be done better:                                                                  """
"""function management, implementation of classes, rewriting language, create a replay loop   """
"""POTIONS might be working now...maybe?                                                      """
"""                                                                                           """
"""Things left to be done:                                                                    """
"""-First third of adventure is written, but timing is missing thanks to scrapped code        """
"""-Second Leg of Journey. Ends at Tower of Knowledge. Paths lead to Key or Riddle to get in  """
"""-Third Leg of Journey: Mermaids (for fire proof armor)                                     """
"""-Final Leg: Dragon Island (possibility of mauling death by baby dragons                    """
"""-Merchant gets a shop, but we don't see shop until second leg/ store inventory set up      """
"""                                                                                           """
"""Things I want to look at:                                                                  """
"""-text/font manipulation                                                                    """
"""==========================================================================================="""


#There are currently 13 UNIQUE questions, but way more than that because fight mechanic, maze, and riddle inputs







import random
from time import sleep
gameOver = False


"""======================================================================================================================="""
"""*********************************************GLOBAL DICTIONARIES AND LISTS*********************************************"""
"""======================================================================================================================="""
playerStats={"name":[], "race": [], "racePlural": [], "health": [], "attackMin": [], "attackMax":[], "weapon":[], "gold": 0}
potion = 12

inventory = {"potion": {"name": "Potion", "power": potion, "number": 10, "description": "Heals for 10"}, "armor": []}

storeInventory = {"potion": {"name": "Potion", "description": "Heals for 10", "Number": 3},\
                  "armor": {"name": "Basic Armor", "description": "You don't want to ask", "number": 1}}

weaponsList={"color":["Alabaster", "Vermillion", "Blood", "Chartreuse", "Opalescent", "Topaz"],\
             "metal":["Steel", "Mithral", "Silver", "Lead", "Obsidian", "Star Shard"],\
             "magicItem": ["Orb", "Globe", "Aura", "Wand", "Staff", "Gauntlet"],\
             "physicalItem": ["Sword", "Crossbow", "Chakram", "Spear", "Mace"]}

verbList={"hands": ["hands you", "tosses you", "bequeaths you", "presents you", "gifts you", "bestows upon you",\
                    "gives you"], \
          "attacks": ["attacks", "strikes", "draws their blade", "jumps at you"],\
          "languageQuiet":["mutters", "whispers", "jokes"],\
          "languageLoud" : ["cries", "shouts", "exclaims"],\
          "languageAngry" :["yells", "growls", "says through gritted teeth"],\
          "languageHappy" : ["laughs", "smiles", "says"],\
          "languageMoody" :["mutters", "sulks", "whines","grumbles"],\
          "languageLaugh" : ["chuckles", "laughs", "giggles", "smirks"]}

placeList={"adj":["New", "Old", "Whispering", "Quiet", "Bloody", "Wooded", "Queen"],\
           "noun": ["Haver", "Dragon", "Wyver", "Dwyn", "Shalos", "Bull", "Sant"],\
           "suffix": ["shire", "brook", "land", "-Upon-Strat", "lilly", "king", "o"]}


raceNames= {"human": ["Patrick", "Hadre", "Dunlap", "Mackenzie", "Mikail", "Dan", "Eric", "Josh", "Nance", "Jess", "Laura"],\
            "elf": ["Victoria", "Elowyn", "Elwyn", "Legolas", "Shaun", "Aly", "Alyssa", "Crystal", "Alexander"],\
            "gnome": ["Jacqueline", "Jackie", "Roger", "Peter", "Paul", "Noah", "Katie"],\
            "dwarf": ["Patricia", "Pat", "Dwyn", "Dwyndolyn", "Thorin", "Kili", "Fili", "Becky", "Caitlin", "Thomas"]}

board=[]
             
         
"""======================================================================================================================"""
"""====================================================FUNCTIONS========================================================="""
"""======================================================================================================================"""

"""====================="""
"""====CHECKER CODES===="""
"""====================="""

def choiceRangeCheck (check, min, max):
    """For options in a range, make sure digit and in range"""
    while (not check.isdigit())or not (int(check)>int(min)-1 and int(check) <int(max)+1):
        check = raw_input ("Pick %i-%i:" %(min, max))
    return check

def choiceEmptyCheck (check):
    """make sure input is not empty"""
    while len(check)<1:
        check = raw_input ("I didn't catch that: ")   
    return check

def checkYN (choice, y, n):
    """CHECK IF INPUT OF TWO CHOICES IS CORRECT"""
    choice=str.upper(choice)
    while not (choice == y or choice == n):
        choice = raw_input ("%s or %s" %(y, n))
        choice = str.upper(choice)
    return choice
def checkVowel(item):
    """check if a noun starts with a vowel, give it the right article"""
    first = str(item)[0]
    if first in 'AEIOU':
        return "an"
    else:
        return "a"

"""====================="""
"""Background Functions """
"""====================="""
    

def raceStatAssign(race):
    """assigns plural for race, health, and starting gold"""
    if race =="dwarf":
        playerStats["racePlural"] = "dwarves"
        playerStats["health"] = random.randint(75, 130)
        playerStats["gold"] = random.randint(200, 400)
    elif race== "elf":
        playerStats["racePlural"] ="elves"
        playerStats["health"] = random.randint (65,100)
        playerStats["gold"] = random.randint (50, 100)
    else:
        playerStats["racePlural"] = "%ss" %race
        if race =="human":
            playerStats["health"] = random.randint (70, 91)
            playerStats["gold"] = random.randint (40, 150)
        else:
            playerStats["health"] = random.randint (52, 67)
            playerStats["gold"] = random.randint (145, 340)

def print_board (board):
    """creates map"""
    for row in board:
        print " ".join(row)




def raceDialogue():
    print "\"Any relation to --\""
    sleep(1)
    print " He stops mid sentence, turning bright red."
    sleep (2.3)
    print "\"Oh how rude of me! I didn't mean to insinuate that"
    print "\t all %s HAD to be related...\"" %playerStats["racePlural"]
    sleep (4)
    print
    print "He gulps nervously."
    sleep(2)
    print "\"It's not like it's true what they say about %s.\"" %playerStats["racePlural"]
    sleep (4)
    print "\"You know..."
    sleep (2.5)
    if playerStats["race"] == "dwarf":
        print "\"That you're really cannibalistic inbreds?\""
    elif playerStats["race"] == "gnome":
        print "\"That you're dumber than dirt and twice as"
        print " \tobsessed with shiny things that tick\""
    elif playerStats["race"] == "elf":
        print "\"That your whole race is dying out because"
        print " \tyou're more into mirrors than mates.\""
    if playerStats["race"] == "human":
        print "\"Well, your whole race is just boring.\""
    sleep (4)
    print "\t\t..."
    sleep (2)
    print "\t\t\t..."
    sleep (1)
    print "\"No offense or anything!\""
    sleep (2)


"""====================="""
"""   Fight Mechanics   """
"""====================="""


def playerAttack ():
    """Player attack choices"""
    print "What will you do?"
    print
    print "=================="
    print "|| 1. Attack    ||"
    print "|| 2. Inventory ||"
    print "=================="
    choice = raw_input("Choice: ")
    choice = checkYN(choice, "1", "2")
    if choice == "1":
        attack = random.randint(playerStats["attackMin"], playerStats["attackMax"])
        return attack
    else:
        print "You have",inventory["potion"]["number"],"potions"
        if int(inventory["potion"]["number"])>0:
            usePotion =raw_input("Use a potion? Y or N: ")
            usePotion = checkYN (usePotion, "Y", "N")
            if usePotion == "Y":
                playerStats["health"]= int(playerStats["health"]) + potion
                inventory["potion"]["number"] = inventory["potion"]["number"]-1
                print "You have been healed for %i." %potion
                print "You have %i potions left" %inventory["potion"]["number"]
                print
                if int(playerStats["health"])>100:
                              playerStats["health"]=100
                attack = random.randint(playerStats["attackMin"], playerStats["attackMax"])
                return attack
        else:
            print "You have no potions to use!"
            attack = random.randint(playerStats["attackMin"], playerStats["attackMax"])
            return attack

def attackSass(attack):
    """flavour text for attacks"""
    if attack == int(playerStats["attackMin"]):
        print "A near miss!"
    elif attack == int (playerStats["attackMax"]):
        print "Critical Hit!"
    else:
        if attack%5 ==0:
            print "Bam! Pow!"
        elif attack % 4 == 0:
            print "Take that!"
        elif attack % 3 == 0:
            print "Death awaits!"
        elif attack % 2 == 0:
            print "Nice attack!"
        else:
            print "Another hit!"
    print

                
                                    
                
                                         
        
    

def fight (monsterName, monsterHP, monstAttackMin, monstAttackMax):
    """Call this for fight mechanics"""
    print
    print "%s appears!" %monsterName
    print "%s has %s health" % (monsterName, monsterHP)
    print
    originalHP = playerStats["health"]
    coinFlip =random.randint(1,10)
    while not (monsterHP<1 or playerStats["health"]<1):
        if coinFlip%2 ==0:
            monstAttack = random.randint(monstAttackMin, monstAttackMax)
            print "%s attacks for %i!" % (monsterName, monstAttack)
            playerStats["health"]= playerStats["health"] -int(monstAttack)
            if playerStats["health"]<1:
                print monsterName,"has slain you!"
                break
                
                
            print
            print "Your remaining HP:", playerStats["health"]
            print "%s's remaining HP:"%monsterName, monsterHP
            print
            attack = int(playerAttack())
            print "Attack power: %i" %attack
            attackSass(attack)
            monsterHP = monsterHP-attack
            if monsterHP<1:
                print "You vanquished %s!" %monsterName
                playerStats["health"] = originalHP
                gameOver = False
                break
        else:
            print
            print "Your remaining HP:", playerStats["health"]
            print "%s's remaining HP:"%monsterName, monsterHP
            print
            attack = int(playerAttack())
            print "Attack power: %i" %attack
            attackSass(attack)
            monsterHP = monsterHP-attack
            if monsterHP<1:
                print "You vanquished %s!" %monsterName
                playerStats["health"] = originalHP
                gameOver = False
                return gameOver
            
            monstAttack = random.randint(monstAttackMin, monstAttackMax)
            print "%s attacks for %i!" % (monsterName, monstAttack)
            playerStats["health"]= playerStats["health"] -int(monstAttack)
            if playerStats["health"]<1:
                print monsterName,"has slain you!"
                break
    

"""====================="""
"""     Story Chunks    """
"""====================="""

def intro ():
    """In bar, background on character/world"""
    sleep (1)
    print "\"The nobles would have you believe that all the dragons"
    print "         died out years ago.\""
    sleep (4.5)
    print
    print "         \"Adventurers would have you believe there's some sort"
    print "                     of infestation.\""
    sleep (5)
    print
    print "The man at the bar laughs nervously, sipping at his drink."
    sleep (3) 
    print
    print "Somehow you've found yourself at what seems to be the edge of the"
    print "world, sitting in a bar in %s %s%s. The city has seen better days." \
          %(random.choice(placeList["adj"]), random.choice(placeList ["noun"]), random.choice(placeList["suffix"]))
    sleep (7.2)
    print
    print "You look around the bar, the support beams rotting and wet."
    sleep (4)
    print
    print "                                     Much better days..."
    sleep (2)
    print
    print
    print

    """THE DRAGON QUESTION (Q3)"""

    print "\"You seem sensible enough, Stranger, What do you believe?\""
    sleep(2.7)
    print "                                     \"About the Dragons, that is!\""
    sleep(2.5)
    print
    print "\t============================================================"
    print "\t|| 1. \"Just another fairytale to keep the mind            ||"
    print "\t||                               off the real world.\"     ||"
    print "\t|| 2. \"Hard to believe something that big could hide,     ||"
    print "\t||                                       I guess maybe?\"  ||"  
    print "\t|| 3. \"Fire breathing, house size terrors?                ||"
    print "\t||                            That seems...EXCITING!\"     ||"
    print "\t|| 4. \"Sure would love to see one!\"                       ||"
    print "\t|| 5. \"THEY\'RE EVERYWHERE! CAN\'T YOU FEEL IT?             ||"
    print "\t||             THE EARTH BREATHS. THE DIRT IS SCALY.      ||"
    print "\t||           THE CITY MUST BE BUILT ON TOP A DRAGON!\"     ||"
    print "\t||========================================================||"
    print
    dragonChoice = raw_input("Dialogue Choice (1-5): ")
    dragonChoice = int(choiceRangeCheck(dragonChoice, 1, 5))
    print
    if dragonChoice == 1 or dragonChoice == 2:
        print "\"Ah! We have a pessimist.\""
        sleep (1)
        print "The man sips at his drink eyeing you fervently"
        sleep (2)
        print "                 \"Or maybe just a realist?\" He %s."%(random.choice(verbList["languageQuiet"]))
    elif dragonChoice == 3 or dragonChoice == 4:
        print "\"Not afraid of death, I see.\""
        sleep(1)
        print "The man %s into his mug." %(random.choice(verbList["languageLaugh"]))
    else:
        print "\"Woah now, Friend.\""
        sleep (2)
        print "\t\"Paranoid ain\'t a good look for ya!\""


    """THE DRINK QUESTION (Q2)"""
    print
    sleep (4)
    print "\"But here we are, talking about worldly thing and your drink's gone dry!\""
    sleep (3)
    drinkChoice = raw_input("\"What's your poison, Stranger\":")
    drinkChoice = choiceEmptyCheck (drinkChoice)
    print
    print "\"A FINE choice, indeed!\""
    sleep (2)
    print "He waves at the irritated woman behind the bar,"
    sleep (.6)
    print "and orders two more %ss."%drinkChoice
    print
    sleep (3)
    print "Upon arrival of the drinks, he lifts his mug, motioning you to do the same."
    sleep (3.6)
    print "\"A toast to--"
    sleep(.5)
    print "\t Well, Shalos's Bells!"
    sleep (3)


    """NAME QUESTION (Q3)"""
    print "\t\t Can\'t have a proper toast without yer name, can I?\""
    print
    sleep (3)
    print "My name is Sir %s, and it is a pleasure to meet a traveler such as yourself." %random.choice (raceNames["human"])
    print
    sleep (3)
    playerStats["name"] = raw_input("So what do people call you: ")
    playerStats["name"]=choiceEmptyCheck (playerStats["name"])
    print
    print "%s? A fine name, indeed!"%playerStats["name"]
    sleep (4)
    if playerStats["name"] in raceNames["dwarf"] :
        playerStats["race"] = "dwarf"
    elif playerStats["name"] in raceNames ["elf"]:
        playerStats["race"] = "elf"
    elif playerStats["name"] in raceNames ["human"]:
        playerStats ["race"] = "human"
    elif playerStats["name"] in raceNames ["gnome"]:
        playerStats ["race"] = "gnome"
    else:

        """FROM WHERE DO YOU HAIL (optional) Q4"""
        print "\"Quite a unique name, actually."
        sleep (3)
        print "\t Not sure if I've heard it before."
        sleep (3)
        print
        print "From where do you hail?\""
        sleep (1.7)
        print
        print "======================================"
        print "||1. Whispering Willows:            ||"
        print "||      Land of Elves and Fae Folk  ||"
        print "||2. City of Living Stones:         ||"
        print "||      Home to Dwarves and the Dark||"
        print "||3. Tinker Town:                   ||"
        print "||      Place of Gnomes and Machines||"
        print "||4. Kingsland Keep:                ||"
        print "||      City of Men and Treachery   ||"
        print "======================================"
        homeChoice = raw_input("Choice 1-4:" )
        homeChoice = int(choiceRangeCheck(homeChoice, 1, 4))
        if homeChoice == 1:
            playerStats["race"] = "elf"
        elif homeChoice == 2:
            playerStats["race"] = "dwarf"
        elif homeChoice ==3:
            playerStats["race"] = "gnome"
        else:
            playerStats["race"]= "human"
    raceStatAssign(playerStats["race"])
            
        
    print
    raceDialogue()
    print
    print "Before you can say anything. He hops up and %s, nervously leaving the bar." %random.choice (verbList["languageLaugh"])
    sleep (4)




    

def barFight ():
    """In bar, first fight, start of doom/maze"""
    print "You sigh."
    sleep (2)
    print "The barmaid looks over at you and nods,"
    
    """SENSITIVITY TRAINING (Q5)"""
    yOrN = raw_input ("\"People really are too sensitive these days, don\'tcha think?\" (Y or N):")
    yOrN=checkYN(yOrN, "Y", "N")
    sleep (2)
    if yOrN == "Y":
        print
        print "\"So glad you agree, love!\""
        sleep(2)
        print "\t\"I so miss the days this bar was full of irreverent jokes!\""
        sleep(3)
    else:
        print
        print "She %s." %random.choice(verbList["languageMoody"])
        sleep (1.6)
        print "\t\"And you're part of the problem, it seems...\""
        sleep (3)
    print
    print "Just then, you see the maid jump the bar."
    sleep (3)   
    print "\t Your head turns to follow her and you can see"
    sleep (1.6)
    print "\t\t blades drawn and drunk men arguing."
    sleep (3)
    print
    
    """BARFIGHT HERO/COWARD (Q6)"""
    yOrN = raw_input ("Do you try and intervene? (Y or N):")
    yOrN=checkYN(yOrN, "Y", "N")
    if yOrN == "Y":
       print "You have to think quick and they have pointy swords."
       sleep (2)


       """CHAIR OR BROOM (Q7)""" 
       chairOrBroom = raw_input ("Do you grab a chair or the broom to defend yourself?")
       chairOrBroom = checkYN (chairOrBroom, "CHAIR", "BROOM")
       sleep (2)
       playerStats["weapon"] = chairOrBroom
       if chairOrBroom =="CHAIR":
           playerStats["attackMin"]= random.randint(1,5)
           playerStats["attackMax"]= random.randint(6, 8)
       else:
           playerStats["attackMin"]=random.randint(4,7)
           playerStats["attackMax"]=random.randint(8,10)

       print "You rush forward, brandishing your %s." %(playerStats["weapon"])
       sleep(2)
       fight("Drunken Bard", 60, 4, 8)
       print
       sleep(2)
       print "\"Well, well!\""
       sleep (2)
       print "The bar maid grabs you around the waist, hugging you."
       sleep (3)
       print "\"One way or another, that's taken care of..."
       sleep (2)
       print "\t\thopefully you're not the worse for wear?\""
       sleep (4)
       print
       print "The barmaid heads over to the bar and starts fixing a drink."
       sleep (3)
       print "\"Don\'t go anywhere, Hun! I'll fix you up a special drink\""
       sleep (2)
       print "\t\t\"It\'ll cure all your ills!\""
       sleep(3)
       print "\"I\'m sure a little gold doesn't hurt either!\""
       sleep (1.7)
       print
       print "Rewarded: 20 gold"
       sleep (2)
       playerStats["gold"] = playerStats["gold"] + 20
       print "What will you do?"
       print
       """COUNT GOLD IN PUBLIC? Q8"""
       print "======================"
       print "|| 1. Sit Patiently ||"
       print "|| 2. Count Gold    ||"
       print "======================"
       choice = raw_input("Choice: ")
       choice = checkYN(choice, "1", "2") 
       if choice == "2":
           print "You count out your gold."
           print "%s shiny gold coins sit on the table in front of you"%playerStats["gold"]
           sleep(3)
       print
       print




       
def dragonMaze():
    """Maze"""
    print "The barmaid drops a glass."
    sleep(2)
    print "It shatters, tinkling, ringing."
    sleep(2)
    print "But the ringing doesn\'t stop."
    sleep (2)
    print "It turns into shouting"
    sleep (1)
    print "\t\t and crying"
    sleep (3)
    print
    print "The patrons are rushing outside and from where you sit,"
    sleep (3)
    print "You can see flames."
    sleep (3)
    print
    """Fire, what fire? Q9"""
    print "What will you do?"
    print
    print "==============="
    print "|| 1. Leave  ||"
    print "|| 2. Stay   ||"
    print "==============="
    choice = raw_input("Choice: ")
    choice = checkYN(choice, "1", "2")
    if choice == "2":
        print "You sip your drink as the barmaid runs past."
        sleep (2)
        print "POP POP POP"
        sleep (1)
        print "\t \t You duck as glass explodes off the back of the bar"
        sleep (3)
        print "Fire starts to trail down the stairs and"
        print "\t the ceiling collapses."
        sleep (4)
        print
        print "You take the money off the counter, and flee."
        sleep (4)
    print
    print
    print "Your eyes take a moment to adjust to the light outside."
    sleep (3)
    print "Despite the smoke, the fire is white hot and bright."
    sleep (3)
    print "\t You stumble. You dare not look down."
    sleep (2)
    print "\t\t Above you can hear wings flapping."
    sleep (2)
    print
    print "And from somewhere...."
    sleep (1)
    print "\t \"Traveller!\""
    sleep (2)
    print "\t\t\"%s! Please...\""%playerStats["name"]
    sleep (3)
    print
    print "You realise it must have been the man at the bar."
    sleep (4)
    print "You can hear him. Ever so quiet. The strength draining."
    sleep (4)
    print "Maybe you can help him if you can get yourself out of here?"
    sleep (4)
    print
    """Pretty much all 20 input could be found here and in the fight sequence at beginning...Q10"""
    print "**TOWN MAP**"
    for x in range(0,6):
        board.append(["X"]*6)
    board [5][2]="O"
    board [0][2]="*"
    board [4][2] = "^"
    board [5][1] = "<"
    print_board(board)
    sleep (2)
    print
    print "   Movements:"
    print "==============="
    print "|| 1. Forward ||"
    print "|| 2. Left    ||"
    print "================"
    choice = raw_input("Choice: ")
    choice = checkYN(choice, "1", "2")
    print
    if choice=="1":
        board [5][2]=" "
        board [0][2]="*"
        board [4][2] = "O"
        print_board(board)
        print
        print "Rubble collapses. This is a dead end."
        print "You head the other way."
        print

    board [5][0]="O"
    board [0][2]="*"
    board [4][2] = "X"
    board [5][1]=" "
    board [5][2]=" "
    board [4][0] = "^"
    print_board(board)
    sleep (2)
    print
    print "   Movements:"
    print "===================="
    print "|| 1. Forward     ||"
    print "===================="
    choice = raw_input("Choice: ")
    choice = checkYN(choice, "1", "1")
    print
    sleep (.7)
    if choice == "1":
        board [5][0]=" "
        board [0][2]="*"
        board [2][0] = "O"
        board [4][2] = "X"
        board [2][1] = ">"
        board [5][1]=" "
        board [5][2]=" "
        board [4][0] = " "
        board [3][0] =" "
        print_board(board)
        sleep (2)
        print
        print "   Movements:"
        print "===================="
        print "|| 1. Forward     ||"
        print "===================="
        choice = raw_input("Choice: ")
        choice = checkYN(choice, "1", "1")
        print
        sleep (.7)
        if choice == "1":
            board [5][0]=" "
            board [0][2]="*"
            board [1][0]=" "
            board [1][2] = "^"
            board [2][0] = " "
            board [2][2] = "O"
            board [2][3] = ">"
            board [4][2] = "X"
            board [2][1] = " "
            board [5][1]=" "
            board [5][2]=" "
            board [4][0] = " "
            board [3][0] =" "
            print_board(board)
            sleep (2)
            print
            print "   Movements:"
            print "===================="
            print "|| 1. Up          ||"
            print "|| 2. Right       ||"
            print "===================="
            choice = raw_input("Choice: ")
            choice = checkYN(choice, "1", "2")
            print
            sleep (.7)
            if choice =="1":
                board [5][0]=" "
                board [0][2]="O"
                board [1][0]=" "
                board [1][2] = " "
                board [2][0] = " "
                board [2][2] = " "
                board [2][3] = " "
                board [4][2] = "X"
                board [2][1] = " "
                board [5][1]=" "
                board [5][2]=" "
                board [4][0] = " "
                board [3][0] =" "
                print_board(board)
                print "You made it!"
            else:
                board [5][0]=" "
                board [0][2]="*"
                board [1][0]=" "
                board [2][0] = " "
                board [2][2] = " "
                board [2][3] = "O"
                board [4][2] = "X"
                board [2][1] = " "
                board [5][1]=" "
                board [5][2]=" "
                board [4][0] = " "
                board [3][0] =" "
                print_board(board)
                print
                print "Burning wreckage falls in front of you."
                sleep (.6)
                print "It's a dead end!"
                sleep (2)
                print
                board [5][0]=" "
                board [0][2]="*"
                board [1][0]=" "
                board [1][2] = "^"
                board [2][0] = " "
                board [2][2] = "O"
                board [2][3] = " "
                board [4][2] = "X"
                board [2][1] = " "
                board [5][1]=" "
                board [5][2]=" "
                board [4][0] = " "
                board [3][0] =" "
                print_board(board)
                sleep (2)
                print
                print "You move forward, you can see actual daylight beyond the walls."
                sleep (.6)
                print
                board [5][0]=" "
                board [0][2]="O"
                board [1][0]=" "
                board [1][2] = " "
                board [2][0] = " "
                board [2][2] = " "
                board [2][3] = " "
                board [4][2] = "X"
                board [2][1] = " "
                board [5][1]=" "
                board [5][2]=" "
                board [4][0] = " "
                board [3][0] =" "
                print_board(board)
                print
                print "You made it!"
                print
                   


def hardChoices():
    sleep (3)
    """save racist bar dude or prisoner in shackles"""
    print "You fall to your knees, taking a deep breath."
    sleep (2)
    print "You wipe away the ash from your face and try and get your bearings"
    sleep (1)
    print
    print
    print "\"%s...\""%playerStats["name"]
    sleep (2)
    print "\t The voice is weak, but there."
    sleep (3)
    print
    print "You look around and in the distance, you can see him."
    sleep (2)
    print "He's reaching out towards you."
    sleep (1.6)
    print "You wonder if he can see you."
    sleep (1.6)
    print "You wonder if you should save him..."
    sleep (1)
    print
    print "\"HEY!\""
    sleep (1)
    print "You look around and spot a woman in rags,"
    sleep (2)
    print "\t her ankles are chained together and"
    print "\t her arm bears the brand of a prisoner."
    sleep(3)
    print
    print "\"I KNOW YOU CAN HEAR ME, %s!\""% (playerStats["race"]).upper()
    sleep (2)
    print "\"Please! The dragon could be back any minute.\" she %s" %random.choice(verbList["languageAngry"])
    sleep (2)
    print " \t\"I...\""
    sleep (.6)
    print "\t\t\"I won't last long like this...\" She looks down at the chains."
    sleep (3)
    print
    print
    print "Her eyes grow wide and she pulls on her chains, screaming."
    sleep (3)
    print "You follow her eyes"
    sleep (2)
    print "\tThe trouble with foreshadowing is"
    sleep (1)
    print "\t\tyou never see it coming the first time around."
    sleep (3)
    print
    print "You'll only have enough time to save one or the other."
    sleep (2)
    print "The dragon is sure to notice the movement..."
    sleep (4)
    
    print
    """Which one to not get eaten by dragon? Q11"""
    print "       Who to Save:"
    print "=========================="
    print "|| 1. Sir What'sHisFace ||"
    print "|| 2. Shackled Woman    ||"
    print "=========================="
    choice = raw_input("Choice: ")
    choice = checkYN(choice, "1", "2")
    sleep (2)
    if choice =="1":
        print
        print "You guess the racist bastard can\'t be all bad."
        sleep (3)
        print "You run towards him, trying to carefully avoid"
        sleep (.2)
        print "the dragon's gaze."
        sleep (3)
        print
        print "You slow as you approach."
        sleep (3)
        print "To say he\'s not in good shape is an understatement."
        sleep (4)
        print "\tHis right arm is crushed,"
        sleep (3)
        print "\t\tHis left leg is missing."
        sleep (2)
        print
        print "There is blood everywhere."
        sleep (1)
        print "\"You came...\" He weakly smiles."
        sleep (3)
        print "You lean over him. taking his good hand."
        sleep (3)
        print
        print "\"Alas, I will not see the night fall.\""
        sleep (2)
        print "\"What I would give to see the stars one more night...\""
        sleep (4)
        if playerStats["race"]=="dwarf":
            print "\t\"Not that someone that lives their lives in stone"
            print "\t\twould understand...\""
            sleep (3)
        print
        print "\"Someone has to stop this plague.\""
        sleep (2)
        print "\"The mages at the Tower of Knowledge would know"
        print "how to defeat a dragon...\" He weezes."
        sleep (4)
        print "\"YOU need to do it.\""
        sleep (3)
        print "\t\"If not for others, for yourself..."
        sleep (3)
        print "\t\t The dragon won't stop \'til you're dead.\""
        sleep (2)
        print"\"It won\'t tolerate that you escaped...\""
        sleep (4.2)
        print
        print "\"Here.\""
        sleep (2)
        playerStats["weapon"]="%s %s" %(random.choice(weaponsList["metal"]), random.choice(weaponsList["physicalItem"]))
        print "\tHe %s %s %s." %(random.choice(verbList["hands"]),checkVowel(playerStats["weapon"]), playerStats["weapon"])
        playerStats["attackMin"] = int(playerStats["attackMin"]) + random.randint(4, 10)
        playerStats["attackMax"] = int(playerStats["attackMin"]) + random.randint(8, 12)
        sleep (3)
        print
        print "He grabs your shirt, pulling you in close:"
        sleep (1)
        print "\t\" Now RUN!\""
        sleep (2)
        print "You begin running as ordered."
        sleep (3)
        print "Out of the corner of your eye, you see the dragon swooping."
        sleep (2)
        print "\t\t\"RUN AND LIVE ANOTHER--\""
        sleep (1)
        print "You dare not look back."
        sleep (1)
        print "Your eyes focus forward, wandering only to see"
        print "the bloody shackles to your left."
        sleep (3.6)
        print "You WILL live another day."
        sleep (2)
        print "And you WILL kill the dragon."
        sleep (4)
        print
        print "If only for ruining a perfectly good bar."
        
    else:
        print "You\'ve always been one for cliches."
        sleep (2)
        print "The Damsel in Distress it is!"
        sleep (3.4)
        print
        print "You can see the relief on the woman's face as you run"
        sleep (3)
        print "From behind you, you hear a dying man cursing your name..."
        sleep (2)
        print "Good thing is he can't really make good on those threats."
        sleep (3.3)
        print "You know..."
        sleep (1.6)
        print "\tSince he\'ll be dead soon?"
        sleep (3)
        print "Too soon?"
        sleep (3)
        print
        print "You slide to your knees, coming to halt under the tree next to the woman."
        sleep (3)
        print "You don\'t think the dragon saw you...you hope."
        sleep (2)
        print
        print "The woman reaches down, cupping your face:"
        sleep (2)
        print "\"I'd call you my hero, but"
        sleep (1)
        print "\tyou haven\'t gotten me out of here yet..."
        sleep (3)
        print "She smiles."
        sleep (3)
        print "You can tell she\'s used to getting her way."
        sleep (2)
        print "\"Hurry up..."
        sleep (2)
        print "\t I hope you're a decent lockpick.\""
        sleep (3)
        if not(playerStats["race"]=="gnome"):
            print "You look at the lock and swallow hard."
            sleep (2.4)
            print "It's a gnomish riddle lock..."
            sleep (3)
            print "You pull the lever and the riddle pops open: "
            sleep (3.3)
            print
            """Riddled Lock Q12"""
            print "================================================="
            print "||  What Force and Strength do not penetrate,  ||"
            print "||      I, with gentle spin, get through.      ||"
            print "||       From unfriendly hands, I guard,       ||"
            print "||            While letting you in.            ||"
            print "================================================="
           
            answer=""
            guesses=3
            while guesses>0:
                print "You have %i guesses left" %guesses
                answer = raw_input("What am I: ")
                guesses= guesses-1
                if (answer.upper()=="KEY" or answer.upper()=="A KEY"):
                    end = "goodEnd"
                    break
                    
            else:
               end = "badEnd"
               
        else:
            print "Piece of cake."
            sleep (1.4)
            print "You don\'t want to tell her, but"
            sleep (2)
            print "\tyou designed the locking riddle."
            sleep (3.5)
            print "You were also smart enough to make it"
            sleep (2)
            print "\t easy enough for you to get out of..."
            sleep (2.3)
            print "\t\tBecause..."
            sleep (1)
            print "\t\t\tReasons, right?"
            sleep (3.5)
            end = "goodEnd"
            
         
        if end == "badEnd":
            print "\" YOU INCOMPETENT TWAT!\""
            sleep (2)
            print "She pulls on the cuffs"
            sleep (2)
            print "\"You started the eterna lock failsafe!\""
            sleep (3.3)
            print "\"I\'ll be stuck here forever!\""
            sleep (2)
            print "\"I\'ve been saving magic to get out of here,"
            sleep (2)
            print "but cursing you seems like a better idea!\""
            sleep (3.4)
            print "She raises her hands."
            sleep (2)
            print "You look around, trying to think of a shield..."
            sleep (2)
            print "And then momentary darkness."
            sleep (3.7)
            print "You open your eyes."
            sleep (2)
            print
            print "She's gone..."
            sleep (2)
            print "Well, most of her."
            sleep (3)
            print "\tLooks like the dragon couldn\'t even free"
            sleep (2)
            print "\ther feet from eterna locked ankles..."
            sleep (3)
            print
            print
            playerStats["weapon"] = "%s %s" % (random.choice(weaponsList["metal"]), random.choice(weaponsList["magicItem"]))
            print "You bend over and pick up %s %s" % (checkVowel(playerStats["weapon"]), playerStats["weapon"])
            playerStats["attackMin"] = int(playerStats["attackMin"]) + random.randint(4, 7)
            playerStats["attackMax"] = int(playerStats["attackMin"]) + random.randint(5, 10)
            sleep (3)
            print "You begin running. There\'s something in the distance..."
            sleep (3)
            print "\tMaybe help."
            sleep (2)
            print "\t\tOr a place to forget this..."
        else:
            """Suspicion Q13"""
            print "\"You managed to free me?\""
            sleep (2)
            print "\"And you're not the least bit suspicious"
            sleep (2)
            print "\twhy I was in chains to begin with?\""
            sleep (3)
            print "       Suspicious?:"
            print "==================================="
            print "|| 1. Now that you mention it... ||"
            print "|| 2. We\'ve all got problems.   ||"
            print "==================================="
            choice = raw_input("Choice: ")
            choice = checkYN(choice, "1", "2")
            if choice =="1":
                print "\"Tip for next time, Sweetie:"
                sleep (2)
                print "\t Ask the questions FIRST...\""
                sleep (3)
            print "\"I was going to kill you..."
            sleep (2)
            print "\t but I like your spunk."
            sleep (3.3)
            print "And I\'ll sacrifice some fun to survive a dragon."
            sleep (3)
            print
            print "Here, kid"
            sleep (1.4)
            playerStats["weapon"]="%s %s" %(random.choice(weaponsList["color"]), random.choice(weaponsList["magicItem"]))
            print "\tShe %s %s %s." %(random.choice(verbList["hands"]),checkVowel(playerStats["weapon"]), playerStats["weapon"])
            playerStats["attackMin"] = int(playerStats["attackMin"]) + random.randint(4, 10)
            playerStats["attackMax"] = int(playerStats["attackMin"]) + random.randint(8, 12)
            sleep (3)
            print
            print "\"Now I\'m going that way.\" She points."
            sleep (2)
            print "\t\"You go some other way, kay?\""
            sleep (3)
            print "She turns away from you, running, rags fluttering"
            sleep (3)
            print "\t Rags turn into feathers before your eyes and"
            sleep (3)
            print "\t you watch as she takes flight."
            sleep (2)
            print
            print "The dragon catches sight of her."
            sleep (2)
            print "If it catches her, it won\'t be long before it gets you."
            sleep (3)
            print "You run. You can see a tower in the far distance..."
            sleep (2)
            print "\tIf nothing else, it's a goal..."
             
             
             
        
        
        

     
     
                                    
                                                                                    
    
    

    
    





"""*************MAIN CODE**********************"""

intro()
barFight()
dragonMaze()
hardChoices()



    


