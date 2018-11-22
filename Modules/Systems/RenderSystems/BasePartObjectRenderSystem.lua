
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")


local BasePartObjectRenderSystem = ECSFramework.System.Extend("BasePartObjectRenderSystem")

BasePartObjectRenderSystem.ComponentRequirement:AllFromList({
    "BasePartComponent",
    "PositionComponent"
})


function BasePartObjectRenderSystem:Initialize()
    print("BasePartObjectRenderSystem - Initialized!")
end


function BasePartObjectRenderSystem:UpdateEntity(entity, stepped)
    local basePartComponent = entity:GetComponent("BasePartComponent")
    local positionComponent = entity:GetComponent("PositionComponent")

    local basePart = basePartComponent.BasePart
    local position = positionComponent.Position

    if (basePart ~= nil) then
        local offset = basePart.Size / 2
        basePart.CFrame = CFrame.new(position.X + offset.X, position.Y + offset.Y, 0)
    end
end


function BasePartObjectRenderSystem:Update(stepped)
    for _, entity in pairs(self.Entities) do
        self:UpdateEntity(entity, stepped)
    end
end


return BasePartObjectRenderSystem