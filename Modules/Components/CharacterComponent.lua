
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")


local ComponentDescription = ECSFramework.ComponentDescription


local CharacterComponent = ComponentDescription.Extend("CharacterComponent")

CharacterComponent.Fields = {
    "Gravity",
    "JumpPower",
    "PositiveYIsDown"
}

CharacterComponent.Defaults = {
    Gravity = 512;
    JumpPower = 256;

    PositiveYIsDown = false
}


return CharacterComponent