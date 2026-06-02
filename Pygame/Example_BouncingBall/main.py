import sys
import pygame

pygame.init()  # This is the initializer and is REQUIRED 1st
size = width, height = 800, 600  # decide screen size
speed = [1, 1]  # x,y
black = 0, 0, 0  # define color

screen = pygame.display.set_mode(size)  # set the size of the screen
ball = pygame.image.load('shipYellow_manned.png')  # define the image used
ballrect = ball.get_rect()  # get dimensions

while 1:  # while still going/playing
    for event in pygame.event.get():
        if event.type == pygame.QUIT: sys.exit()
    ballrect = ballrect.move(speed)
    if ballrect.left < 0 or ballrect.right > width:
        speed[0] = -speed[0]
    if ballrect.top < 0 or ballrect.bottom > height:
        speed[1] = -speed[1]
    screen.fill(black)
    screen.blit(ball, ballrect)
    pygame.display.flip()
