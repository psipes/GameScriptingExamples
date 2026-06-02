--This program creates a rocket that goes up and down.
--The flame only shows when going up, it is off when going down.

--A version with a flame that grows and speed acceleration.
------------------------------------------------------------------------------------


--all the base loading things. This is where you set your basic variables
function love.load()
    text = "Hello World"
    --These two lines use getHeight and getWidth. These take the size of the window.
    --Standard, it's set to 800 x 600
    rocketCornerY = love.graphics.getHeight()-25 --visual glitch has rocketHeight cutting off.
    rocketCenterX = love.graphics.getWidth()/2
    --I want my rocket to be 50 pixels wide.
    --I want the rocket to be centered. Which I found in the previous variable
    --So I know it needs to be 25 pixels to each side.
    rocketHalfWidth = 25
    --This is a random number I picked because it looked good.
    rocketHeight = 150
    --This is also a random number.
    --You may note that it says "startSpeed"
    --if you look at the more advanced version, it accelerates and decelerates.
    --So I have to have a base speed to go up from and down to.
    startSpeed = 10
    --We have to add a flame only when going up...sooooo we need some sort of variable
    goingUp = true
    --is there enough room to draw the flame and we're going up?
    drawFlame = true
    flameHeightMax = 50
    flameHeight = 0

end --end love.load()

----------------------------------------------------------------------------------------

--Update "updates" things every frame.
--We give it the parameter "dt" so that we have access to delta time
--which takes frame rate out of the equation
--and fires correctly in a timely manner
function love.update(dt)
     --We need to update the Y value (rocketCornerY)
     --Because we stored it in a variable we can do it easily 
     --and make the whole thing move.

    --To move up.
    --REMEMBER: Love's 0,0 is in the top left corner 
    --This means if we're already at the bottom, we have to substract
    --So we can move towards 0
    if goingUp == true then --we could just say if goingUp then

        rocketCornerY = rocketCornerY - startSpeed * dt
        startSpeed = startSpeed + .25 --acceleration
        if rocketCornerY < -25 then --so that it's well off the screen before coming back
            goingUp = false
            print ("reversing"..rocketCornerY)
        end --end the if it's time to start going down statement

        --a flame that grows to a size
        drawFlame = true
        flameHeight = love.graphics.getHeight() - 25 - rocketCornerY
        if flameHeight > flameHeightMax then
            flameHeight = flameHeightMax
        end

    else --if we're going down
        drawFlame = false --drawFlame will always be false coming down
        rocketCornerY = rocketCornerY + startSpeed * dt
        startSpeed = startSpeed - .25 --decelerates
        if startSpeed < 10 then--making sure it doesn't get too slow
          startSpeed = 10
        end
        
        --the added subtraction at the end is so that we don't go completely off the screen
        if rocketCornerY >=love.graphics.getHeight() - 10 then 
            goingUp = true
            print ("reversing"..rocketCornerY)
        end --end the if it's time to start going up statement
    end --end the if going up, else coming down statement
end --end love.update()

---------------------------------------------------------------------------------------

--draw the stuff
function love.draw()
     love.graphics.print(text, 0, 0)
     --make the color grey and draw the rocket body
     love.graphics.setColor(.9,.9,.9,1)
    love.graphics.polygon ("fill", 
    rocketCenterX + rocketHalfWidth, rocketCornerY,
    rocketCenterX + rocketHalfWidth, rocketCornerY - (rocketHeight-25),
    rocketCenterX,            rocketCornerY - rocketHeight,
    rocketCenterX - rocketHalfWidth, rocketCornerY - (rocketHeight-25),
    rocketCenterX - rocketHalfWidth, rocketCornerY
    )
    if drawFlame == true then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.polygon("fill", 
        rocketCenterX + rocketHalfWidth, rocketCornerY,
        rocketCenterX, rocketCornerY + flameHeight,
        rocketCenterX - rocketHalfWidth, rocketCornerY)
    end
     
end --end love.draw()