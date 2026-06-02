--This game rolls 6 dice against each other. Largest Number wins.


function love.load()
love.graphics.newFont (100)
  --get the Screen Dimensions
  screenW = love.graphics.getWidth()
  screenH = love.graphics.getHeight()
  counter = 0
  firstPlay = true

  --set up the dice
  redDice = {love.graphics.newImage("dieRed_border1.png"),
               love.graphics.newImage("dieRed_border2.png"),
               love.graphics.newImage("dieRed_border3.png"),
               love.graphics.newImage("dieRed_border4.png"),
               love.graphics.newImage("dieRed_border5.png"),
               love.graphics.newImage("dieRed_border6.png")}

  whiteDice = {love.graphics.newImage("dieWhite_border1.png"),
               love.graphics.newImage("dieWhite_border2.png"),
               love.graphics.newImage("dieWhite_border3.png"),
               love.graphics.newImage("dieWhite_border4.png"),
               love.graphics.newImage("dieWhite_border5.png"),
               love.graphics.newImage("dieWhite_border6.png")}
  

  --find where the dice should be placed
  diceWidth = whiteDice[1]:getWidth()
  diceHeight = whiteDice[1]:getHeight()
  numOfDice = 6 --number of dice to roll
  bufferWidth = 100
  diceShift = (screenW - bufferWidth)/numOfDice

  



  --set up randomizer and initial dice roll
  sumRed = 0
  sumWhite = 0
  randomRollWhite = {}
  randomRollRed = {}
  math.randomseed(os.time())
  math.random(); math.random(); math.random()
  for r = 0, numOfDice-1, 1
  do
    randomRollWhite [#randomRollWhite + 1] = math.random(numOfDice)
    randomRollRed [#randomRollRed + 1] = math.random(numOfDice)
  end
end


--When key is pressed randomize dice
function love.keypressed(key)
     if key == 'space' then
      sumRed = 0
      sumWhite = 0
      firstPlay = false
      
      for a = 0, numOfDice-1, 1 do
        whiteValue = math.random(numOfDice)
        randomRollWhite[a+1] = whiteValue
        sumWhite = sumWhite + whiteValue
                
        redValue = math.random(numOfDice)
        randomRollRed[a+1] = redValue
        sumRed = sumRed + redValue
        
      end



     end
end

function love.update(dt)


end

function winPrint()
  if firstPlay then
    love.graphics.setColor(1,0,1,1)
    return "Press Space to Roll Dice"
    
  else
    if sumRed > sumWhite then
      love.graphics.setColor (1,0,0,1)
      return "Red Wins!"
    
    elseif sumRed < sumWhite then
      love.graphics.setColor (1,1,1,1)
      return "White Wins!"

    else
      love.graphics.setColor (0,1,0,1)
      return "It's a Tie?!"

    end
  end
end

function love.draw()
  
  for i = 0, numOfDice-1, 1
    do
      love.graphics.setColor (1,1,1,1)
      love.graphics.draw(whiteDice[(randomRollWhite[i+1])], (bufferWidth + (i * diceShift)), 100)

      love.graphics.draw(redDice[(randomRollRed[i+1])], (bufferWidth + (i * diceShift)), screenH - 200)
  end

  
  if not firstPlay then
    love.graphics.setColor (1,0,0,1)
    love.graphics.print("Red Total: "..sumRed, (screenW/4)* 3, screenH - 75)
    love.graphics.setColor (1,1,1,1)
    love.graphics.print("White Total: "..sumWhite, (screenW/4), 30 )
  end
    
  love.graphics.printf(winPrint(),0,screenH/2,screenW, "center")
  
  

end