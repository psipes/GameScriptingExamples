import sys
import pygame
import random

#Game where you click the images before they touch the screen bottom

##############
# INITIALIZE #
##############
#-----------GENERAL STUFF------------
pygame.init() #starts the pygame library

#scene setup
# 0 = title page
# 1 = game
# 2 = game over/replay prompt
scene = 2

# slime image load
slime = pygame.image.load("slime_purp.png")
slime2 = pygame.image.load("slime_blue.png")
slime3 = pygame.image.load("slime_green.png")

slimes = [slime, slime2, slime3]

#flipped slime
rSlime = pygame.transform.flip(slime, True, False)

# SETUP THE SCREEN
width = 600
height = 400
size = (width, height)
screen = pygame.display.set_mode(size)
pygame.display.set_caption("Don't Let the Slime Splat!")
pygame.display.set_icon(slime)

#define colors
green = (74, 93, 35)
orange = (243, 121, 78)
black = (0, 0, 0)

#-----------TITLE and GAMEOVER PAGE STUFF------------
titleY = 100
playY= 300
btnMargin = 10

titleFont = pygame.font.SysFont("Arial", 65)
slimeTitle = titleFont.render("Raining Slime", False, green)
gameOverTitle = titleFont.render("Game Over", False, green)

buttonFont = pygame.font.SysFont("Arial", 30)
playWord = buttonFont.render("PLAY", False, green)
quitWord = buttonFont.render("QUIT", False, green)
restartWord = buttonFont.render("RESTART", False, orange)

playBtn = pygame.draw.rect(screen, black, ((width/2)-(playWord.get_width()/2) - btnMargin, playY - btnMargin, playWord.get_width() + (btnMargin*2), playWord.get_height()+(btnMargin*2)),0)

quitBtn = pygame.draw.rect(screen, black, ((width/4)-quitWord.get_width()/2 - btnMargin, playY - btnMargin, quitWord.get_width() + (btnMargin * 2), quitWord.get_height() +(btnMargin *2)), 0)

restartBtn = pygame.draw.rect(screen, green, ((width * .75)-(restartWord.get_width()/2) - btnMargin, playY - btnMargin, restartWord.get_width() + (btnMargin * 2), restartWord.get_height() +(btnMargin *2)), 0)


#-----------GAME PLAY STUFF------------
#slime definitions
counter = 0
numOfThings = 7
slimeImage = []
slimeX = []
slimeY = []
slimeSpeed = []
baseSpeed = .5
speedMulti = 1.2

slimeRect =[]
#release the slimes
while counter < numOfThings:
  slimeImage.append(random.choice(slimes))
  slimeX.append(random.randint(0, width - slime.get_width()))
  slimeY.append(0 - random.randint(slime.get_height(), slime.get_height() * 2))
  slimeSpeed.append(baseSpeed + random.random())

  counter += 1

##############
#  GAME LOOP #
##############
gameOver = False
while gameOver == False:
  #quit event. This is a pygame quirk
  for event in pygame.event.get():
    if event.type == pygame.QUIT:
      gameOver = True
