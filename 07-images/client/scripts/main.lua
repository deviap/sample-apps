---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

-- Main container frame for this interface
local backdrop = core.construct("guiImage", {
	parent = core.interface,
	size = guiCoord(1, 0, 1, 0),
	image = "fs:client/images/test.jpg"
})
