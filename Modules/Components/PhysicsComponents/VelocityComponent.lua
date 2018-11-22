
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")

local ComponentDescription = ECSFramework.ComponentDescription


local VelocityComponent = ComponentDescription.Extend("VelocityComponent")

VelocityComponent.Fields = {
    "Velocity"
}

VelocityComponent.Defaults = {
    Velocity = Vector2.new(0, 0)
}


return VelocityComponent