
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")

local ComponentDescription = ECSFramework.ComponentDescription


local CollisionComponent = ComponentDescription.Extend("CollisionComponent")

CollisionComponent.Fields = {
    "Bounds",
    "Collisions"
}

CollisionComponent.Defaults = {
    Bounds = Vector2.new(0, 0);
    Collisions = {};
}


return CollisionComponent