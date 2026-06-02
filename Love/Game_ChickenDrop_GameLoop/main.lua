--This game is meant to be an oversimplified game where
--you try not to let the chickens hit the ground.
--Click the Chickens before they hit the ground.
--The game ends when a chicken hits the ground.

--This function load everything and gets us ready to play
function love.load()
  gameOver = false --never actually used
  roosterFace = love.graphics.newImage("chicken.png") --makes the chicken image usable

  math.randomseed(os.time()) --gets a set of random numbers from our internal clock
  math.random(); math.random(); math.random() --makes sure that they are actually random

  --values for x and y of each of our objects. This could be done much differently.
  --But, for simplicity's sake, it's done this way.
  startX = {math.random(0, love.graphics.getWidth()-roosterFace:getWidth()),
            math.random(0, love.graphics.getWidth()-roosterFace:getWidth()),
            math.random(0, love.graphics.getWidth()-roosterFace:getWidth()),
            math.random(0, love.graphics.getWidth()-roosterFace:getWidth()),
            math.random(0, love.graphics.getWidth()-roosterFace:getWidth())}
  startY = {0 - math.random (roosterFace:getHeight(), roosterFace:getHeight() * 2),
            0 - math.random (roosterFace:getHeight(), roosterFace:getHeight() * 2),
            0 - math.random (roosterFace:getHeight(), roosterFace:getHeight() * 2),
            0 - math.random (roosterFace:getHeight(), roosterFace:getHeight() * 2),
            0 - math.random (roosterFace:getHeight(), roosterFace:getHeight() * 2)}

end

-----------------------------------------------------------------------------------
--This is a built in function to check for mouse button presses
--It allows us to get the x and y value, which button, and touch components
function love.mousepressed(x, y, button, istouch)
  if button == 1 then --if left click
    --print ("LeftMouseClicked")
    for i, value in ipairs(startX) do --for each entry in the table startX
      --if the x and y value are within the image bounds
      --*if you scale an image, you have to also scale here because getWidth()/height()
      --*does not get the drawing image scale applied to it, so be careful.
      if x >= startX[i] and x <= startX[i] + roosterFace:getWidth() 
      and y >= startY[i] and y <= startY[i] + roosterFace:getHeight() then
        --print("in bounds")
        --If object is click, randomize the x and y position above so it can fall again
        math.randomseed(os.time())
        math.random(); math.random(); math.random()
        startY[i] = math.random (roosterFace:getHeight(), roosterFace:getHeight() * 2) * -1
        startX[i] = math.random(0, love.graphics.getWidth()-roosterFace:getWidth())
        break
      end
    end
  end
end
-----------------------------------------------------------------------------------------------
--This is your general update function.
--the parameter dt is delta time and allows us to make sure things are happening 
--according to time rather than frame rate
function love.update(dt)
    --for each entry in the table startX
    for i, value in ipairs(startX) do
          --check if the bottom of the object has hit the bottom of the screen
          --if it has, then close the game
          if startY[i] + roosterFace:getHeight() >= love.graphics.getHeight() then
            --print("overEdge")
            love.event.quit()
            --break
          end
      --move the object (this is how we animate)
      startY[i] = startY[i] + 20 * dt
    end
end

-------------------------------------------------------------------------------------------------
--This is the basic draw function. It's where we put visuals.
function love.draw()
  for i, value in ipairs(startX) do
    love.graphics.draw(roosterFace, startX[i], startY[i])
    end
end
