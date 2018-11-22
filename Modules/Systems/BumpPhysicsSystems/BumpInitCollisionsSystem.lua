
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")


local BumpInitCollisionsSystem = ECSFramework.System.Extend("BumpInitCollisionsSystem")

BumpInitCollisionsSystem.ComponentRequirement:AllFromList({
    "PositionComponent",
    "CollisionComponent"
})


function BumpInitCollisionsSystem:Initialize(physicsWorld)
    assert(physicsWorld, "BumpInitCollisionsSystem - Bump World not given!")

    self.PhysicsWorld = physicsWorld
end


function BumpInitCollisionsSystem:EntityAdded(entity)
    local positionComponent = entity:GetComponent("PositionComponent")
    local collisionComponent = entity:GetComponent("CollisionComponent")

    local position = positionComponent.Position
    local bounds = collisionComponent.Bounds

    self.PhysicsWorld:add(entity, position.X, position.Y, bounds.X, bounds.Y)
end


function BumpInitCollisionsSystem:EntityRemoved(entity)
    self.PhysicsWorld:remove(entity)
end


return BumpInitCollisionsSystem