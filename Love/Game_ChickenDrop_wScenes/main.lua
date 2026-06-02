--Chicken Drop
--This game drops chickens from the sky.
--Player clicks them to send them back.
--If chickens hit ground, game over.

function titleLoad()
  chickenImage = love.graphics.newImage("chicken.png")
  titleText = "Chicken Drop"
end

function titleDraw()
  --create text 100 pt stretches across the screen at 200 y and centered
  love.graphics.setFont(love.graphics.newFont(100))
  love.graphics.printf(titleText, 0, 200, 800, "center")


  --create a button
  love.graphics.setColor(1,1,1)
  love.graphics.rectangle("fill", 50, 450, 250, 100, 10, 10, 6)
  love.graphics.setColor(1,0,0)
  love.graphics.setFont(love.graphics.newFont(75))
  love.graphics.printf("PLAY", 50, 450, 250, "center")

  love.graphics.setColor(1,1,1)
end

-------------------------------------------
-- Load all the stuff
-------------------------------------------
function love.load()
  scene = 0 --start screen
  titleLoad()
  roosterface = love.graphics.newImage("chicken.png")

  math.randomseed(os.time())
  math.random(); math.random(); math.random();


  startX = {math.random(0, love.graphics.getWidth() - roosterface:getWidth()),
            math.random(0, love.graphics.getWidth() - roosterface:getWidth()),
            math.random(0, love.graphics.getWidth() - roosterface:getWidth()),
            math.random(0, love.graphics.getWidth() - roosterface:getWidth()),
            math.random(0, love.graphics.getWidth() - roosterface:getWidth())
           }
  startY = {0 - math.random(roosterface:getHeight(), roosterface:getHeight() * 2),
            0 - math.random(roosterface:getHeight(), roosterface:getHeight() * 2),
            0 - math.random(roosterface:getHeight(), roosterface:getHeight() * 2),
            0 - math.random(roosterface:getHeight(), roosterface:getHeight() * 2),
            0 - math.random(roosterface:getHeight(), roosterface:getHeight() * 2)
           }

  maxSpeed = 150
  minSpeed = 20
  speed = {math.random(minSpeed, maxSpeed),
  math.random(minSpeed, maxSpeed),
  math.random(minSpeed, maxSpeed),
  math.random(minSpeed, maxSpeed),
  math.random(minSpeed, maxSpeed)
  }
end


-------------------------------------------
-- checks mouse presses
-------------------------------------------
function love.mousepressed(x, y, button, istouch)
  if (button == 1) then
    --print ("Left mouse click"..x.." "..y)
    if scene == 0 then
    if x >= 50 and x <= 300 and y >=450 and y <= 550 then
        scene = 1 --go to play area
      end
    end
    if scene == 1 then --game scene
      for i, value in ipairs(startX) do
        if x >= startX[i] and x <= startX[i] + roosterface:getWidth() and
          y >= startY[i] and y <= startY[i] + roosterface:getHeight() then
          --print("in bounds")
          math.randomseed(os.time())
          math.random(); math.random(); math.random();
          startY[i] = 0 - math.random(roosterface:getHeight(), roosterface:getHeight() * 2)
          speed[i] = math.random(minSpeed, maxSpeed)
          break
        end
      end
    end
  end
end


-------------------------------------------
-- Update the values
-------------------------------------------
function love.update(dt)
  if scene == 1 then
    for i, value in ipairs(startX) do
      if startY[i] + roosterface:getHeight() >= love.graphics.getHeight() then
        print("Over the Edge")
        love.event.quit("restart")
      end
      startY[i] = startY[i] + speed[i] * dt
    end
  end
end


-------------------------------------------
-- Draw to the screen
-------------------------------------------
function love.draw()
  if scene == 0 then
    titleDraw()
  end
  if scene == 1 then
    for i, value in ipairs(startX) do
      love.graphics.draw(roosterface, startX[i], startY[i])
    end
  end
end