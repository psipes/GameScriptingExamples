#add two numbers from user and return sum

def IsNum(userInput):
  if userInput.isdigit() or isinstance(userInput, float):
    return True
  else:
    return False


def TryAgain(userInput):
  while not IsNum(userInput):
    userInput = input("That's not a number I can add, try again: ")

  return userInput
  
    

num1 = input("Give me a Number: ")
num1 = TryAgain(num1)
num2 = input("Give me Another Number: ")
num2 = TryAgain(num2)
print(float(num1) + float(num2))