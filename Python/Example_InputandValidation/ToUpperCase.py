# Take a user input and capitalize it

#checks if input is digit, returns true if num
def CheckIfNum(userInput):
  if userInput.isdigit():
    return True
  else:
    return False

#checks if input is only spaces
def CheckIfSpace(userInput):
  if userInput.isspace():
    return True
  else:
    return False

#checks if enter key only
def CheckIfEmpty(userInput):
  if len(userInput) < 1:
    return True
  else:
    return False

#checks if already capped
def CheckIfCapped(userInput):
  if userInput == str.upper(userInput):
    return True
  else:
    return False

#checks all
def CheckAll(userInput):
  while CheckIfNum(userInput) or CheckIfSpace(userInput) or CheckIfEmpty(userInput) or CheckIfCapped(userInput):
    userInput = input("This can't be capitalized :( Please Try Again: ")
  return userInput


  
str_to_upper = input("Whatchu want? ")
print(str.upper(CheckAll(str_to_upper)))