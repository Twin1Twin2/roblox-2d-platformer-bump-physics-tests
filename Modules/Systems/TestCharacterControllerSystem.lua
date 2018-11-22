
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")
local ControlBindingsFramework = require("ControlBindingsFramework")

local ControlBindings = ControlBindingsFramework:Get()


local TestCharacterControllerSystem = ECSFramework.System.Extend("TestCharacterControllerSystem")

TestCharacterControllerSystem.ComponentRequirement:AllFromList({
    "CharacterComponent",
    "CollisionComponent",
    "VelocityComponent"
})


function TestCharacterControllerSystem:Initialize()
    self.MoveLeftInput = ControlBindings:GetActionBinding("MoveLeft")
    self.MoveRightInput = ControlBindings:GetActionBinding("MoveRight")
    self.JumpInput = ControlBindings:GetActionBinding("Jump")
end


function TestCharacterControllerSystem:EntityAdded(entity)
    print("TestCharacterControllerSystem - Entity Added!")
end


function TestCharacterControllerSystem:EntityRemoved(entity)
    print("TestCharacterControllerSystem - Entity Removed!")
end


function TestCharacterControllerSystem:UpdateEntity(entity, stepped)
    local characterComponent = entity:GetComponent("CharacterComponent")
    local collisionComponent = entity:GetComponent("CollisionComponent")
    local velocityComponent = entity:GetComponent("VelocityComponent")

    local moveLeftInput = self.MoveLeftInput.Input
	local moveRightInput = self.MoveRightInput.Input
    local jumpIsDown = self.JumpInput.IsDown

    local velocity = velocityComponent.Velocity
    local collisions = collisionComponent.Collisions

    local posYIsDown = characterComponent.PositiveYIsDown
    local gravity = characterComponent.Gravity
    local jumpPower = characterComponent.JumpPower

    local yVelocity = velocity.Y
    local isOnGround = false

    local yValue = 1

    if (posYIsDown == true) then
        yValue = -1
    end

    for _, collision in pairs(collisions) do
        if ((posYIsDown == true and collision.normal.y < 0) or (posYIsDown == false and collision.normal.y > 0)) then
            isOnGround = true
            break
        end
    end

    if (isOnGround == true) then
        if (jumpIsDown == true) then
            yVelocity = jumpPower * yValue
        else
            yVelocity = 0
        end
    else
        yVelocity = yVelocity + ((-gravity * yValue) * stepped)
    end

    local movement = Vector2.new(moveRightInput - moveLeftInput, 0) * 128

    velocityComponent.Velocity = movement + Vector2.new(0, yVelocity)
end


function TestCharacterControllerSystem:Update(stepped)
    for _, entity in pairs(self.Entities) do
        self:UpdateEntity(entity, stepped)
    end
end


return TestCharacterControllerSystem