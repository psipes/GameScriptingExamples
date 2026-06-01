import pyxel
## official documentation: https://github.com/kitao/pyxel
## Things to take note of when using Pyxel:
## You can only have 3 images. You can call for certain portions
## of the image, but it only stores 3 image banks ( 0, 1, 2 )
## Images held are 256 x 256
## You can do tilemaps.
## There is no scaling on images
## There is a built in editor you can access by typing pyxeleditor in the console
## This lets you draw sprites and maps directly in the program
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
        pyxel.init(160, 120, caption="Hello Pyxel")

        ##This loads our two images into the image banks
        ##What we really should do is put them together into one image
        ##and then only call the sections we're wanting to draw.
        pyxel.image(0).load(0, 0, "meeple.png")
        pyxel.image(1).load(0,0, "train.png")

        #These are our "global" variables. 
        self.textStartX = 0.0
        self.textStartY = 0.0
        self.xSpeed = .5
        self.ySpeed = .5
        self.goRight = True
        self.goDown = True
        self.trainMoveX = 0.0
        self.trainSpeed = 2

        ##THIS SHOULD ALWAYS BE THE LAST LINE OF INIT
        pyxel.run(self.update, self.draw)



    def update(self):
      ## To get the text to move and bounce off the walls
        if self.goRight:
          self.textStartX = self.textStartX + self.xSpeed
          if self.textStartX > pyxel.width - 70:
            self.goRight = False
        else:
          self.textStartX = self.textStartX - self.xSpeed
          if self.textStartX < 0:
            self.goRight = True

        if self.goDown:
          self.textStartY = self.textStartY + self.ySpeed
          if self.textStartY > pyxel.height - 10:
            self.goDown = False
        else:
          self.textStartY = self.textStartY - self.ySpeed
          if self.textStartY < 0:
            self.goDown = True

        ##moving the train with right button press, if over limit
        ## start back at beginning
        if pyxel.btn(pyxel.KEY_RIGHT) or pyxel.btn(pyxel.GAMEPAD_1_RIGHT):
          self.trainMoveX = self.trainMoveX + self.trainSpeed
          if self.trainMoveX > pyxel.width:
            self.trainMoveX = -64

      ## To exit the game if we press q 
        if pyxel.btnp(pyxel.KEY_Q):
            pyxel.quit()

        

    def draw(self):
        #We want to clear the screen to Black
        #So that we can draw anything that may change in new location
        pyxel.cls(0)

        ##this is for an image.
        ## x, y (where you want it to go), img bank, u, v, w, h
        ## THe last variable is optional. If included, it signals 
        ## That there is transparency.
        ## IF you put a negative number into w or h, then it will flip the object
        pyxel.blt(pyxel.width/2 - 32, pyxel.height - 64, 0, 0, 0, 64, 64, 0)

        pyxel.blt(self.trainMoveX, -10, 1, 0, 0, 64, 64, 0)

        #This is for text with flashing color
        pyxel.text(55, 41, "Hello, Pyxel!", pyxel.frame_count % 16)

        #This is for text with static color and animation
        pyxel.text(self.textStartX, self.textStartY, "Technicolor Flash!", 8 )
        

## run the self contained class we just made
App()