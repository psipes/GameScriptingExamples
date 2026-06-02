--random numbers 10 times, see how many even and odd (left and right)
zerocount = 0
evencount = 0
oddcount = 0
counter = 0
checknum = nil

math.randomseed(os.time()) --seeds our random
math.random() ; math.random() ; math.random() --get rid of old

while counter < 10 do
  checknum = math.random(0,100)
  if checknum == 0 then
    zerocount = zerocount + 1    
  else
    if math.fmod(checknum, 2) == 1 then --odd
      oddcount = oddcount + 1 
    else
      evencount = evencount + 1
    end
  
  end
  print(checknum)
  counter = counter + 1
end

print ("Zeroes: " .. zerocount)
print ("Left: " .. oddcount)
print ("Right: " .. evencount)

