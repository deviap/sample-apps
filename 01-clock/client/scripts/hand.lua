---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------
return function(params)
	-- Create a square in the centre of the parent object
	-- We'll rotate this square to pivot the hand, easy!
	local pivot = core.construct("guiFrame", {
		parent = params.parent,
		position = guiCoord(0.5, -1, 0.5, -1),
		size = guiCoord(0, 2, 0, 2),
		backgroundAlpha = 0
	})

	-- The actual hand the user sees
	core.construct("guiFrame", {
		parent = pivot,
		position = guiCoord(0.5, -params.width / 2, 0, -params.length + (params.width / 2)),
		size = guiCoord(0, params.width, 0, params.length),
		backgroundColour = params.colour
	})

	return pivot
end
