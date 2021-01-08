---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------

core.graphics.sky = "fs:client/img/bliss.jpg"

-- Load in only the gameKit components we need
require("devgit:source/gameKit/main.lua") {
	"loading",
	"playerList", 
	"disconnection", 
	"chat"
}

core.input:on("keyDown", function(key)
    if key == "KEY_W" then
        core.networking:sendToServer("keyDown", "up")
    elseif key == "KEY_S" then
        core.networking:sendToServer("keyDown", "down")
    elseif key == "KEY_A" then
        core.networking:sendToServer("keyDown", "left")
    elseif key == "KEY_D" then
        core.networking:sendToServer("keyDown", "right")
    end
end)

while not core.scene:child(core.networking.localClient.id) do
	sleep(.5)
end
print('found')