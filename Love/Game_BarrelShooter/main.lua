---------------------------------------------------------------------
-----Barrel Shoot "Game"
-----Left click to shoot bullets from that position
-----Don't let the barrels reach the left
---------------------------------------------------------------------
---------------------------------------------------------------------


----barrelSpawner function
---generally speaking we should set this as changeable parameters and then it could just be an image spawner
function barrelSpawn()
    barrelsX[#barrelsX + 1] = math.random(love.graphics.getWidth(), love.graphics.getWidth() + 100)

    barrelsY[#barrelsY + 1] = math.random(0, love.graphics.getHeight() - barrelImg:getHeight())
end

--------------------------------------------------------------------
-----LOVE.LOAD()
-----this loads everything we need to update and use
------------------------------------------------------------------
function love.load()
-----scene control. Arbitrarily 1 = game, 2 = game over
  scene = 1
  ----Load the images we need
  bulletImg = love.graphics.newImage("tank_bullet1.png")
  barrelImg = love.graphics.newImage("tanks_barrelGreen.png")
  explosionImg = love.graphics.newImage("tank_explosion4.png")

  ----we know that we need the x and y values of the bullets currently on the screen
  bulletsX = {}
  bulletsY = {}

  ----we know we need the x and y values of the barrels (things to shoot)
  barrelsX = {}
  barrelsY = {}

  ----set up randomization for initial barrel
  math.randomseed(os.time())
  math.random(); math.random(); math.random()

  ----set up the initial barrel(s) at their random location
  count = 5
  while count > 0 do

    barrelSpawn()
    count = count - 1
  end

  barrelTimer = 2 --for a new barrel every 2 seconds
  barrelSpeed = 25

  -----explosions
  explosionsX = {}
  explosionsY = {}
  explosionTimer = {}
  explosionSet = {}

  -----scoring
  score = 0
end



--------------------------------------------------------------------
-----LOVE.MOUSEPRESSED()
-----check if the mouse was pressed
------------------------------------------------------------------
function love.mousepressed(x, y, button, istouch) --this is a built in function
   if button == 1 then --if left click
    if scene == 1 then
    -----Store the bullet location to match the clicked location
      bulletsX[#bulletsX + 1] = x
      bulletsY[#bulletsY + 1] = y
    ------Print out (temporarily) where you clicked
      print (bulletsX[#bulletsX])
      print (bulletsY[#bulletsY])
    end
   end
end

--------------------------------------------------------------------
-----LOVE.UPDATE()
-----all the behind the scene updates
------------------------------------------------------------------
function love.update(dt)
  if scene == 1 then
    --check for collision between barrels and bullets
    for a,b in ipairs(barrelsX) do
      for c,d in ipairs(bulletsX) do
        ----check if the right edge of the bullet is greater than left edge of barrel
        -----and
        -----left edge of bullet is less than the right edge of barrel
        -----bottom of bullet is less than bottom of the barrel
        -----and 
        ----- top of bullet is greater than top of barrel
        if bulletsX[c] and barrelsX[a] then
          if bulletsX[c] + bulletImg:getWidth() > barrelsX[a] and
            bulletsX[c] < barrelsX[a] + barrelImg:getWidth() and
            bulletsY[c] + bulletImg:getHeight() < barrelsY[a] + barrelImg:getHeight() and
            bulletsY[c] > barrelsY[a] then
            -----setup explosion at bullet tip and delete barrel
            
              explosionsX[#explosionsX + 1] = bulletsX[c] + bulletImg:getWidth() - (explosionImg:getWidth()/2)
              explosionsY[#explosionsY + 1] = bulletsY[c] + (bulletImg:getHeight()/2) - (explosionImg:getHeight()/2)
              explosionTimer[#explosionTimer + 1] = 2
              table.remove(barrelsX, a)
              table.remove(barrelsY, a)
              table.remove(bulletsX, c) 
              table.remove(bulletsY, c)
              ----new barrel
              barrelSpawn()
              ----Add 1 to score
              score = score + 1
          end
        end
      end 

      ---barrelMovement
      if barrelsX[a] then
        barrelsX[a] = barrelsX[a] - barrelSpeed * dt
      end
      ---gameOver checker
      if barrelsX[a] < 0 then
        scene = 2
      end

    end
    
    ---for each bullet in the bullet list, make it move on the x, delete if over screen
    for i,v in ipairs(bulletsX) do
      bulletsX[i] = bulletsX[i] + 2 ----movement
      if bulletsX[i] > love.graphics.getWidth() then ---if bullet is off screen
        table.remove(bulletsX, i) 
        table.remove(bulletsY, i)
        -----we remove so it doesn't infinitely continue and infinitely balloon our table
      end
    end

    ---timer loops
    -----explosions
    for e,f in ipairs (explosionTimer) do

      explosionTimer[e] = explosionTimer[e] - dt
      print (explosionTimer[e])
      -----if countdown is reached, remove explosion image
      if explosionTimer[e] <= 0 then
        table.remove(explosionsX, e)
        table.remove(explosionsY, e)
        table.remove(explosionTimer, e)
      end
    end

  -------new barrels
    if barrelTimer <= 0 then
      barrelSpawn()
      barrelTimer = 2
    elseif barrelTimer > 0 then
      barrelTimer = barrelTimer - dt
    end
  end
end

--------------------------------------------------------------------
-----LOVE.DRAW()
-----all the visuals
------------------------------------------------------------------
function love.draw()
  if scene == 1 then
    -----If there are any bullets existing
    if #bulletsX > 0 then
      --------for the index and value (your basic for each loop)
      for i,v in ipairs (bulletsX) do
        -------draw the thing at the values in the X and Y table
        love.graphics.draw(bulletImg, bulletsX[i], bulletsY[i])
      end
    end
    -----If there are any barrels existing
    if #barrelsX > 0 then
      --------for the index and value (your basic for each loop)
      for i,v in ipairs (barrelsX) do
        -------draw the thing at the values in the X and Y table
        love.graphics.draw(barrelImg, barrelsX[i], barrelsY[i])
      end
    end
    --------If there are any explosions existing
    if #explosionsX > 0 then
      --------for the index and value (your basic for each loop)
      for a,b in ipairs (explosionsX) do
        -------draw the thing at the values in the X and Y table
        love.graphics.draw(explosionImg, explosionsX[a], explosionsY[a])
      end
    end
    love.graphics.setFont(love.graphics.newFont(25))
    love.graphics.printf("Score: "..score ,0, 0, 200, "center")
  end
  if scene == 2 then
    love.graphics.setFont(love.graphics.newFont(100))
    love.graphics.printf("Game Over",0,200, 800, "center")
  end
end



