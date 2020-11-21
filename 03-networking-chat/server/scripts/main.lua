---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------
-- Users can send us messages
core.networking:on("message", function(client, msg)

	-- Do not trust the client,
	-- We must validate their message
	-- In this case, we'll just limit it to 100 characters
	msg = tostring(msg):sub(0, 100)

	-- Pass on the cropped message to all clients
	core.networking:broadcast("message", client.name .. ": " .. msg)
end)

-- When a user connects
core.networking:on("_clientConnected", function(client)
    -- Broadcast a message with their username
	core.networking:broadcast("message", "server: " .. client.name .. " connected")
end)

-- And when a user disconnects...
core.networking:on("_clientDisconnected", function(client)
    -- Broadcast a message with their username
	core.networking:broadcast("message", "server: " .. client.name .. " disconnected")
end)
