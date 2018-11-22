
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")

local ComponentDescription = ECSFramework.ComponentDescription


local PositionComponent = ComponentDescription.Extend("PositionComponent")

PositionComponent.Fields = {
    "Position"
}

PositionComponent.Defaults = {
    Position = Vector2.new(0, 0)
}


return PositionComponent