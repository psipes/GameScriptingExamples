# Add as many nums as the user wants together
def IsNum(userInput):
  return bool(userInput.isdigit() or isinstance(userInput, float))


def TryAgain(userInput):
  while not IsNum(userInput):
    userInput = input("That's not a number I can add, try again: ")

  return userInput



def CheckYN(userInput):
  if str.upper(userInput) == "Y" or str.upper(userInput) == "N":
    return True
  else:
    return False

def CheckContinue():
  playAgain = "a"
  while not CheckYN(playAgain):
    playAgain = input("Would you like to add another number> Y/N")
    if str.upper(playAgain) == "Y":
      return True
    elif str.upper(playAgain) == "N":
      return False
    

def addNewNum(total):
  newNum = input("Next Number: ")
  newNum = TryAgain(newNum)
  total = float(total) + float(newNum)
  return total


  
sum = 0
sum = addNewNum(sum)
print(sum)

while CheckContinue():
  sum = addNewNum(sum)
  print(sum)


print("The total sum is: " + str(sum))