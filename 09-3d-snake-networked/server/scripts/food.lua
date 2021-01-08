---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

local controller = {}
controller.blocks = {}
local settings = require("./settings.lua")

function controller.addFood(x, y)
    if not controller.blocks[x] then
        controller.blocks[x] = {}
    end
    if controller.blocks[x][y] then return end

    controller.blocks[x][y] = core.construct("block", {
        scale = vector3(settings.cellSize / 4, settings.cellSize / 4, settings.cellSize / 4),
        position = vector3(x * settings.cellSize, 0.5, y * settings.cellSize),
        mesh = "deviap:3d/sphere.glb"
    })
end

function controller.eat(x, y)
    local found = controller.blocks[x] and controller.blocks[x][y]
    if not found then return false end

    controller.blocks[x][y]:destroy()
    controller.blocks[x][y] = nil
    return true
end

controller.addFood(2, 2)
controller.addFood(0, 5)
controller.addFood(2, 4)
controller.addFood(4, 4)

return controller