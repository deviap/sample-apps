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
	"disconnection", 
	"chat"
}

require("./map.lua")
local snakes = require("./snake.lua")
local food = require("./food.lua")
local directions = require("./directions.lua")

core.scene.camera.position = vector3(0, 10, 5),
core.scene.camera:lookAt(vector3(0,0,0))

core.networking:on("_clientConnected", function(client)
	snakes.createSnake(client.id, vector3(0, 1.5, 0))
end)

core.networking:on("keyDown", function(client, direction)
	if not directions[direction] then
		-- this user is sending illegal moves.
		-- they're using a 'hacked' client?
		-- or our code is really bad
		-- we'll just ignore this
		return
	end

	snakes.setDirection(client.id, direction)
end)