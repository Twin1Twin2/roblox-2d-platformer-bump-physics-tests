
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")


local ComponentDescription = ECSFramework.ComponentDescription


local GuiObjectComponent = ComponentDescription.Extend("GuiObjectComponent")

GuiObjectComponent.Fields = {
    "GuiObject"
}

GuiObjectComponent.Defaults = {
    GuiObject = nil;
}


return GuiObjectComponent