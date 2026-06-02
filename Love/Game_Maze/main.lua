-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------
--------------------MAZE SETUP-----------------------------
-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------

function mazeGraph(y, x, s, f) -- where Y is blank and x is walls
                               -- where s is start and f is finish
  
  mazeSetup ={
              s, x, y, y, y, y, y, y, y, y, y, y, 
              y, x, y, x, x, y, y, x, x, x, y, y,
              y, x, y, y, y, x, y, y, x, y, y, x,
              y, x, y, x, y, y, x, y, x, y, y, f, 
              y, x, y, x, x, y, x, x, y, x, x, x,
              y, x, x, y, x, y, x, x, y, x, y, x,
              y, y, y, y, y, y, y, y, y, y, x, x

             }
  
  return mazeSetup
end

function mazeImages()
  ground = love.graphics.newImage("ground_06.png")
  wall = love.graphics.newImage("crate_13.png")
  start = love.graphics.newImage("ground_06.png")
  finish = love.graphics.newImage("ground_05.png")

  mazeWithImages = mazeGraph(ground, wall, start, finish)
  return mazeWithImages
end

-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------
--------------------Love.Load------------------------------
-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------

function love.load()
gameOver = false
timer = 0
endTime = 0

  --------PlayerSetup-------
  --========================
  --------------------------
    playerChar = {
                  love.graphics.newImage("player_23.png"), --idle
                  love.graphics.newImage("player_01.png"), --down
                  love.graphics.newImage("player_03.png"), --up
                  love.graphics.newImage("player_12.png"), --right
                  love.graphics.newImage("player_15.png") --left
                 }
  playerX = 0
  playerY = 0
  playerFinishX = 0
  PlayerFinishY = 0
  playerSpeed = 64
  direction = 1
  

  --Set Start and Finish Locations--
  --================================
  ----------------------------------
  mazeCollisionChecker = mazeGraph("path", "collider", "start", "finish")
  ---Track the left top corner coordinates for each tile
  mazeCollisionX = {} 
  mazeCollisionY = {}
  rowCount = 0
  columnCount = 0
  for i,v in ipairs(mazeCollisionChecker) do
    if math.fmod(i, 12) == 0 then
      if mazeCollisionChecker[i] == "start" then
        playerX = columnCount * 64
        playerY = rowCount * 64
      end

      if mazeCollisionChecker[i] == "finish" then
        playerFinishX = columnCount * 64
        playerFinishY = rowCount * 64
      end

      mazeCollisionX[i] = columnCount*64
      mazeCollisionY[i] = rowCount*64
      rowCount = rowCount + 1
      columnCount = 0
    else
      if mazeCollisionChecker[i] == "start" then
        playerX = columnCount * 64
        playerY = rowCount * 64
      end

      if mazeCollisionChecker[i] == "finish" then
        playerFinishX = columnCount * 64
        playerFinishY = rowCount * 64
      end

      mazeCollisionX[i] = columnCount*64
      mazeCollisionY[i] = rowCount*64
      columnCount = columnCount + 1
    end
  end
end


-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------
-----------------COLLISION CHECKERS------------------------
-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------
-----check if the block below the player is a path
function collisionCheckDown()
  for i,v in ipairs(mazeCollisionX) do
    if playerX + 0 == mazeCollisionX[i] and 
       playerY + 64 == mazeCollisionY[i] and
       (mazeCollisionChecker[i] == "path" or
        mazeCollisionChecker[i] == "start" or
        mazeCollisionChecker[i] == "finish" )then
        direction = 2
        return true
        --break
    end  
  end
end


function collisionCheckUp()
  for i,v in ipairs(mazeCollisionX) do
    if playerX + 0 == mazeCollisionX[i] and 
       playerY - 64 == mazeCollisionY[i] and
       (mazeCollisionChecker[i] == "path" or 
        mazeCollisionChecker[i] =="start" or
        mazeCollisionChecker[i] == "finish")  then
        direction = 3
        return true
        --break
    end  
  end
end

function collisionCheckLeft()
  for i,v in ipairs(mazeCollisionX) do
    if playerX - 64 == mazeCollisionX[i] and 
       playerY + 0 == mazeCollisionY[i] and
       (mazeCollisionChecker[i] == "path" or 
        mazeCollisionChecker[i] == "start" or
        mazeCollisionChecker[i] == "finish")  then
        direction = 5
        return true
        --break
    end  
  end
end

function collisionCheckRight()
  for i,v in ipairs(mazeCollisionX) do
    if playerX + 64 == mazeCollisionX[i] and 
       playerY + 0 == mazeCollisionY[i] and
       (mazeCollisionChecker[i] == "path" or 
        mazeCollisionChecker[i] == "start" or
        mazeCollisionChecker[i] == "finish")  then
        direction = 4
        return true
        --break
    end  
  end
end

-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------
--------------------Love.Update----------------------------
-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------

function love.update (dt)
  --collisionCheckDown()
  ---Doing this as seperate if statements,
  --it means that diagonals can happen.
  --If you don't want diagonals, you could use an if/else
  --or another way of limiting it.
  if gameOver == false then
    timer = timer + dt
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
      if collisionCheckDown() == true then
        playerY = playerY + playerSpeed 
      end
    end

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
      if collisionCheckUp() == true then
        playerY = playerY - playerSpeed
      end
    end

    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
      if collisionCheckLeft() == true then
        playerX = playerX - playerSpeed
      end
    end

      if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
      if collisionCheckRight() == true then
        playerX = playerX + playerSpeed
      end
    end

    if playerX == playerFinishX and playerY == playerFinishY then
      gameOver = true
    end

  end
  if gameOver == true and love.keyboard.isDown("space") then
    playerX = 0
    playerY = 0
    direction = 1
    endTime = timer
    timer = timer-endTime
    gameOver = false
  end

  


end




-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------
--------------------Drawing the Board----------------------
-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------
function drawTheBoard()
  count = 0 --so we can set up the rows
  countx = 0 --so we can set up the columns
  for i = 1, #mazeImages(), 1 do --iterate through the watermap table
    love.graphics.setColor(1,1,1) --make sure it's set to white/no overlay color
    love.graphics.draw(mazeImages()[i], 0 + (64* countx), 0 + (64 * count))

    if math.fmod(i, 12) ==0 then --hard coded 25, this is how many tiles we have per row
      count = count + 1 --go down a row
      countx = 0 --reset the column back to the left
    else
      countx = countx + 1 --increase the column count
    end
  end
end



-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------
--------------------Love.Draw------------------------------
-----------------------------------------------------------
--=======================================================--
-----------------------------------------------------------

function love.draw()
  if gameOver == false then
    drawTheBoard()
    love.graphics.draw(playerChar[direction], playerX, playerY)
    love.graphics.print("endPoint", playerFinishX, playerFinishY)
    love.graphics.print(timer, 700, 500)
  else
    love.graphics.print("GAME OVER Press Space to play again", 0, 0)
  end

end