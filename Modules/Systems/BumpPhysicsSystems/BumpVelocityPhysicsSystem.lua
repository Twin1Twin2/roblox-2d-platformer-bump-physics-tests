
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")


local BumpVelocityPhysicsSystem = ECSFramework.System.Extend("BumpVelocityPhysicsSystem")

BumpVelocityPhysicsSystem.ComponentRequirement:AllFromList({
    "PositionComponent",
    "CollisionComponent",
    "VelocityComponent"
})


function BumpVelocityPhysicsSystem:Initialize(physicsWorld, collisionFilter)
    assert(physicsWorld, "BumpVelocityPhysicsSystem - Bump World not given!")

    self.PhysicsWorld = physicsWorld
    self.CollisionFilter = collisionFilter
end


function BumpVelocityPhysicsSystem:EntityAdded(entity)

end


function BumpVelocityPhysicsSystem:EntityRemoved(entity)

end


function BumpVelocityPhysicsSystem:UpdateEntity(entity, stepped)
    local positionComponent = entity:GetComponent("PositionComponent")
    local velocityComponent = entity:GetComponent("VelocityComponent")
    local collisionComponent = entity:GetComponent("CollisionComponent")

    local position = positionComponent.Position
    local velocity = velocityComponent.Velocity

    local newX = position.X + (velocity.X * stepped)
    local newY = position.Y + (velocity.Y * stepped)

    local collisions, collisionsLength

    newX, newY, collisions, collisionsLength = self.PhysicsWorld:move(entity, newX, newY, self.CollisionFilter)

    positionComponent.Position = Vector2.new(newX, newY)

    collisionComponent.Collisions = collisions
    collisionComponent.CollisionsLength = collisionsLength
end


function BumpVelocityPhysicsSystem:Update(stepped)
    for _, entity in pairs(self.Entities) do
        self:UpdateEntity(entity, stepped)
    end
end


return BumpVelocityPhysicsSystem