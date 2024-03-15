--[[
    Pause State
    Author: George Engel

    halts game delta time from advancing
    Plays sound effect when created.
]]

PauseState = Class{__includes = BaseState}

function PauseState:init()
    self.image = love.graphics.newImage("pause.png")
end

function PauseState:enter()
    -- Play SFX!
    sounds['pause']:play()
    -- Pause Music
    sounds['music']:pause()
end

function PauseState:exit()
    sounds['pause']:play()
    -- Resume Music
    sounds['music']:play()
end

function PauseState:update(dt)
    -- Unpause if p is pressed again!
    if love.keyboard.wasPressed('p') then
        -- TODO: FIX BUG where the game resets by doing this!
        gStateMachine:resumeCached()
    end
end

function PauseState:render()
    love.graphics.setFont(hugeFont)
    love.graphics.printf("PAUSED",0,30,VIRTUAL_WIDTH, 'center')

    love.graphics.push()
    love.graphics.scale(0.25,0.25)
    local horizontal_offset = VIRTUAL_WIDTH*2 - (self.image:getWidth()/2)
    love.graphics.draw(self.image, horizontal_offset, 350)
    love.graphics.pop()
end
