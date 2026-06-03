import pygame, sys, random
from pygame.locals import QUIT

#############
#LOAD AREA
#############
pygame.init()
# set up size and title
width = 400
height = 300
screenSize = (width, height)
title = "Hello Pygame!"

#set up what the display area is called
screen = pygame.display.set_mode(screenSize)
pygame.display.set_caption(title)

#setup images for use
bat = pygame.image.load("bat.png")
snail = pygame.image.load("snail.png")
#bat setup
batSpeed = [1, 0]
batRect = bat.get_rect()

#snail setup (55 px)
snailWidth = 55
snailXPos = width + snailWidth
snailSpeed = .25

#Text 
randomR = 100
randomG = 100
randomB = 100
myFont = pygame.font.SysFont("Comic Sans MS", 30)
myName = myFont.render("Patricia", False, (randomR, randomG, randomB))
nameX = 100
nameSpeed = 1


gameover = False

#############
#UPDATE AREA
#############
while gameover == False:
  #Setup the exit event. Boiler for every pygame
  for event in pygame.event.get():
    if event.type == QUIT:
      pygame.quit()
      sys.exit()
  #move bat across screen until it gets to edge, then bounce
  batRect = batRect.move(batSpeed)
  if batRect.right > width or batRect.left < 0:
    batSpeed[0] = -batSpeed[0]

  #move snail across screen, if goes over, loop
  snailXPos = snailXPos - snailSpeed
  if snailXPos < 0 - snailWidth:
    snailXPos = width + snailWidth

  #move name if key pressed
  pressed = pygame.key.get_pressed()
  if pressed[pygame.K_RIGHT]:
    nameX = nameX + nameSpeed

  #randomize text color
  randomR = random.randint(0,255)
  randomG = random.randint(0,255)
  randomB = random.randint(0,255)
  myName = myFont.render("Patricia", False, (randomR, randomG, randomB))
  

#############
#DRAW AREA
#############
  screen.fill((0,0,0))
  pygame.draw.circle(screen, (0, 200, 0), (200, 200), 50)
  screen.blit(bat, (batRect.left, 200))
  screen.blit(snail, (snailXPos, 0))
  screen.blit(myName, (nameX, 100))
  
  pygame.display.flip()
  pygame.display.update()

#make sure things actually exit
pygame.display.quit()