---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

print("Running " .. _VERSION .. " on device " .. _DEVICE)

-- Main container frame for this interface
local backdrop = core.construct("guiFrame", {
	parent = core.interface,
	size = guiCoord(1, 0, 1, 0),
	backgroundColour = colour.rgb(255, 255, 255)
})

local triangles = {}

-- Create a 10x10 grid of triangles covering the screen
for x = 0, 1, 0.1 do
	for y = 0, 1, 0.1 do
		table.insert(triangles, core.construct("guiTriangle", {
			parent = backdrop,
			pointA = guiCoord(x, 0, y, 0),
			pointB = guiCoord(x, 0, y + 0.1, 0),
			pointC = guiCoord(x + 0.1, 0, y, 0),
			backgroundColour = colour.random()
		}))
	end
end

while true do
	-- 'flip' all the triangles
	for _, v in pairs(triangles) do
		core.tween:begin(v, 2, {
			pointA = guiCoord(v.pointA.scale.x + 0.1, 0, v.pointA.scale.y + 0.1, 0)
		}, "inOutQuad")
		sleep()
	end
	sleep(0.125)
	for _, v in pairs(triangles) do
		core.tween:begin(v, 2, {
			pointA = guiCoord(v.pointA.scale.x - 0.1, 0, v.pointA.scale.y - 0.1, 0)
		}, "inOutQuad")
		sleep()
	end
	sleep(0.125)
end
