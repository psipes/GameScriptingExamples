import DiceRoll
import Player
import Weapons

print(DiceRoll.coinFlip())
print(DiceRoll.dice(20) - 4)

userStats = Player.playerStats
userStats["name"] = "Pat"
userStats["race"] = "Dwarf"
randNum = DiceRoll.dice(20) + 40
userStats["health"] = randNum
print(userStats["name"])
print(userStats["race"])
print(userStats["health"])
userInventory = Player.inventory
userInventory["weapons"] = Weapons.weaponList
print(userInventory["weapons"][1][0])
print(Weapons.attack(userInventory["weapons"][1][1], userInventory["weapons"][1][2]))
