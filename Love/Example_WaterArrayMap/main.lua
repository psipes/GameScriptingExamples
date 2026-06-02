function love.load()
  tiles = 8
  scorebuffer = 30
  wave = love.graphics.newImage("wave.png")
  water = love.graphics.newImage("water.png")
  waveW = wave:getWidth()
  waveH = wave:getHeight()
  --placeholder table
  v = "v" --wave
  o = "o" --water
  waterMap = {v, v, v, v, v, v, v, v,
              o, o, o, o, o, o, o, o,
              o, o, o, o, o, o, o, o,
              o, o, o, o, o, o, o, o,
              o, o, o, o, o, o, o, o,
              o, o, o, o, o, o, o, o,
              o, o, o, o, o, o, o, o,
              o, o, o, o, o, o, o, o}

  --switch over to our actual images
  for i, value in ipairs(waterMap) do
    if waterMap[i] == v then
      waterMap[i] = wave
    end
    if waterMap[i] == o then
      waterMap[i] = water
    end
  end
  
  --set the title
  love.window.setTitle("Fish Tank")
  --set the background color
  love.graphics.setBackgroundColor(.2,.1,.5)
  --set window size
  love.window.setMode(wave:getWidth() * tiles, wave:getHeight() * tiles + scorebuffer)
 
end

function love.update(dt)
end

function drawWater()
  count = 0 -- count rows
  countx = 0 -- count columns
  for i = 1, #waterMap, 1 do --iterate through each element of watermap
    love.graphics.setColor(1, 1, 1) --make sure clear color
    love.graphics.draw(waterMap[i], 0 + (waveW * countx), scorebuffer + (waveH * count))
    if math.fmod(i, tiles)  == 0 then
      count = count + 1 -- go down a row
      countx = 0 --reset to left column
    else
      countx = countx + 1
    end
  end
end

function love.draw()
  drawWater()
end