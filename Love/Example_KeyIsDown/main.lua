function love.load()
  recX = 100
end

function love.update(dt)
  --print (dt)
  if love.keyboard.isDown("d") then
    recX = recX + 50 * dt
  end
end

function love.draw()
    love.graphics.rectangle("line", recX, 50, 200, 150)
end
