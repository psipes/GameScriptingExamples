import pygame

pygame.init()

# Color Definitions
white = (255, 255, 255)
black = (0, 0, 0)
red = (255, 0, 0)
green = (0, 168, 107)
treegreen = (31, 107, 31)
darkOrange = (196, 101, 0)
creamy = (236, 225, 203)
treeBrown = (140, 104, 74)
darkBrown = (136, 56, 6)
violet = (133, 89, 136)
purple = (107, 73, 132)
deeppurple = (72, 52, 117)
blue = (43, 47, 119)
deepblue = (20, 24, 82)
darkblue = (7, 11, 52)
gameDisplay = pygame.display.set_mode((800, 600))
gameDisplay.fill(darkblue)


def drawBG():
    grass_list = [(0, 600),   (50, 550),  (75, 575),  (100, 525),
                  (125, 550), (150, 425), (175, 500), (200, 425),
                  (225, 450), (250, 425), (275, 475), (300, 400),
                  (325, 425), (350, 375), (375, 425), (450, 350),
                  (475, 450), (525, 400), (600, 425), (625, 500),
                  (650, 450), (675, 500), (700, 425), (750, 550),
                  (775, 475), (800, 550), (800, 600)]
    
    tree_list = [(375, 550), (400, 475), (425, 550), (450, 500),
                 (450, 200), (525, 125), (600, 100), (525, 100),
                 (425, 150), (425, 0),   (375, 0)]
    
    pygame.draw.circle(gameDisplay, darkblue, (250, 275), 600)
    pygame.draw.circle(gameDisplay, deepblue, (250, 275), 400)
    pygame.draw.circle(gameDisplay, blue, (250, 275), 350)
    pygame.draw.circle(gameDisplay, deeppurple, (250, 275), 310)
    pygame.draw.circle(gameDisplay, purple, (250, 275), 280)
    pygame.draw.circle(gameDisplay, violet, (250, 275), 260)
    pygame.draw.circle(gameDisplay, white, (250, 275), 250)
    pygame.draw.polygon(gameDisplay, green, grass_list)
    pygame.draw.polygon(gameDisplay, treeBrown, tree_list)
    pygame.draw.circle(gameDisplay, treegreen, (550, 75), 100)
    pygame.draw.circle(gameDisplay, treegreen, (700, 25), 75)
    pygame.draw.circle(gameDisplay, treegreen, (625, 50), 100)
    pygame.draw.circle(gameDisplay, treegreen, (400, 0), 100)
    pygame.draw.circle(gameDisplay, treegreen, (275, 50), 125)
    pygame.draw.circle(gameDisplay, treegreen, (325, 100), 75)
    pygame.draw.circle(gameDisplay, treegreen, (150, -25), 75)
    return True


def drawFox():
    fox_orange_list = [(550, 575), (550, 475), (612, 425), (600, 400),
                       (600, 350), (575, 375), (525, 375), (500, 350),
                       (500, 425), (525, 425), (450, 475), (425, 525),
                       (450, 550)]

    fox_orange_shadow_list = [(450, 475), (550, 525), (475, 475)]

    fox_white_face_list = [(500,   400), (487.5, 425), (550,   475),
                           (612.5, 425), (600,   400), (562.5, 425),
                           (560, 462.5), (540, 462.5), (537.5, 425)]

    fox_white_chest_list = [(500, 425), (550, 525), (600, 425), (550, 475)]

    fox_white_tail_list = [(550, 525), (600, 550), (550, 575)]

    fox_cream_chest_list = [(500, 425), (550, 500), (600, 425), (550, 475)]

    fox_black_eartipR_list = [(500, 350), (525, 375), (500, 375)]
    fox_black_eartipL_list = [(600, 350), (600, 375), (575, 375)]
    fox_black_nose_list = [(537.5, 462.5), (562.5, 462.5), (550, 475)]
    fox_white_earR_list = [(500, 362.5), (500, 387.5), (512.5, 387.5)]
    fox_white_earL_list = [(600, 362.5), (600, 387.5), (587.5, 387.5)]

    pygame.draw.polygon(gameDisplay, darkOrange, fox_orange_list)
    pygame.draw.polygon(gameDisplay, darkBrown, fox_orange_shadow_list)
    pygame.draw.polygon(gameDisplay, white, fox_white_chest_list)
    pygame.draw.polygon(gameDisplay, creamy, fox_cream_chest_list)
    pygame.draw.polygon(gameDisplay, white, fox_white_face_list)
    pygame.draw.polygon(gameDisplay, white, fox_white_tail_list)
    pygame.draw.polygon(gameDisplay, black, fox_black_eartipR_list)
    pygame.draw.polygon(gameDisplay, black, fox_black_eartipL_list)
    pygame.draw.polygon(gameDisplay, white, fox_white_earR_list)
    pygame.draw.polygon(gameDisplay, white, fox_white_earL_list)
    pygame.draw.polygon(gameDisplay, black, fox_black_nose_list)
    
    return True


while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            quit()
    drawBG()
    drawFox()
    pygame.display.update()
