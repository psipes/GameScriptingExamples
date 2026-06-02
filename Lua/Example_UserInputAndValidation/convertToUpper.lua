--Convert user input to uppercase
userInput = nil
while userInput == nil or userInput == "" or userInput == string.upper(userInput) or tonumber(userInput) do 
  print("Write something to convert to uppercase: ")
  userInput = io.read()
end
print (string.upper(userInput))