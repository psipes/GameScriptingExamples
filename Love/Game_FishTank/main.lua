
--------------------------------------------------------------------
---------
---------PRELOADING FUNCTIONS
---------These set up the image tables so that load doesn't
---------look an utter mess
--------------------------------------------------------------------
function loadWater()
  water =  {
            love.graphics.newImage ("fishTile_089.png")
           }
  return water
end

function loadWave()
  wave = {love.graphics.newImage("fishTile_088.png")}
  return wave
end

function loadSandChunks()
  sandChunk = {
                love.graphics.newImage("fishTile_036.png"),
                love.graphics.newImage("fishTile_037.png"),
                love.graphics.newImage("fishTile_054.png"),
                love.graphics.newImage("fishTile_055.png")
              }
  return sandChunk
end

function loadSandEdges()
  sandEdge =  {
                love.graphics.newImage("fishTile_039.png"),
                love.graphics.newImage("fishTile_040.png"),
                love.graphics.newImage("fishTile_041.png"),
                love.graphics.newImage("fishTile_043.png"),
                love.graphics.newImage("fishTile_045.png"),
                love.graphics.newImage("fishTile_056.png"),
                love.graphics.newImage("fishTile_057.png"),
                love.graphics.newImage("fishTile_058.png"),
                love.graphics.newImage("fishTile_059.png"),
                love.graphics.newImage("fishTile_063.png")
              }
  return sandEdge
end

function loadFlora()
  flora =  {
                love.graphics.newImage("fishTile_010.png"),
                love.graphics.newImage("fishTile_011.png"),
                love.graphics.newImage("fishTile_012.png"),
                love.graphics.newImage("fishTile_013.png"),
                love.graphics.newImage("fishTile_014.png"),
                love.graphics.newImage("fishTile_015.png"),
                love.graphics.newImage("fishTile_016.png"),
                love.graphics.newImage("fishTile_017.png"),
                love.graphics.newImage("fishTile_028.png"),
                love.graphics.newImage("fishTile_029.png"),
                love.graphics.newImage("fishTile_030.png"),
                love.graphics.newImage("fishTile_031.png"),
                love.graphics.newImage("fishTile_032.png"),
                love.graphics.newImage("fishTile_033.png"),
                love.graphics.newImage("fishTile_034.png"),
                love.graphics.newImage("fishTile_035.png"),
                love.graphics.newImage("fishTile_046.png"),
                love.graphics.newImage("fishTile_047.png"),
                love.graphics.newImage("fishTile_048.png"),
                love.graphics.newImage("fishTile_049.png"),
                love.graphics.newImage("fishTile_050.png"),
                love.graphics.newImage("fishTile_051.png"),
                love.graphics.newImage("fishTile_052.png"),
                love.graphics.newImage("fishTile_053.png"),
                love.graphics.newImage("fishTile_082.png"),
                love.graphics.newImage("fishTile_083.png"),
                love.graphics.newImage("fishTile_084.png"),
                love.graphics.newImage("fishTile_085.png"),
                love.graphics.newImage("fishTile_089.png")
              }
  return flora

end

function loadRandomFish()
  fishies = {
             love.graphics.newImage("fishTile_073.png"),
             love.graphics.newImage("fishTile_075.png"),
             love.graphics.newImage("fishTile_077.png"),
             love.graphics.newImage("fishTile_079.png"),
             love.graphics.newImage("fishTile_081.png") 

            }
  return fishies

end

--------------------------------------------------------------------
---------
---------MAP: Water
---------Draw the map
--------------------------------------------------------------------
function waterDraw(waterTiles, waterEdgeTiles)
  v = "v"
  w = "w"

  theWaterMap = {v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v, v,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w,
                 w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w, w
                }

  for i, value in ipairs(theWaterMap) do
    if theWaterMap[i] == v then
      theWaterMap[i] = waterEdgeTiles[1]
    end

    if theWaterMap[i] == w then
      theWaterMap[i] = waterTiles[1]
    end


  end
  return theWaterMap
  
end

