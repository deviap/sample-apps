---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------
--
local serialiser = require("devgit:source/serialiser/main.lua")

serialiser.fromFile("client/assets/starterScene.json")
--core.io:write("client/assets/starterScene.json", serialiser.toJSON(core.scene))