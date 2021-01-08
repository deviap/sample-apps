---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

local settings = require("./settings.lua")

core.construct("light", {
	type = "directional",
	diffuseColour = colour(1, 1, 1),
	specularColour = colour(1, 1, 1),
	power = 5,
	position = vector3(0, 4, 4)
}):lookAt(vector3(0,0,0))

for x = 0, settings.width do
    for y = 0, settings.height do
        local metalness = 0
        if x % 2 == 0 then
            metalness = metalness + 0.25
        end
        
        if y % 2 == 0 then
            metalness = metalness + 0.5
        else
            metalness = metalness + 0.2
        end

        local cube = core.construct("block", {
            scale = vector3(settings.cellSize, 0.1, settings.cellSize),
            position = vector3(x * settings.cellSize, 0, y * settings.cellSize),
            colour = settings.cellColour,
            metalness = metalness
        })
    end
end