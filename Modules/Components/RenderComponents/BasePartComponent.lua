
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")


local ComponentDescription = ECSFramework.ComponentDescription


local BasePartComponent = ComponentDescription.Extend("BasePartComponent")

BasePartComponent.Fields = {
    "BasePart"
}

BasePartComponent.Defaults = {
    BasePart = nil;
}


return BasePartComponent