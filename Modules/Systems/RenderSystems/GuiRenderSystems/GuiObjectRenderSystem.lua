
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")


local GuiObjectRenderSystem = ECSFramework.System.Extend("GuiObjectRenderSystem")

GuiObjectRenderSystem.ComponentRequirement:AllFromList({
    "GuiObjectComponent",
    "PositionComponent"
})


function GuiObjectRenderSystem:Initialize()
    print("GuiObjectRenderSystem - Initialized!")
end


function GuiObjectRenderSystem:UpdateEntity(entity, stepped)
    local guiObjectComponent = entity:GetComponent("GuiObjectComponent")
    local positionComponent = entity:GetComponent("PositionComponent")

    local guiObject = guiObjectComponent.GuiObject
    local position = positionComponent.Position

    if (guiObject ~= nil) then
        guiObject.Position = UDim2.new(0, position.X, 0, position.Y)
    end
end


function GuiObjectRenderSystem:Update(stepped)
    for _, entity in pairs(self.Entities) do
        self:UpdateEntity(entity, stepped)
    end
end


return GuiObjectRenderSystem