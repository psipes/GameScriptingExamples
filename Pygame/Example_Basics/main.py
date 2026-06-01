import sys
import pygame
import random

# Notes about pygame
# Pygame is much more robust than Pyxel.
# Basically you can do anything...think of it like Love 2D
# But older and wiser and with more patches and holes than
# a leaky collander you're trying to cook soup in
# I've set this program up so that you can see the difference
# between what it takes to do the same thing in the two languages

pygame.init()
width = 320
height = 240
size = (width, height)
black = (0, 0, 0)

# set the size of your screen
screen = pygame.display.set_mode(size)
# set the title of your screen
pygame.display.set_caption("Hello World")

# Load the images
# While I'm not using it, there is a get_rect() function.
# This gives you access to the dimensions and you can call
# to the left/right, top/bottom. It makes collisions simpler
# ...sometimes.
meeple = pygame.image.load("meeple.png")
train = pygame.image.load("train.png")
trainx = 0.0
trainy = 0.0

# static, non moving font with flashing colors.
randomR = 100
randomG = 100
randomB = 100
myfont = pygame.font.SysFont('Comic Sans MS', 30)
# This line is done once here an once in update to initialize and then change it.
helloPygameTxt = myfont.render('Hello Pygame', False, (randomR, randomG, randomB))

# moving text
# we've already setup the font, so we don't have to do that again
movingTxt = myfont.render("Technicolor Flash!", False, (250, 40, 0))

movingX = 0
movingY = 0
moveRight = True
moveDown = True


# We need to define our game loop somehow.
# Sometimes this is done with 1, but a lot of times
# You'll see a boolean being used and
# either playing, gameOver, or dead used as the variable name
gameOver = False

while gameOver == False:
  # Set up key Held down. There are different ways for down/up
  pressed = pygame.key.get_pressed()
  # If right arrow is pressed, move train, move back if over
  if pressed[pygame.K_RIGHT]:
        trainx = trainx + .5
        if trainx > width:
          trainx = -64

  # If you're using KEYDOWN or UP, then it gets written
  # a different way, inside of this for Loop.
  for event in pygame.event.get():
    if event.type == pygame.QUIT:
      gameOver = True

  # Change the colors for the font
  randomR = random.randint(0, 255)
  randomG = random.randint(0, 255)
  randomB = random.randint(0, 255)
  helloPygameTxt = myfont.render('Hello Pygame', False, (randomR, randomG, randomB))
  

  # move the font
  if moveDown:
    movingY = movingY + .1
    if movingY > height - (movingTxt.get_rect().height):
      moveDown = False
  if moveDown == False:
    movingY = movingY - .1
    if movingY < 0:
      moveDown = True
  if moveRight:
    movingX = movingX + .1
    if movingX > width - (movingTxt.get_rect().width):
      moveRight = False
  if moveRight == False:
    movingX = movingX - .1
    if movingX < 0:
      moveRight = True

  # On every update, we need to erase what we did and redraw
  screen.fill(black)
  screen.blit(train, (trainx, trainy))
  screen.blit(meeple, (width/2 - 32, height - 64))
  screen.blit(helloPygameTxt, (100, 100))
  screen.blit(movingTxt, (movingX, movingY))

  # This "flips" the screen and tells it to do everything again
  pygame.display.flip()

# When your loop is over/game over, then quit.
pygame.display.quit()
