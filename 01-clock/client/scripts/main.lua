---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------
print("Starting clock example")

-- Main container frame for this interface
local backdrop = core.construct("guiFrame", {
	parent = core.interface,
	size = guiCoord(1, 0, 1, 0),
	backgroundColour = colour.rgb(43, 43, 66)
})

-- Create a circle
local clockContainer = core.construct("guiFrame", {
	parent = backdrop,
	size = guiCoord(0, 200, 0, 200),
	position = guiCoord(0.5, -100, 0, 20),
	backgroundColour = colour.rgb(23, 23, 33),
	strokeRadius = 100
})

-- Create the hands, using a module we made
local hand = require("scripts/hand.lua")
local pivotHour = hand {
	parent = clockContainer,
	colour = colour.rgb(225, 225, 225),
	length = 50,
	width = 4
}

local pivotMinute = hand {
	parent = clockContainer,
	colour = colour.rgb(245, 245, 245),
	length = 85,
	width = 4
}

local pivotSecond = hand {
	parent = clockContainer,
	colour = colour.rgb(245, 143, 143),
	length = 90,
	width = 1
}

-- We'll display the digital clock time in this textbox
local textbox = core.construct("guiTextBox", {
	parent = backdrop,
	size = guiCoord(0, 200, 0, 50),
	position = guiCoord(0.5, -100, 0, 220),
	textAlign = "middle",
	textSize = 52,
	textColour = colour.rgb(255, 255, 255),
	textFont = "deviap:fonts/openSansBold.ttf",
	backgroundAlpha = 0
})

while sleep() do
	local clock = os.timeMS() / 1000

	local secs = clock % 60
	local mins = (clock / 60) % 60
	local hours = (clock / 60 / 60) % 60

	pivotSecond.rotation = math.rad(360 * secs / 60)
	pivotMinute.rotation = math.rad(360 * mins / 60)
	pivotHour.rotation = math.rad(360 * hours / 12)

	textbox.text = os.date("%H:%M:%S")
end
