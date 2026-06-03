import random

def dice(sides):
  roll = random.randint(1, int(sides))
  return roll

#return Heads if Even, return Tails if Odd
def coinFlip():
  flip = random.randint(1,100)
  if flip % 2 == 0:
    return "Heads"
  else:
    return "Tails"