#There are other events. You can even use Mouse events instead of ifs

      
  ##############
  #   CLICKS   #
  ##############
  if pygame.mouse.get_pressed()[0]:
    coords = pygame.mouse.get_pos() #when clicked, get position
    if scene == 0: #title screen
      if pygame.Rect.collidepoint(playBtn, coords): #if play button area clicked
        scene = 1 # change to play game
        #print("sceneChange")
      
    elif scene == 1: #play area
      #check if mouse position is in a slime
      #note, we don't/can't use collidepoint() because we haven't 
      #set up each individual slime to be its own rect. We COULD do that
      #to make the formula more easy. In the init area we'd need an array
      #after randomizing and getting the initial values,
      #we'd loop through the array and assign each index its image, x and y 
      counter = 0 #slime counter to zero
      while counter < numOfThings:
        if coords[0] >= slimeX[counter] and coords[0] <= slimeX[counter] + slime.get_width() and coords[1] >= slimeY[counter] and coords[1] <= slimeY[counter] + slime.get_height():
          #print("clicked it")
          #new random X and Y to start falling again
          slimeImage[counter] = random.choice(slimes)
          slimeX[counter] =random.randint(0, width - slime.get_width())
          slimeY[counter] = 0 - random.randint(slime.get_height(), slime.get_height() * 2)
          #speed the slime up
          slimeSpeed[counter] *= speedMulti
        counter += 1
    else: #gameover screen
      #print("game over screen")
      scene = 2
      if pygame.Rect.collidepoint(quitBtn, coords):
        gameOver = True
      if pygame.Rect.collidepoint(restartBtn, coords):
        #RESET YOUR GAME BEFORE RELOADING OR GOING BACK
        counter = 0
        while counter < numOfThings:
          slimeImage[counter]=(random.choice(slimes))
          slimeX[counter]=(random.randint(0, width - slime.get_width()))
          slimeY[counter]=(0 - random.randint(slime.get_height(), slime.get_height() * 2))
          slimeSpeed[counter]=(baseSpeed + random.random())
          counter += 1
        scene = 0
        
      
  ##############
  #   UPDATE   #
  ##############

  if scene == 1:
    #check if hit the bottom and move the slimes
    counter = 0
    while counter < numOfThings:
      if slimeY[counter] + slime.get_height() > height:
        #gameOver = True
        #break
        scene = 2
      slimeY[counter] += slimeSpeed[counter]
      counter +=1

  
  ##############
  #    DRAW    #
  ##############
  if scene == 0:
    #fill screen color
    screen.fill(orange)
    
    # to center something, subtract half the width of thing from half the width of window
    screen.blit(slimeTitle, ((width/2)-(slimeTitle.get_width()/2), titleY))
    #left slime
    screen.blit(slime, ((width/2)-(slimeTitle.get_width()/2)-slime.get_width(), titleY + (slimeTitle.get_height()-slime.get_height())))
    #right slime
    screen.blit(rSlime, (width/2 + slimeTitle.get_width()/2, titleY + (slimeTitle.get_height()-slime.get_height())))

    
    #-------BUTTONS-----------
    #play button
    coords = pygame.mouse.get_pos()
    if pygame.Rect.collidepoint(playBtn, coords): #check if mouse is hovering over button and flip colors
      playBtn = pygame.draw.rect(screen, green, ((width/2)-(playWord.get_width()/2) - btnMargin, playY - btnMargin, playWord.get_width() + (btnMargin*2), playWord.get_height()+(btnMargin*2)),0)
    else: #normal color button
      playBtn = pygame.draw.rect(screen, black, ((width/2)-(playWord.get_width()/2) - btnMargin, playY - btnMargin, playWord.get_width() + (btnMargin*2), playWord.get_height()+(btnMargin*2)),0)
    #green text regaedless of button color
    screen.blit(playWord, ((width/2)-(playWord.get_width()/2), playY) )

  #PLAYING THE GAME
  elif scene == 1:
    #fill screen with color
    screen.fill(green)
    #draw the slimes
    counter = 0
    while counter < numOfThings:
      screen.blit(slimeImage[counter], (slimeX[counter],slimeY[counter]))
      counter += 1

  #GAMEOVER SCREEN
  else:
    screen.fill(black)
    #gameOver text
    screen.blit(gameOverTitle, (width/2 - gameOverTitle.get_width()/2, titleY))
    #left slime
    screen.blit(slime, ((width/2)-(gameOverTitle.get_width()/2)-slime.get_width(), titleY + (gameOverTitle.get_height()-slime.get_height())))
    #right slime
    screen.blit(rSlime, (width/2 + gameOverTitle.get_width()/2, titleY + (gameOverTitle.get_height()-slime.get_height())))

    #-------BUTTONS---------
    #QUIT
    coords = pygame.mouse.get_pos()
    if pygame.Rect.collidepoint(quitBtn, coords): #check if mouse is hovering over button and flip colors
      quitBtn = pygame.draw.rect(screen, green, ((width/4)-quitWord.get_width()/2 - btnMargin, playY - btnMargin, quitWord.get_width() + (btnMargin * 2), quitWord.get_height() +(btnMargin *2)), 0)
    else:
      quitBtn = pygame.draw.rect(screen, orange, ((width/4)-quitWord.get_width()/2 - btnMargin, playY - btnMargin, quitWord.get_width() + (btnMargin * 2), quitWord.get_height() +(btnMargin *2)), 0)

    screen.blit(quitWord, ((width/4)-(quitWord.get_width()/2), playY))
    #RESTART
    if pygame.Rect.collidepoint(restartBtn, coords): #if hovered over
      restartBtn = pygame.draw.rect(screen, orange, ((width * .75)-(restartWord.get_width()/2) - btnMargin, playY - btnMargin, restartWord.get_width() + (btnMargin * 2), restartWord.get_height() +(btnMargin *2)), 0)
    else:
      restartBtn = pygame.draw.rect(screen, green, ((width * .75)-(restartWord.get_width()/2) - btnMargin, playY - btnMargin, restartWord.get_width() + (btnMargin * 2), restartWord.get_height() +(btnMargin *2)), 0)
    screen.blit(restartWord, ((width * .75) - (restartWord.get_width()/2), playY))
  
  #flip the page to draw new stuff
  pygame.display.flip()

#make doubley sure it quits
pygame.display.quit()
