function love.load()
  --set window size
  love.window.setMode(256,256)
  --set window title
  love.window.setTitle("Frogger")
  --make grassy background. Done here so it's drawn once
  love.graphics.setBackgroundColor(0, .5, .1)
  --calculating midpoint here so we don't have to do it later
  midpoint = love.graphics.getWidth()/2

  --Our car(s) only need to change on the Y axis. 
  --So we only need a variable that can change for the y
  carY = 0

  --To make the car perfectly center, we need the dimension of our car
  --and the center of the lane.

  carW = (midpoint - midpoint/2) * 0.5
  lcenter = midpoint - midpoint/4

  --to make our life easier, we'll add carX and carH for our collision calcs
  carX = lcenter-(carW/2)
  carH = 60

  --let's give our car a speed
  carSpeed = 100

  --Let's get our frog box setup
  --Our frog can move in 4 directions with the arrow or wasd keys
  --This means we need to define both the x and y of our frog as variables

  frogX = 0
  frogY = 0
  frogW = 10
  frogH = 10

  --how much frog should move
  frogSpeed = 50

  --Game Over variable for being hit by car
  gameover = false
  
end



--Have to press key for each move
--function love.keypressed( key )
--  if key == "d" or "right" then
--    frogX = frogX + 10
--  end
--end

function love.update(dt)
  if gameover == false then
    --*************************************************
    --
    -- FROG MOVEMENT 
    --
    --*************************************************
    --if the right arrow or d key is pressed, move right
    --key codes: https://love2d.org/wiki/KeyConstant
    --Keep moving if key is held
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
      --limit it so frog can't go off stage
      if frogX > love.graphics.getWidth() - 10 then
        frogX = love.graphics.getWidth() - 10
      else
        frogX = frogX + frogSpeed * dt
      end
    end
    --Frog going left
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
      --limit it so frog can't go off stage
      if frogX < 0 then
        frogX = 0
      else
        frogX = frogX - frogSpeed * dt
      end
    end
    --frog going down
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
      --limit it so frog can't go off stage
      if frogY + 10 > love.graphics.getHeight() then
        frogY = love.graphics.getHeight() - 10
      else
        frogY = frogY + frogSpeed * dt
      end
    end
  
      --frog going up
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
      --limit it so frog can't go off stage
      if frogY < 0 then
        frogY = 0
      else
        frogY = frogY - frogSpeed * dt
      end
    end  
  --**********************************************
  --END FROG MOVEMENT
  --**********************************************
  --**********************************************
  --
  -- CAR MOVEMENT
  --
  --**********************************************
    --we need to loop the car back to the top if it goes off the edge
    if carY > love.graphics.getHeight() then
      carY = -carH
    else
      carY = carY + carSpeed * dt
    end
    
  --**********************************************
  --
  -- COLLISION
  --
  --**********************************************
    --Collision is probably one of the most complicated things
    --There are lots of solutions and libraries out there,
    --but let's walk through the logic of two boxes colliding
    --you need to check if:
      -- right side A is greater than left side of B AND
      -- left side A is less than right side of B AND
      -- bottom side A is greater than top side of B AND
      --top side of A is less than bottom side B
    --All 4 of those conditions have to be satisfied for a collision
    --You could make it into a function, but we're going to write it
    --out long form so you can see the full logic
  
    if (frogX + frogW) > carX and frogX < (carX + carW) and (frogY + frogH) > carY and frogY < (carY + carH) then
      gameover = true
    end
  end
  
end

function love.draw()
  --Draw the road
  love.graphics.setColor(0,0,0) --black
  --mode(line or fill), top left corner x, top left corner y, width, height
  love.graphics.rectangle("fill", midpoint-(midpoint/2), 0, midpoint, love.graphics.getHeight())

  --Draw dividing line
  love.graphics.setColor(1,1,1)
  love.graphics.setLineWidth(3)
  love.graphics.line(midpoint, 0, midpoint, love.graphics.getHeight())
  
  --Draw the "frog"
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", frogX, frogY, frogW, frogH)

  --The Car(s) go on top of the frog
  love.graphics.setColor(.5,0,0)
  love.graphics.rectangle("fill", carX, carY, carW, carH)

  --add a gameover variable to the load
  --we can print gameover on collision by setting gameover to true
  --and having an if here where it only displays if true
  --you could go further and make it so your frog and cars can only
  --move if gameover is false to 'freeze' everything.
  if gameover == true then
    love.graphics.setColor(1, 0, 0)
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.printf("Game Over", 0, 100, 256, "center")
  end
    

end