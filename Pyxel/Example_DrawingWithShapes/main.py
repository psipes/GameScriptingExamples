import pyxel
## official documentation: https://github.com/kitao/pyxel
## Things to take note of when using Pyxel:
##Max screen size is 255 x 255
## You can draw lines, rectangles and circles. That's it.

## There is a limited palette 0f 16 colors.
## The default palette can be seen here: https://raw.githubusercontent.com/kitao/pyxel/master/pyxel/examples/screenshots/05_color_palette.png
## You can technically change the palette (see official documentation)

##It's best to encapsulate into a class.
class App:
    ##This should look similar. The idea of:
    ## a load(initialize),
    ## an update function,
    ## a draw function
    

    def __init__(self):
        ## This is the minimum initialization, size of window and title
        pyxel.init(200, 200, caption="Bun has seen things")

        
        pyxel.run(self.update, self.draw)



    def update(self):
      ## To exit the game if we press q 
        if pyxel.btnp(pyxel.KEY_Q):
            pyxel.quit()

        

    def draw(self):
        #We want to clear the screen to Black
        #So that we can draw anything that may change in new location
        pyxel.cls(0)
        #Rectangls are top left corner coords, bottom right corner coords, color code
        #Circles are center coords, radius, color code
        #lines are x1, y1, x2, y2, color code
        pyxel.rectb(139, 129, 166, 141, 9) #front legLine
        pyxel.circb(165, 135, 5.5, 9) #fron circle outline
        pyxel.circ(165, 135, 5, 7) #front circle
        pyxel.circ(140, 120, 20, 7) #frontbody
        pyxel.circb(140, 120, 20, 9) #frontbody
        pyxel.rect(140, 130, 165, 140, 7 ) #frontpaw
        pyxel.rect(90, 90, 140, 140, 7) #bodyBack
        pyxel.circ(60, 100, 10, 7) # tailSolid
        pyxel.circb(60, 100, 10, 9) # tailSolid
        pyxel.circb(140, 135, 5.5, 9) #roundFoot
        pyxel.rectb(89, 129, 141, 141, 9) #backLegLines
        pyxel.circ(140, 135, 5, 7) #roundFoot
        pyxel.circ(90, 110, 30, 7) #haunchesSolid
        pyxel.circb(90, 110, 30, 9) #haunchesSolid
        #rect top left corner, bottom right corner, color
        #back leg
        pyxel.rect(90, 130, 140, 140, 7)

        pyxel.rect(154, 29, 171, 91, 9)
        pyxel.rect(129, 29, 146, 91, 9)
        pyxel.circ(163.5, 30, 8.5, 9)
        pyxel.circ(137.5, 30, 8.5, 9)
        
        #face
        pyxel.circ(140,90, 30.5, 9)
        pyxel.circ(140, 90, 30, 7)

        #ears
        pyxel.rect(155, 30, 170, 90, 7)
        pyxel.rect(130, 30, 145, 90, 7)
        pyxel.circ(163.5, 30, 7.5, 7)
        pyxel.circ(137.5, 30, 7.5, 7)

        pyxel.line(120, 90, 135, 105, 0)
        pyxel.line(115, 105, 130, 90, 0)

        pyxel.circ(140, 85, 5, 0)
        pyxel.circ(110, 85, 5, 0)
        pyxel.circ(138, 82, 2, 7)
        pyxel.circ(108, 82, 2, 7)
        

        

       
        

## run the self contained class we just made
App()