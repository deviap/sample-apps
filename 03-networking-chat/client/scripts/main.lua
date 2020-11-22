---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

-- Load in only the gameKit components we need
require("devgit:source/gameKit/main.lua") {
	"loading",
	"playerList", 
	"disconnection"
}

-- We show the essages in this textbox
local messageOutput = core.construct("guiTextBox", {
	parent = core.interface,
	size = guiCoord(0.8, 0, 0.5, 0),
	position = guiCoord(0.1, 0, 0.25, 0),
	backgroundColour = colour.rgb(234, 234, 234),
	textColour = colour.rgb(0, 0, 0),
	textAlign = "topLeft",
	text = "",
	textWrap = true,
	textMultiline = true,
	textSize = 18
})

-- The box in which the user can type
local messageInput = core.construct("guiTextBox", {
	parent = core.interface,
	size = guiCoord(0.8, 0, 0, 30),
	position = guiCoord(0.1, 0, 0.75, 5),
	backgroundColour = colour.rgb(234, 255, 255),
	textColour = colour.rgb(0, 0, 0),
	textAlign = "middle",
	text = "",
	textEditable = true,
	textSize = 18
})

-- We'll store a history of messages in a table
local messages = {}

-- Hook onto "message", which is sent by the server
core.networking:on("message", function(msg)
	-- Store the message in the messages table
	table.insert(messages, msg)

	-- But delete messages so we only ever show 10
	if #messages > 10 then
		table.remove(messages, 1)
	end

	-- Construct a new string for each message
	local str = ""
	for _, v in pairs(messages) do
		str = str .. v .. "\n"
	end

	-- Update the textbox with the string we made
	messageOutput.text = str
end)

-- When the user hits return on the textbox
messageInput:on("keyUp", function(key)
	if key == "KEY_RETURN" then
		-- Send the contents to the server
		core.networking:sendToServer("message", messageInput.text)

		-- Reset the textbox to be empty
		messageInput.text = ""
	end
end)