import random
#unique name of weapon, min damage, max damage 
weaponList = {1: ["Grizzled Sword", 25, 70], 2: ["Hardy Bow", 10, 55]}
randColor = ["Alabaster", "Vermillion", "Scarlet", "Opalescent", "Cetrine"]

def IsCrit(randAttack, weaponMin, weaponMax):
  if weaponMax - randAttack < 6:
    return True
  else:
    return False

def CritDamage (randAttack, mod):
  return randAttack * mod


def attack(weaponMin, weaponMax):
  randAttack = random.randint(weaponMin, weaponMax) #basic attack
  if IsCrit(randAttack, weaponMin, weaponMax): # if within 5 points of max
    print("Crit Attack!")
    return CritDamage(randAttack, 2) #double damage
  else:
    return randAttack



