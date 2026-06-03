import random
userInput = "a"

while str.upper(userInput) != "Q":
  print("RANNNDDDOOOMMM: " + str(random.randint(1,100)))
  userInput = input("Press Q to quit, any other key to continue: ")