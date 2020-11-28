---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

-- Load in all the core gameKit components
require("devgit:source/gameKit/main.lua") {}

core.construct("block", {
	name = "baseplate",
	scale = vector3(6, 0.5, 6),
	position = vector3(0, -0.5, 0)
})