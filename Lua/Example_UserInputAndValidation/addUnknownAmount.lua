--Add numbers from user until they say done

done = false
sum = 0
userNum = nil
userChoice = nil

while done == false do
  while userNum == nil or not tonumber(userNum) or userNum == "" do
    print ("What number would you like to add?")
    userNum = io.read()
  end
  sum = sum + userNum
  userNum = nil
  print ("Y to stop, other key to continue")
  userChoice = io.read()
  if string.upper(userChoice) == "Y" then
    print ("Your sum is: " .. sum)
    done = true
    break
  end 
  userChoice = nil
end



