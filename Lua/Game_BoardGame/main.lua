--Create a "board game"
--needs:
-------Spaces (map out board)
-------character
-------dice
-------movement
------------------------------------------------------
--**************************************************--
--NOTE: PRESS THE SPACE BAR TO ROLL THE DICE 
--This was not written to be pretty or efficient,
--it was written to help a beginner coder group
--understand some strategies and
--ways of going about things.
--As such, it uses very little intermediate or 
--advanced techniques and is sorely missing out
--on functions.
--Plan is to make a second version showing functions


------------------------------------------------------
------------------------------------------------------
--Load function, this primes everything for use
function love.load()
  --Player images and player values
  player1 = love.graphics.newImage("player_purple.png")
  player2 = love.graphics.newImage("player_green.png")

  player1X = 16 
  player1Y = 64
  player2X = 16 
  player2Y = 64
  player1Move = false
  player2Move = false
  player1Index = 13
  player2Index = 13
  moveCounter = 0
  firstMove = true
  gameOver = false
  
  --sets up the dice so that the index matches the pic
  die = {love.graphics.newImage("die_1.png"),
        love.graphics.newImage("die_2.png"),
        love.graphics.newImage("die_3.png"),
        love.graphics.newImage("die_4.png"),
        love.graphics.newImage("die_5.png"),
        love.graphics.newImage("die_6.png")
  }
  --sets up tiles available
  tiles = { love.graphics.newImage("tile_blue.png"),
            love.graphics.newImage("tile_green.png"),
            love.graphics.newImage("tile_orange.png"),
            love.graphics.newImage("tile_special.png")
  }

  --sets up some info for the dice and tiles
  diceRoll = 0
  offsetH = 16
  offsetV = 12

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
  --this looks the same as mapSetup
  --but we eventually use it to store the 
  --actual tiles in the spaces rather than
  --just numbers
  graphicsMap = {0,0,0,0,0,0,0,0,0,0,0,0,
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
              1,1,2,0,0,1,1,2,0,1,1,0,
              0,0,2,0,0,3,0,2,0,3,0,0,
              0,0,2,0,1,3,0,2,0,3,0,0,
              0,0,2,0,3,0,0,2,0,3,0,0,
              0,0,1,1,3,0,0,2,0,3,0,0,
              0,0,0,0,0,2,4,4,0,3,0,0,
              0,0,0,0,0,2,0,0,0,3,0,0,
              0,0,0,0,0,1,1,1,1,3,0,0,
              }

  --sets up random so we can randomize how the
  --tiles lay
  math.randomseed(os.time())
  math.random(); math.random(); math.random()
  --populate graphicsMap with tiles instead of numbers
  for i,v in ipairs (graphicsMap) do
    if graphicsMap[i] == 3 then
      graphicsMap[i] = tiles[2]
    end 
    if graphicsMap[i] == 4 then
      graphicsMap[i] = tiles[3]
    end
    
    if graphicsMap[i] == 1 then
      graphicsMap[i] = tiles[math.random(1, #tiles)]
    end
  end
  --sets up variables for where we are going to draw each tile
  drawPointX = offsetH
  drawPointY = offsetV
end

----------------------------------------------------
----------------------------------------------------
--There are a few ways to check key presses, 
--I like this external function. Because I do.

function love.keypressed(key)
  if gameOver == false then
    if key == "space" then
      math.randomseed(os.time());
      math.random(); math.random(); math.random();

      diceRoll = math.random(1,#die)
      moveCounter = diceRoll

      --switch players that the dice moves
      if firstMove then
        player1Move = true
        firstMove = false
      else 
        player2Move = true
        firstMove = true
      end
    end
  end
end
-----------------------------------------------------
-----------------------------------------------------
--This is update, it controls things that happen each
--frame. It's where we check to see how we're
--we don't use dt in this example, but dt stands for
--delta time, a measure in the change of time
--this is used for movement to get things to be more 
--smooth as it makes how far we've moved each frame
--dependant on the time that has past between frames
--rather than just the frame change.
function love.update(dt)
  --player1 turn
  while player1Move do
    while moveCounter > 0 do
      --check to the right
      if flowSetup[player1Index] == 1 then
        player1Index = player1Index + 1 
        player1X = player1X + 64
        print("moveRight " .. moveCounter )
      --check if down
      elseif flowSetup[player1Index] == 2 then
        player1Index = player1Index + 12
        player1Y = player1Y + 64
        print("moveDown " .. moveCounter)
      --check if up
      elseif flowSetup[player1Index] == 3 then
        player1Index = player1Index - 12
        player1Y = player1Y - 64
        print("moveUp ".. moveCounter)
      --check if left
      elseif flowSetup[player1Index] == 4 then
        player1Index = player1Index - 1 
        player1X = player1X - 64
        print("moveLeft " .. moveCounter )
      end
      --if we land on the tile that is marked the end
      if mapSetup[player1Index] == 4 then
        gameOver = true
        winner = "player 1"
        break
      end
      moveCounter = moveCounter-1       
    end
  player1Move = false
  end  


  while player2Move do
    while moveCounter > 0 do
      --check to the right
      if flowSetup[player2Index] == 1 then
        player2Index = player2Index + 1 
        player2X = player2X + 64
        print("moveRight " .. moveCounter )
      --check if down
      elseif flowSetup[player2Index] == 2 then
        player2Index = player2Index + 12
        player2Y = player2Y + 64
        print("moveDown " .. moveCounter)
      --check if up
      elseif flowSetup[player2Index] == 3 then
        player2Index = player2Index - 12
        player2Y = player2Y - 64
        print("moveUp ".. moveCounter)
      --check if left
      elseif flowSetup[player2Index] == 4 then
        player2Index = player2Index - 1 
        player2X = player2X - 64
        print("moveLeft " .. moveCounter )
      end
      --if we land on a tile that is marked the end
      if mapSetup[player2Index] == 4 then
        gameOver = true
        winner = "player 2"
        break
      end
      moveCounter = moveCounter-1       
    end
    player2Move = false
  end  
end
-----------------------------------------------------
-----------------------------------------------------
--Draw the stuff. Don't be fooled into thinking that
--this draws things once.
--It continuously draws each frame.
--This means that if you manipulate variables here, 
--they can continue to change and cause animation...
--So make sure to reset anything that needs
--to start back at a specific place when you call draw
--again (like we do with how we draw our map.)
function love.draw()
  love.graphics.setColor(1,1,1)
    --left rectangle
  love.graphics.setColor(.3, 0, 0)
  love.graphics.rectangle("fill", 0, 0, 64 + offsetH, love.graphics.getHeight())

  --right rectangle
  love.graphics.setColor(0, .3, 0)
  love.graphics.rectangle("fill", love.graphics.getWidth()-(64 + offsetH), 0, 64 + offsetH, love.graphics.getHeight())
  
  if diceRoll > 0 then
    love.graphics.setColor(1,1,1)
    love.graphics.draw(die[diceRoll], 176, 460)
  end

  ---Draw the tiles
  love.graphics.setColor(1,1,1)
  for i,v in ipairs (graphicsMap) do
    if graphicsMap[i] ~=0 then
      love.graphics.draw(graphicsMap[i], drawPointX, drawPointY)
    end

    drawPointX = drawPointX + 64
    if math.fmod(i,12) == 0 then
      drawPointX = offsetH
      drawPointY = drawPointY+ 64
    end
  end

----Make sure to reset drawPoint so
-----things don't move.
  drawPointX = offsetH
  drawPointY = offsetV

----draw player 2 first so it's under player 1
  love.graphics.draw(player2, player2X, player2Y)
  love.graphics.draw(player1, player1X, player1Y)


if gameOver then  
  love.graphics.setFont(love.graphics.newFont(100))
  love.graphics.printf("The winner is: " .. winner,0,200, 800, "center")
end

  
end