--------------------------------------------------------------------
---------
---------MAP: Land
---------Draw the map
--------------------------------------------------------------------
function landDraw(landTiles, landEdgeTiles)
  math.randomseed(os.time())
  math.random(); math.random(); math.random()
  v = "v"
  w = "w"
  z = "z"
  y = "y"
  x = "x"
  theLandMap = {x, x, y, y, x, y, x, x, x, y, y, y, x, y, y, x, x, x, y, x, y, y, x, x, x,
            x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x,
            x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, 
            x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x, x  
            }

  for i, value in ipairs(theLandMap) do
    
    if theLandMap[i] == y then
      theLandMap[i] = landEdgeTiles[math.random(#landEdgeTiles)]
    end
    if theLandMap[i] == x then
      theLandMap[i] = landTiles[math.random(#landTiles)]
    end

  end
  return theLandMap
end


--------------------------------------------------------------------
---------
---------MAP: Flora
---------Draw the map
--------------------------------------------------------------------
function floraDraw(floraTiles)
  math.randomseed(os.time())
  math.random(); math.random(); math.random()
  z = "z"
  a = "a"
  theFloraMap = {z, z, a, a, z, a, z, z, z, a, a, a, z, a, a, z, z, z, a, z, a, a, z, z, z}

  for i, value in ipairs(theFloraMap) do
    
    if theFloraMap[i] == z then
      theFloraMap[i] = floraTiles[math.random(#floraTiles)]
    end
    if theFloraMap[i] == a then
      theFloraMap[i] = nil
    end

  end
  return theFloraMap
end



--------------------------------------------------------------------
---------
---------LOAD ALL THE THINGS
---------Load the stuff to prime it for use
--------------------------------------------------------------------
function love.load()
-------BASIC LOADS---------------
  loadSandChunks()
  loadSandEdges()
  loadWater()
  loadWave()
  loadFlora()
  loadRandomFish()
-------MAP LOADS----------------
  waterMap = waterDraw (loadWater(), loadWave())
  landMap = landDraw (loadSandChunks(), loadSandEdges())
  floraMap = floraDraw(loadFlora())
-------SCALE AND Y START POINTS
  imageScale = (love.graphics.getWidth()/25)/64 --I KNOW the tiles need to be 32, they are 64
  
  startDrawWater = love.graphics.getHeight() - (#waterMap/25 * (waterMap[1]:getHeight() * imageScale))
  startDrawLand = love.graphics.getHeight() - (#landMap/25 * (landMap[1]:getHeight() * imageScale))
  startDrawFlora = startDrawLand - ((floraMap[1]:getHeight() * imageScale))

----------FISH------------------------------------
  randomFishY = {math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()), 
                 math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()), 
                 math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()), 
                 math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()),
                 math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())
                }
  leftRandomFishY = {math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()), 
                 math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()), 
                 math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()), 
                 math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()),
                 math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())
                }

  fishLoader = {
                loadRandomFish()[math.random(#loadRandomFish())],
                loadRandomFish()[math.random(#loadRandomFish())],
                loadRandomFish()[math.random(#loadRandomFish())],
                loadRandomFish()[math.random(#loadRandomFish())],
                loadRandomFish()[math.random(#loadRandomFish())]
               }
  
  leftFishLoader = {
                loadRandomFish()[math.random(#loadRandomFish())],
                loadRandomFish()[math.random(#loadRandomFish())],
                loadRandomFish()[math.random(#loadRandomFish())],
                loadRandomFish()[math.random(#loadRandomFish())],
                loadRandomFish()[math.random(#loadRandomFish())]
               }


  fishStartX ={ math.random(-800, 0),
                math.random(-800, 0),
                math.random(-800, 0),
                math.random(-800, 0),
                math.random(-800, 0) 
              }
  
  leftFishStartX ={ math.random(850, 1000),
                    math.random(850, 1000),
                    math.random(850, 1000),
                    math.random(850, 1000),
                    math.random(850, 1000)
                   }

  fishSpeed = {
              math.random(25, 100),
              math.random(25, 100),
              math.random(25, 100),
              math.random(25, 100),
              math.random(25, 100)
              }

  leftFishSpeed = {
            math.random(-100, -25),
            math.random(-100, -25),
            math.random(-100, -25),
            math.random(-100, -25),
            math.random(-100, -25)
            }

  fishReset = {
              false,
              false,
              false,
              false,
              false
             }
  
  leftFishReset = {
            false,
            false,
            false,
            false,
            false
            }
----------------DEATHFISH------------------------
deathStartX = {math.random(-2000, 0), 
                math.random(-2000, 0)}
deathStartY = {math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight()),
              math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())}
deathSpeed = {math.random(25, 100), math.random(25, 100)}
deathReset = {false, false}
leftDeathFish = {
  love.graphics.newImage("fishTile_091.png"),
  love.graphics.newImage("fishTile_097.png")
}
rightDeathFish = {

}
---------------------------------SCORING------------------------------------------------
score = 0
end

-------------------ON MOUSE PRESS DO STUFF-------------------------------------
-------------------------------------------------------------------------------
----
function love.mousepressed(x, y, button, istouch) --this is a built in function
   if button == 1 then --if left click
   --FOR RIGHT SWIMMING FISH
    for a, b in ipairs(fishLoader) do --for the fish in fishloader table
      if x < (fishStartX[a] + 64 ) and x > fishStartX[a]  --check if mouse x is within the image size
      and y > randomFishY[a] and y < (randomFishY[a] + 64) then --check if mouse y is within the image size
      --IF THE MOUSE IS ON THE IMAGE:CREATE NEW FISH AND NEW VARIABLES, INCREASE SCORE
         fishLoader[a] = loadRandomFish()[math.random(#loadRandomFish())] 
          randomFishY[a] = math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())
          fishStartX[a] = math.random(-800, -100)
          fishSpeed[a] = math.random(25, 100)
          fishReset[a] = false
          --INCREASE SCORE
          score = score + 1
      end
    end
    --FOR LEFT SWIMMING FISH
    --You will notice that this has some weird math.
    --when we flip the sprite using scaling, it changes the sprite by
    --visually flipping it along the y axis at the x point.
    --Where the normal x value of the image is the top left,
    --the x value of the flipped image is now top right.
    for c, d in ipairs(leftFishLoader) do --for fish in leftLoader
      if x < (leftFishStartX[c] ) and x > (leftFishStartX[c]-64)  
      and y > leftRandomFishY[c] and y < (leftRandomFishY[c] + 64) then
        --If within the image, create new fish
         leftFishLoader[c] = loadRandomFish()[math.random(#loadRandomFish())]
          leftRandomFishY[c] = math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())
          leftFishStartX[c] = math.random(850, 1000)
          leftFishSpeed[c] = math.random(-100, -25)
          leftFishReset[c] = false
          --INCREASE SCORE
          score = score + 1
      end
    end
    --FOR DEATH FISH
    for f, g in ipairs(leftDeathFish) do
      if x < (deathStartX[f] + 64 ) and x > deathStartX[f]  
      and y > deathStartY[f] and y < (deathStartY[f] + 64) then
         leftDeathFish[f] = leftDeathFish[f]
          deathStartY[f] = math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())
          deathStartX[f] = math.random(-800, -100)
          deathSpeed[f] = math.random(25, 100)
          deathReset[f] = false

          score = score - 5
      end
    end
  end
end

--------------------------------------------------------------------
---------
---------UPDATE ALL THE THINGS
---------animations,etc
--------------------------------------------------------------------

function love.update(dt)

--------------------NORMAL FISH---------------------------
---------------------GoRIGHT-----------------------------
  for i,v in ipairs(fishLoader) do
    if fishStartX[i] > 800 then --If off the screen on the right
      score = score - 1 --you didn't click, so minus score
      fishReset[i] = true --signal it's time for a reset
    else
      fishReset[i] = false --it is not time for a reset
    end


    if fishReset[i] ~= true then --if it's not time for a reset
      fishStartX[i] = fishStartX[i] + fishSpeed[i] * dt --swim fishy, swim
    end


    if fishReset[i] == true then -- if it's time for a reset, create new fish
      fishLoader[i] = loadRandomFish()[math.random(#loadRandomFish())]
      randomFishY[i] = math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())
      fishStartX[i] = math.random(-800, -100)
      fishSpeed[i] = math.random(25, 100)
      fishReset[i] = false
    end


  end

-------------------GoLEFT------------------------------
  for i,v in ipairs(leftFishLoader) do
    if leftFishStartX[i] < 0 then --if fish goes off the edge to the left
      score = score - 1 -- you didn't click it, minus the score
      leftFishReset[i] = true -- signial a reset
    else
      leftFishReset[i] = false --it's not time for a reset
    end


    if leftFishReset[i] ~= true then --while not time for a reset
      leftFishStartX[i] = leftFishStartX[i] + leftFishSpeed[i] * dt --swim fishy, swim
    end

    if leftFishReset[i] == true then --if reset, create new fish
      leftFishLoader[i] = loadRandomFish()[math.random(#loadRandomFish())]
      leftRandomFishY[i] = math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())
      leftFishStartX[i] = math.random(850, 1000)
      leftFishSpeed[i] = math.random(-100, -25)
      leftFishReset[i] = false
    end

  end


  ----------------DEATHFISH-----------------------------------
  ---------------GoRIGHT--------------------------------------

  for i,v in ipairs(leftDeathFish) do
    if deathStartX[i] > 800 then
      deathReset[i] = true
    else
      deathReset[i] = false
    end

    if deathReset[i] ~= true then
      deathStartX[i] = deathStartX[i] + deathSpeed[i] * dt
    end

    if deathReset[i] == true then
      leftDeathFish[i] = leftDeathFish[i] 
      deathStartY[i] = math.random(startDrawWater, startDrawLand-loadRandomFish()[1]:getHeight())
      deathStartX[i] = math.random(-800, -100)
      deathSpeed[i] = math.random(25, 100)
      deathReset[i] = false
    end
  end

end



--------------------------------------------------------------------
---------
---------DRAW ALL THE THINGS
---------Make things pretty
--------------------------------------------------------------------

--------------------------------------------------------------------
---------
---------Draw The Water 
--------------------------------------------------------------------
function drawTheWaterBoard()
  count = 0 --so we can set up the rows
  countx = 0 --so we can set up the columns
  for i = 1, #waterMap, 1 do --iterate through the watermap table
    love.graphics.setColor(1,1,1) --make sure it's set to white/no overlay color
    love.graphics.draw(waterMap[i], 0 + (32* countx), startDrawWater + (32 * count), 0, imageScale, imageScale)

    if math.fmod(i, 25) ==0 then --hard coded 25, this is how many tiles we have per row
      count = count + 1 --go down a row
      countx = 0 --reset the column back to the left
    else
      countx = countx + 1 --increase the column count
    end
  end
end


--------------------------------------------------------------------
---------
---------Draw The Flora 
--------------------------------------------------------------------
function drawTheFloraBoard()
  count = 0
  countx = 0
  for i = 1, #waterMap, 1 do
    love.graphics.setColor(1,1,1)
    if floraMap[i] ~= nil then
      love.graphics.draw(floraMap[i], 0 + (32* countx), startDrawFlora + (32 * count), 0, imageScale, imageScale)
    end
    countx = countx + 1
  end
end

--------------------------------------------------------------------
---------
---------Draw The Land 
--------------------------------------------------------------------
function drawTheLandBoard()
  count = 0
  countx = 0
  for i = 1, #landMap, 1 do
    love.graphics.setColor(1,1,1)
    love.graphics.draw(landMap[i], 0 + (32* countx), startDrawLand + (32 * count), 0, imageScale, imageScale)

    if math.fmod(i, 25) ==0 then
      count = count + 1
      countx = 0
    else
      countx = countx + 1
    end
  end
end

--------------------------------------------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--------------------ACTUALLY DRAW THE STUFF-------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--------------------------------------------------------------------

function love.draw()
  drawTheWaterBoard()
  drawTheFloraBoard()
  drawTheLandBoard()

  love.graphics.draw(fishLoader[1], fishStartX[1], randomFishY[1] )
  love.graphics.draw(fishLoader[2], fishStartX[2], randomFishY[2] )
  love.graphics.draw(fishLoader[3], fishStartX[3], randomFishY[3] )
  love.graphics.draw(fishLoader[4], fishStartX[4], randomFishY[4] )
  love.graphics.draw(fishLoader[5], fishStartX[5], randomFishY[5] )

  love.graphics.draw(leftFishLoader[1], leftFishStartX[1], leftRandomFishY[1], 0, -1, 1 )
  love.graphics.draw(leftFishLoader[2], leftFishStartX[2], leftRandomFishY[2], 0, -1, 1)
  love.graphics.draw(leftFishLoader[3], leftFishStartX[3], leftRandomFishY[3], 0, -1, 1)
  love.graphics.draw(leftFishLoader[4], leftFishStartX[4], leftRandomFishY[4], 0, -1, 1)
  love.graphics.draw(leftFishLoader[5], leftFishStartX[5], leftRandomFishY[5], 0, -1, 1)

  love.graphics.draw(leftDeathFish[1], deathStartX[1], deathStartY[1])
  love.graphics.draw(leftDeathFish[2], deathStartX[2], deathStartY[2])
  
  love.graphics.print("Fish Clicked: "..score, 0, 0)

end