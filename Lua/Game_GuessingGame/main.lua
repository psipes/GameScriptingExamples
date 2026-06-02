gameover = false
playagain = true
counter = 0
compnum = nil
userguess = nil

while playagain == true do
  
  while gameover == false do
    math.randomseed(os.time())
    math.random(); math.random(); math.random()
    compnum = math.random(101)
    print(compnum)
    while counter < 7 do
      print ("Guess a number between 1 and 100")
      if (tonumber(io.read())==tonumber(compnum)) then
       print("Congrats! You guessed it!")
        gameover = true
        break
      else
        print ("Sorry, Not right.")
      end

    counter = counter + 1  
    end
    if counter > 6 then
      print("You lost. The number was " .. compnum)
    end
    gameover = true
  end
    ---POSSIBLY MOVE LATER
  print("Do you want to play again? Press Y for yes, any other key for no")
  userchoice = io.read()
  if string.upper(userchoice) == "Y" then
   playagain = true
   gameover = false
   counter = 0
  else
    playagain = false
    gameover = true
    break
  end

end