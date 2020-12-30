---------------------------------------------------------------
-- Copyright 2020 Deviap (https://deviap.com/)               --
---------------------------------------------------------------
-- Made available under the MIT License:                     --
-- https://github.com/deviap/sample-apps/blob/master/LICENSE --
---------------------------------------------------------------
--

return function()
    print("--------------")
    print("core", core and "EXISTS" or "N/A")
    print("core.scene", core.scene and "EXISTS" or "N/A")
    print("require", require and "EXISTS" or "N/A")
    print("--------------")
end