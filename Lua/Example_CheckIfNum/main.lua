
sum = 0
complete = false
while not complete do 
  print("Give a number to add to the sum or press x to get the sum")
  userInput = io.read()

  if string.lower(userInput) == "x" then
    complete = true
    break
  end
  if tonumber(userInput) then
    sum = sum + userInput
  else
    print("That's not a number or x!")
  end  
end

print (sum)
