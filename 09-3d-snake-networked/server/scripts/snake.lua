---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

local controller = {}
local snakes = {}
local direction = {}

local settings = require("./settings.lua")
local food = require("./food.lua")
local directions = require("./directions.lua")

function controller.createSnake(userid, pos)
    snakes[userid] = {}
    direction[userid] = "up"

    local newBlock = core.construct("block", {
        name = userid,
        scale = vector3(settings.cellSize, settings.cellSize, settings.cellSize),
        position = pos,
        colour = colour.random()
    })

    table.insert(snakes[userid], newBlock)
end

function controller.setDirection(userid, dir)
    direction[userid] = dir
end

function controller.growSnake(userid)
    if not snakes[userid] then return end
    
    local newBlock = core.construct("block", {
        scale = vector3(settings.cellSize, settings.cellSize, settings.cellSize),
        colour = snakes[userid][1].colour,
        position = snakes[userid][1].position
    })

    table.insert(snakes[userid], newBlock)
end

function controller.killSnake(userid)
    
end

spawn(function()
    while sleep(1) do
        for userid, _ in pairs(snakes) do
            for i = #snakes[userid], 2, -1 do
                snakes[userid][i].position = snakes[userid][i - 1].position
            end
            
            snakes[userid][1].position = snakes[userid][1].position + directions[direction[userid]] * settings.cellSize

            print(direction[userid])
            print(directions[direction[userid]] * settings.cellSize)

            local x = snakes[userid][1].position.x / settings.cellSize
            local y = snakes[userid][1].position.z / settings.cellSize
            if food.eat(x, y) then
                controller.growSnake(userid)
            end
        end
    end
end)

return controller