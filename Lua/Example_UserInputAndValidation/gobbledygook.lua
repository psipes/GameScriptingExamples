--[[imavariable = 10
imanumber = "bobby"
imanumber = 12

imabool = false

imanew3 = nil

print("Hello World");
-- Hi I'm a comment

print("Name: ")
username = io.read()
print("Hello " .. username)

if (imavariable < imanumber) then
  print ("BOOP")
end
x = 1
while x < 10 do
  print (x)
  x = x + 3
end

for i = 1, 10, 2 do
  print ("I hate for loops")
end

function Howdy(times)
  while times > 0 do
    print ("Howdy Partner!")
    times = times -1
  end  
end

Howdy(2)
]]--