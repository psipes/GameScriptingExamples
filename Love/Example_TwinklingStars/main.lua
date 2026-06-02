--This code is for Lua using LOVE ENGINE
--Draws count # of stars (points) at random coords and random colors
--Changes color every update to get twinkle effect

function love.load()
  math.randomseed(os.time())
  math.random(); math.random(); math.random()

  count = 100
  stars = {}
  while count > 0 do
    stars[#stars + 1] = math.random(0, 800)
    stars[#stars + 1] = math.random(0, 600)
    count = count - 1

    x = 0
    rectDimensions = {100, 50}
    movingRight = true
  end

  --print (stars[5])
end

function love.update(dt)
  if movingRight then
    if (x < love.graphics.getWidth() - rectDimensions[1]) then
      x = x + 50 * dt
    else
      movingRight = false
    end
  else
    if (x > 0) then
      x = x - 50 * dt
    else
      movingRight = true
    end
  end
end

function love.draw()
  --this line can be commented out or changed to not random to be a static color.
  --random gives you a nice blinky effect
  --the last value is the transparency--between 0 and 1
  love.graphics.setColor(math.random(), math.random(), math.random(), .22)
  love.graphics.setPointSize(10)
  love.graphics.points(stars)
  
  --this makes sure the actual star is white
  love.graphics.setColor(255, 255, 255, 1)
  love.graphics.setPointSize(2)
  love.graphics.points(stars)
  
  love.graphics.setColor(255,255,255, 1)
  love.graphics.rectangle("fill", x, 100, rectDimensions[1], rectDimensions[2])
end