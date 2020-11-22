---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

-- Load in all the core gameKit components
require("devgit:source/gameKit/main.lua") {}

core.construct("block", {
	scale = vector3(3, 0.5, 3),
	position = vector3(0, -0.5, 0)
})