---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

-- Load in all the core gameKit components
require("devgit:source/gameKit/main.lua") {}

local light = core.construct("light", {
	type = "directional",
	diffuseColour = colour(1, 1, 1),
	specularColour = colour(1, 1, 1),
	power = 3
})

light:lookAt(vector3(0, -1, -0.5))

core.scene.camera.position = vector3(0, 5, 10)
core.scene.camera:lookAt(vector3(0, 4, 0))
