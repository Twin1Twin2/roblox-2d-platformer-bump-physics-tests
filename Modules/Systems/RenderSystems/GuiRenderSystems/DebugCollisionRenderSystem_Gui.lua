
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")


local DebugCollisionRenderSystem = ECSFramework.System.Extend("DebugCollisionRenderSystem")

DebugCollisionRenderSystem.ComponentRequirement:AllFromList({
    "PositionComponent",
    "CollisionComponent"
})


function DebugCollisionRenderSystem:Initialize()
    print("DebugCollisionRenderSystem - Initialized!")
end


function DebugCollisionRenderSystem:RegisteredToWorld(world)
    print("DebugCollisionRenderSystem - Registered To World " .. world.Name .. "!")
end


function DebugCollisionRenderSystem:UnregisteredFromWorld(world)
    print("DebugCollisionRenderSystem - Unregistered From World " .. world.Name .. "!")
end


function DebugCollisionRenderSystem:EntityAdded(entity)
    print("DebugCollisionRenderSystem - Entity Added!")
end


function DebugCollisionRenderSystem:EntityRemoved(entity)
    print("DebugCollisionRenderSystem - Entity Removed!")
end


function DebugCollisionRenderSystem:UpdateEntity(entity, stepped)

end


function DebugCollisionRenderSystem:Update(stepped)
    for _, entity in pairs(self.Entities) do
        self:UpdateEntity(entity, stepped)
    end
end


return DebugCollisionRenderSystem