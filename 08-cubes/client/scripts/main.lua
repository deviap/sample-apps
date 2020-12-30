---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

for x = 1, 10 do
	for y = 1, 10 do
		local block = core.construct("block", {
			position = vector3(x, y, 0),
			scale = vector3(0.7, 0.7, 0.7),
			colour = colour.random()
		})

		if x == 5 and y == 4 then
			block.renderQueue = 240
		end
	end
end

core.scene.camera.position = vector3(5, 5, -15)
core.scene.camera:lookAt(vector3(5, 5, 0))

core.graphics.upperAmbient = colour(3, 3, 3)
core.graphics.ambientDirection = vector3(0, 1, 0)
sleep(1)
require("devgit:source/application/utilities/camera.lua")