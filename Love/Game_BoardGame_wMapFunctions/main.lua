--Create a "board game"
--needs:
-------Spaces (map out board)
-------character
-------dice
-------movement
------------------------------------------------------
--*************************************************
--This function takes our initial map and translates it over to tiles. 
--we say that 1 is our normal tiles,
--3 is the start of the path,
--4 is the end of the path
function pathSetup(mapTable, tileTable, startTile, endTile)
  graphicsTable = mapTable

  math.randomseed(os.time())
  math.random(); math.random(); math.random()
  for i,v in ipairs(graphicsTable)do
    if graphicsTable[i] == 1 then
      graphicsTable[i] = tileTable[math.random(1, #tileTable)]
    elseif graphicsTable[i] == 3 then
      graphicsTable[i] = startTile
    elseif graphicsTable[i] == 4 then
      graphicsTable[i] = endTile 
    end
  end
  return graphicsTable
end
------------------------------------------------------------------
--This function takes a table of 0s and images 
--If it's an image, it draws it at the position,
--and for every index (whether it's a zero or image).
--it increases the x draw point
--and if it's at the end of line(the width),
--it resets x back to the left and goes down one tile set on the y
function drawPath (graphicsPathTable, offsetX, offsetY, tileSize, tileNumWidth)
  local drawPointX = offsetX
  local drawPointY = offsetY

  love.graphics.setColor(1,1,1)
  for i,v in ipairs(graphicsPathTable) do
    if graphicsPathTable[i] ~= 0 then
      love.graphics.draw(graphicsPathTable[i], drawPointX, drawPointY)
    end

    drawPointX = drawPointX + tileSize

    if math.fmod(i, tileNumWidth) == 0 then
      drawPointX = offsetX
      drawPointY = drawPointY + tileSize
    end
  end
end
--------------------------------------------------------------------
--set initial position, graphic, and index
function initialPlayerInfo(playerImage, posX, posY, currentIndex, playerName)
  local playerInfo = {picture = love.graphics.newImage(playerImage), 
                      xVal = posX, 
                      yVal = posY, 
                      playerIndex = currentIndex,
                      playerName = playerName}
  return playerInfo

end
-------------------------------------------------------------------
--this function moves the player using a flow table corresponding to our map
--where 0 is no movement, 1 is right, 2 down, 3 up, 4 left
function movePlayer(playerInfo, flowTable, moves, tileSize, tileNumWidth)
  while moves>0 do
    --check right move
    if flowTable[playerInfo.playerIndex] == 1 then
      playerInfo.playerIndex = playerInfo.playerIndex + 1
      playerInfo.xVal = playerInfo.xVal + tileSize
    --check down move
    elseif flowTable[playerInfo.playerIndex] == 2 then
      playerInfo.playerIndex = playerInfo.playerIndex + tileNumWidth
      playerInfo.yVal = playerInfo.yVal + tileSize
    --check up move
      elseif flowTable[playerInfo.playerIndex] == 3 then
      playerInfo.playerIndex = playerInfo.playerIndex - tileNumWidth
      playerInfo.yVal = playerInfo.yVal - tileSize
    --check left move
      elseif flowTable[playerInfo.playerIndex] == 4 then
      playerInfo.playerIndex = playerInfo.playerIndex - 1
      playerInfo.xVal = playerInfo.xVal - tileSize
    end
    moves = moves -1
  end 
end

-------------------------------------------------------------------------
--Check if player has won
--we've added a 5 in our flow table to indicate
--the spot to be to win
function checkGameOver(playerName, playerIndex, flowTable, winNum)
  if flowTable[playerIndex] == winNum then
    gameOver = true
    winner = playerName
  else
    gameOver = false
  end
  return gameOver
end




------------------------------------------------------
------------------------------------------------------
--Load function, this primes everything for use
function love.load()
  --Player images and player values
  player1 = initialPlayerInfo("player_purple.png", 16, 64, 13, "Player 1")
  player2 = initialPlayerInfo("player_green.png", 16, 64, 13, "Player 2")

  
  --sets up the dice so that the index matches the pic
  die = {love.graphics.newImage("die_1.png"),
        love.graphics.newImage("die_2.png"),
        love.graphics.newImage("die_3.png"),
        love.graphics.newImage("die_4.png"),
        love.graphics.newImage("die_5.png"),
        love.graphics.newImage("die_6.png")
  }
  --sets up tiles available
  tiles = { love.graphics.newImage("tile_green.png"),
            love.graphics.newImage("tile_blue.png"),
            love.graphics.newImage("tile_orange.png"),
            love.graphics.newImage("tile_special.png")
  }


  --initial text version of the map
  mapSetup = {0,0,0,0,0,0,0,0,0,0,0,0,
              0,3,1,0,0,1,1,1,0,1,4,0,
              0,0,1,0,0,1,0,1,0,1,0,0,
              0,0,1,0,1,1,0,1,0,1,0,0,
              0,0,1,0,1,0,0,1,0,1,0,0,
              0,0,1,1,1,0,0,1,0,1,0,0,
              0,0,0,0,0,1,1,1,0,1,0,0,
              0,0,0,0,0,1,0,0,0,1,0,0,
              0,0,0,0,0,1,1,1,1,1,0,0,
              }

  --this chart helps us with directions
  --1 = move right
  --2 = move down 
  --3 = move up 
  --4 = move left 
  flowSetup ={0,0,0,0,0,0,0,0,0,0,0,0,
              1,1,2,0,0,1,1,2,0,1,1,5,
              0,0,2,0,0,3,0,2,0,3,0,0,
              0,0,2,0,1,3,0,2,0,3,0,0,
              0,0,2,0,3,0,0,2,0,3,0,0,
              0,0,1,1,3,0,0,2,0,3,0,0,
              0,0,0,0,0,2,4,4,0,3,0,0,
              0,0,0,0,0,2,0,0,0,3,0,0,
              0,0,0,0,0,1,1,1,1,3,0,0,
              }

  
  tileMap = pathSetup(mapSetup, tiles, tiles[1], tiles[3])

  diceRoll = nil
  player1Turn = true
  gameOver = false
 
end

function love.keypressed(key) 
    if key == "space" then
      if not gameOver then
        math.randomseed(os.time())
        math.random(); math.random(); math.random()

        diceRoll = math.random(1, #die)
        if player1Turn then
          movePlayer(player1, flowSetup, diceRoll, 64, 12)
          checkGameOver(player1.playerName, player1.playerIndex, flowSetup, 5)
          player1Turn = false
        else
          movePlayer(player2, flowSetup, diceRoll, 64, 12)
          checkGameOver(player2.playerName, player2.playerIndex, flowSetup, 5)
          player1Turn = true
        end
      else
        love.event.quit("restart")
      end
    end
end

function love.update(dt)

end

function love.draw()
  --left rectangle
  love.graphics.setColor(.3, 0, 0)
  love.graphics.rectangle("fill", 0, 0, 64 + 16, love.graphics.getHeight())

  --right rectangle
  love.graphics.setColor(0, .3, 0)
  love.graphics.rectangle("fill", love.graphics.getWidth()-(64 + 16), 0, 64 + 16, love.graphics.getHeight())

  --drawMap
  drawPath(tileMap, 16, 12, 64, 12)

  --drawPlayers
    love.graphics.draw(player2.picture, player2.xVal, player2.yVal)
    love.graphics.draw(player1.picture, player1.xVal, player1.yVal)


  --draw die
  if diceRoll ~= nil then
    love.graphics.draw(die[diceRoll], 176, 460)
  end

  if gameOver then  
    love.graphics.setFont(love.graphics.newFont(100))
    love.graphics.printf("The winner is: " .. winner,0,200, 800, "center")

    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.printf("Press Space to Restart", 0,0,800, "center")
  end

  if not gameOver then
    love.graphics.print("Press space to roll the die", 100, 550)
  end
end
