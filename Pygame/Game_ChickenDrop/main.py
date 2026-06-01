import sys
import pygame
import random
##################################################################
#---------------------- INITIALIZATION --------------------------#
##################################################################
# Initialize that you are using pygame
pygame.init()

#create the width/height of the screen
width = 800
height = 600
size = (width, height)

#define black for painting the screen
black = (0, 0, 0)

# set the size of your screen
screen = pygame.display.set_mode(size)
# set the title of your screen
pygame.display.set_caption("Chicken Click")

# create the image we'll be using 
chicken = pygame.image.load("chicken.png")

# create the startX and start y and speed for our 5  chickens
# this is where we use random functions
# Unlike with Lua, we don't have to set the seed (though we could) 
iterator = 0
numOfChickens = 5
startX = []
startY = []
speed = []
while iterator < numOfChickens:
  startX.append(random.randint(0, width - chicken.get_width() + 1))
  startY.append(0 - random.randint(chicken.get_height(), chicken.get_height() *2))
  speed.append(random.random() + float(random.randint(0,3)) + 0.1)
  iterator += 1



replayScreen = False
#setting up the Play Again Font
bigFont = pygame.font.SysFont(None, 200)
playAgainText = bigFont.render("Play Again?", True, (0,200,0))
paX = width/2 - playAgainText.get_rect().width/2

#setting up the yes/no text 
smallFont = pygame.font.SysFont(None, 100)
yesText = smallFont.render("YES", True, (0, 200, 0))
yesX = width/4 - yesText.get_rect().width/2
noText = smallFont.render("NO", True, (0, 200, 0))
noX = width - width/4 - yesText.get_rect().width/2






##################################################################
#---------------------- GAME LOOP -------------------------------#
##################################################################

# We need to define our game loop somehow.
# Sometimes this is done with 1, but a lot of times
# You'll see a boolean being used and
# either playing, gameOver, or dead used as the variable name
gameOver = False


while gameOver == False:

  for event in pygame.event.get():
    if event.type == pygame.QUIT:
      gameOver = True

  #-----------------------CHECKING CLICKS---------------------

  if pygame.mouse.get_pressed()[0]:
    coords = pygame.mouse.get_pos()
    if replayScreen == False:
      iterator = 0
      while iterator < numOfChickens:
        if coords[0] >= startX[iterator] and coords[0] <= startX[iterator] + chicken.get_width() and coords[1] >= startY[iterator] and coords[1] <= startY[iterator] + chicken.get_height():
          startX[iterator] = random.randint(0, width - chicken.get_width() + 1)
          startY[iterator] = 0 - random.randint(chicken.get_height(), chicken.get_height() *2)
          speed[iterator] = random.random() + float(random.randint(0,3)) + 0.1
          break
        iterator += 1
    else:
      #checkYes
      if coords[0] > yesX and coords[0] < yesX + yesText.get_rect().width and coords[1] > 450 and coords[1] < 450 + yesText.get_rect().height:
        iterator = 0
        while iterator < numOfChickens:
          startX[iterator] = random.randint(0, width - chicken.get_width() + 1)
          startY[iterator] = 0 - random.randint(chicken.get_height(), chicken.get_height() *2)
          speed[iterator] = random.random() + float(random.randint(0,3)) + 0.1
          iterator += 1
        replayScreen = False
      
      #checkNo
      if coords[0] > noX and coords[0] < noX + noText.get_rect().width and coords[1] > 450 and coords[1] < 450 + noText.get_rect().height:
        gameOver = True

          

  #-----------------------UPDATING STUFF----------------------
  if replayScreen == False:
    iterator = 0
    while iterator < numOfChickens:
      #we can check the location here as well
      if startY[iterator] + chicken.get_height() > height:
        replayScreen = True
        break
      startY[iterator] += speed[iterator]
      iterator += 1

 


  # -----------------------DRAWING STUFF----------------------
  if replayScreen == False:
    screen.fill(black)
    iterator = 0
    while iterator < numOfChickens:
      screen.blit(chicken, (startX[iterator], startY[iterator]))
      iterator += 1 
      
    iterator = 0
  
  else:
    screen.fill((200,0,0))

    screen.blit(playAgainText, (paX, 150))
    screen.blit(yesText, (yesX, 450))
    screen.blit(noText, (noX, 450))

  # This "flips" the screen and tells it to do everything again
  pygame.display.flip()

# When your loop is over/game over, then quit.
pygame.display.quit()

