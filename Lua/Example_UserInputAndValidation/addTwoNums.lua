--Get two numbers from user and add together. print sum
num1 = nil
num2 = nil

while num1 == nil or not tonumber(num1) or num1 == "" do
  print("Please give me the first number: ")
  num1 = io.read()
end

while num2 == nil or not tonumber(num2) or num2 == "" do
  print("Please give me a second number: ")
  num2 = io.read()
end

print (num1 + num2) 